/**********************************************************************
*
* FileName:        rhea_timer4.c
* Dependencies:   
* Processor:       dsPIC33Fxxxx/PIC24Hxxxx
*
* REVISION HISTORY:
*~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
* Author            Date      Comments on this revision
*~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
* Winfried Ritsch   02/24/20??  using timer4
* log continued in repository... see: "svn log" or "git log" or so.
*
*~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
*
* ADDITIONAL NOTES:
*
* Note: Timer Interrupt TIME is configured in rhea_timer4.h
**********************************************************************/

#if defined(__dsPIC33F__)
#include "p33FJ128MC708A.h"
#elif defined(__PIC24H__)
#include "p24hxxxx.h"
#endif

//#include "TCPIP Stack/TCPIP.h"

#include "rhea.h"   
#include "escherBoard.h"
#include "fet16/fet16.h"
#include "rhea_timer4.h"
    
/*---------------------------------------------------------------------
  Function Name: Init_Timer4
  Description:   Initialize Timer4 for 10us second intervals
  Inputs:        None
  Returns:       None
-----------------------------------------------------------------------*/
void Init_Timer4( void )
{
    T4CON = 0;              // Timer reset
    T4CONbits.TCKPS = TIMER4_PRESCALE;     
//    enSecOsc();             // Enable Secondary Osc
	T4CONbits.TCS = 0;      // Timer2 Clock= Internal 40MIPS
	PR4 = TIMER4_PR;        // Timer2 period register /50= 100kHz 10us 

 	IFS1bits.T4IF = 0;      		 // Reset Timer4 interrupt flag
	IPC6bits.T4IP = TIMER4_PRIORITY; // Timer4 Interrupt priority level=4
 	IEC1bits.T4IE = 1;      		 // Enable Timer4 interrupt
    
	T4CONbits.TON = 1;      // Enable Timer4 and start the counter	
}

/*---------------------------------------------------------------------
  Function Name: _T4Interrupt
  Description:   Timer4 Interrupt Handler
  Inputs:        None
  Returns:       None

only used as default but should be used witout function call
at source code place where it is needed !!!
-----------------------------------------------------------------------*/
#if !defined(RHEA_TIMER4_EXTRA)

static volatile DWORD t4counter = 0;

void __attribute__((interrupt, no_auto_psv)) _T4Interrupt( void )
{
	/* Toggle Port TEST_PIN1 */
    TEST_PIN1 = 1;
    t4counter++;

#if defined(TIMER_INTERRUPT_ESCHER)
	ProcessIOInterrupt(TMR4);
#endif

    TEST_PIN1 = 0;
	/* reset Timer 4 interrupt flag */
 	IFS1bits.T4IF = 0;
}
#endif // #if !defined(RHEA_TIMER4_EXTRA)
