/* **************************************************
 *
 * Play pulses timed from  Tick
 *
 *********************************************************************
 * FileName:        play_pulses.c
 * Dependencies:
 * Processor:       dsPIC33F (33FJ128MC708)
 * Company:         Algorythmics
 *
 * License: GPL V3.0 
 *
 * Author              Date         Comment
 *~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
 * Winfried Ritsch	   5.7.08       Initial Try
 * W Ritsch			22.2.2010       adapted for Rhea Player 1 FET Board
 * Winfried Ritsch  7.7.2016        corrected timing
 * further logs in svn gits...
 * 
 * Comment now:
 * We use #define FET16_SINGLE for only one board on PWM outs
 * this is not used if PWMs are controlled, but can superceed this. 
 ********************************************************************/
#include    "rhea.h"
#include    "escherBoard.h"
#include	"fet16/fet16.h"
#include	"escherPWM.h"
#include	"play_pulses.h"

PULS_DATA pulse[MAX_FETS];

void init_pulses()
{
	int i;
	for(i=0;i<MAX_FETS;i++){
		pulse[i].puls =0;
		pulse[i].flags.Val = 0;
	}
}

// play note: set trigger and puls=vel
// but wait for interrupt to start relay
// note off zero fet and flags.

void play_fet(unsigned int nr,unsigned int velo)
{
	register unsigned v;
	unsigned int num = nr & MASK_FET_NR;
    
	if (velo > 0x7FFF)
		v = 0;
	else
		v = velo;

	if(v == 0)	// Note off
		stop_fet(num);
	else{         // note on
		pulse[num].puls= v;
		pulse[num].flags.bits.trigger = TRUE;
	}	
}

void stop_fet(unsigned int nr)
{
	clrPWM(nr);
	pulse[nr].flags.Val = 0;
}

void stop_all(void)
{
	init_pulses();
	clearPWMs();
	init_pulses();
}

// ----- Interrupt at Timer4 rate ---------
// PLAY Pulses in interrupt
// this should be done in assembler in future now needs
//
// Without -O:up to 25us of 50us, which is a load of up to 40%....
// with -O1: 12-14us, 25% CPU (0.9us T3,T2)
// with -Os: 10-12us, 20% CPU

#if defined(RHEA_TIMER4_EXTRA)

void __attribute__((interrupt, no_auto_psv)) _T4Interrupt( void )
{
	/* Toggle Port TEST_PIN1 */
/*    TEST_PIN1_SET(); */

	int i = MAX_FETS;
	PULS_DATA *puls = &pulse[MAX_FETS-1]; 
	// top down MAX to 0

	while(i--){

		// attack phase count puls
		if(puls->flags.bits.play) 
		{
			if(--(puls->puls) == 0) // exit phase to hold
			{
				holdPWM(i); // go to hold
				puls->flags.bits.play = FALSE;
                TEST_PIN1_UNSET();
			}
		}	
		else if (puls->flags.bits.trigger)  // start attack
		{
			setPWM(i);
			puls->flags.Val = 0b110; // hold and play, no trigger
            TEST_PIN1_SET();
		} 
		//else if (puls->flags.bits.hold)// nothing to do on hold
		//{
		// set hold puls
		//puls->flags.bits.hold = FALSE;
		//}

		puls--; // next puls
	}

#if defined(TIMER_INTERRUPT_ESCHER)
static volatile DWORD t4counter = 0;
    t4counter++;
	ProcessIOInterrupt(TMR4);
#endif

	/* reset Timer 4 interrupt flag */
 	IFS1bits.T4IF = 0;
}
#endif // #if defined(RHEA_TIMER4_EXTRA)