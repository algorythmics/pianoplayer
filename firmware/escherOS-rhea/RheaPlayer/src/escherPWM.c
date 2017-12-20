/* *******************************************************************
 *
 * Escher PWM Control
 * 8 Motor PWMs with 4 pulswidth gens
 * 8 OC as PWMS
 * 16 SoftPWMs over Timer4
 *
 *********************************************************************
 * FileName:        escherPWM.c
 * Dependencies:
 * Processor:       dsPIC33F (33FJ128MC708)
 * Company:         Algorythmics
 *
 * License: GPL V3.0 
 *
 * Author              Date         Comment
 *~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
 * W Ritsch			2.3.2010       adapted for Rhea Player 1 FET Board
 * logs now in repositories like svn or git in future
 * Comment now:
 * use if fets not directly used 
 * TODO: (make compatible with escher_fet16.c) 
 ********************************************************************/

#include <p33FJ128MC708A.h>
#include "rhea.h"
#include "fet16/fet16.h"
#include "escherBoard.h"
#include "escherPWM.h"

int oc_holdduty = 64; // stores hold value for OCs

void InitPWM(void)
{
// MotorPWMs are PWMs connected to EscherFET I/O 1..8 

	// Clock Source for PWM
	// Enable Time Base Timer Enable Bit
	PTCONbits.PTEN = 1; // enable

    // 4 Bits Output Post Scale Register 
    // 0000 ... 1111 = 1:1 ... 1:16
	PTCONbits.PTOPS = PWM_POSTSCALE; // postscale

    // Input Clock Prescale 2 Bits 
    // 00 = 1:1 TCY, 01=1:4 TCY, 10= 1:16, 11=1:64
    PTCONbits.PTCKPS = PWM_PRESCALE;   // prescale = 1:4

	// until where PTMR counts + 1
	PTPERbits.PTPER = PWM_PERIOD; 

	// Mode of running
	// 00..free running, 01..singe pulse, 
    // 10..cont.UP/DOWN,11..cont.UP/DOWN 2 Interrupts
    PTCONbits.PTMOD = 0b00; // free running

	// PTMR = 15 Bit counter, PTMR<15>=direction read only
    PTMRbits.PTMR = 0; // start timer count at zero

	// PWM in independent MODE
	// 1.. independent, 0..complementary
	PWMCON1bits.PMOD1 = 1; // independent Mode
	PWMCON1bits.PMOD2 = 1; // independent Mode
	PWMCON1bits.PMOD3 = 1; // independent Mode
	PWMCON1bits.PMOD4 = 1; // independent Mode

	// overide sync 
    // 0.. next T_CY cycle, 1..next pwm cycle
	PWMCON2bits.OSYNC = 1; //override sync with PWM

	// Special Events output postscale
    // 0000 = 1:1 ... 1111 = 1:16
    PWMCON2bits.SEVOPS = 0b0000;

	// Update PDC register sync
    // 0 = synced with PWM, 1 = immidiatly
	PWMCON2bits.IUE = 0;

    // UDIS: PWM Update disable
    // 0=enabled, 1..disabled
	PWMCON2bits.UDIS = 0;

	//DTCON1: Deadtime Unit not used
	// Prescale Bits and Values default to zero
	DTCON1 = 0;

	//DTCON2: Deadtime selectors are disabled
	// DTSnA: active bit: 0 from Unit A, 1 from UnitB
	// DTSnI: inactive bit: 0 from Unit A, 1 from UnitB
	DTCON2 = 0;	

	// SEVTCMP: Special events trigger bits
	// SEVTDIR: 1.. event if dir changes, 0..off
	// SEVTCMP: special event if 15bit value <14:0> equal
	SEVTCMPbits.SEVTDIR = 0;	
	SEVTCMPbits.SEVTCMP = 0;

	// Start with Overwrite enabled Output low for all
	// POVDnH,PVDnL: 0..overwrite on, 1 ... PWM output
    OVDCON = 0x0000; // Overwrite Enable, Output Low
//    OVDCONbits.POVD1H = 0; // Overwrite disable
//    OVDCONbits.POVD1L = 0; // Overwrite disable
//    OVDCONbits.POUT1H = 0; // Overwrite is Low
//    OVDCONbits.POUT1L = 0; // Overwrite is LOW


	// start with DUTY cycle 0.25 => 64 von 256 
	dutyPWM(64);

    // ennable all
    // 1..enable, 0..use as GPIO Pin
	PWMCON1bits.PEN1L = 1; // enable PWMs
	PWMCON1bits.PEN2L = 1; // enable PWMs
	PWMCON1bits.PEN3L = 1; // enable PWMs
	PWMCON1bits.PEN4L = 1; // enable PWMs
#ifndef SOFTHOLD4
	PWMCON1bits.PEN1H = 1;
	PWMCON1bits.PEN2H = 1;
	PWMCON1bits.PEN3H = 1;
	PWMCON1bits.PEN4H = 1;
#else
   	PWMCON1bits.PEN1H = 0;
	PWMCON1bits.PEN2H = 0;
	PWMCON1bits.PEN3H = 0;
	PWMCON1bits.PEN4H = 0;
#endif
// ----- OC PWMS ---------

// First Init Timer 2
   T2CON = 0;              // Timer reset
   T2CONbits.TCKPS = TIMER2_PRESCALE;
   PR2 = TIMER2_PR;        // Timer2 period register /50= 100kHz 10us 
   T2CONbits.T32 = 0;      // use 16 bit timmer not 32bit
   T2CONbits.TCS = 0;      // Timer2 Clock= Internal 40MIPS
   T2CONbits.TSIDL = 1;    // Timer2  stop in idle mode
   T2CONbits.TGATE = 0;    // Timer2 gated time accumulation disabled

// 	IFS0bits.T2IF = 0;      		 // Reset Timer2 interrupt flag
//	IPC1bits.T2IP = TIMER4_PRIORITY; // Timer2 Interrupt priority level=4
// 	IEC0bits.T2IE = 1;      		 // Enable Timer2 interrupt
    

	// Start Duty Cycle with zero Init
	// this has be done before MODE setting
	OC1R = OC2R = OC3R = OC4R = OC5R = OC6R = OC7R = OC8R = 0;

	// set continous mode
	OC1CONbits.OCM = OC_OCM;
	OC2CONbits.OCM = OC_OCM;
	OC3CONbits.OCM = OC_OCM;
	OC4CONbits.OCM = OC_OCM;
	OC5CONbits.OCM = OC_OCM;
	OC6CONbits.OCM = OC_OCM;
	OC7CONbits.OCM = OC_OCM;
	OC8CONbits.OCM = OC_OCM;

	// select timer to use
	OC1CONbits.OCTSEL = OC_OCTSEL;
	OC2CONbits.OCTSEL = OC_OCTSEL;
	OC3CONbits.OCTSEL = OC_OCTSEL;
	OC4CONbits.OCTSEL = OC_OCTSEL;
	OC5CONbits.OCTSEL = OC_OCTSEL;
	OC6CONbits.OCTSEL = OC_OCTSEL;
	OC7CONbits.OCTSEL = OC_OCTSEL;
	OC8CONbits.OCTSEL = OC_OCTSEL;

	// stop on idle
	OC1CONbits.OCSIDL = 1;
	OC2CONbits.OCSIDL = 1;
	OC3CONbits.OCSIDL = 1;
	OC4CONbits.OCSIDL = 1;
	OC5CONbits.OCSIDL = 1;
	OC6CONbits.OCSIDL = 1;
	OC7CONbits.OCSIDL = 1;
	OC8CONbits.OCSIDL = 1;


	// start DUTY Cycle count with null
	OC1RS=OC2RS=OC3RS=OC4RS=OC5RS=OC6RS=OC7RS=OC8RS= 0;
	dutyPWM(64);

    // Enable IO-Pins will disable OC !!!
    // timer 2 started at end of initialization !

#if !defined (FET16_SINGLE)

	// start interrupts for soft PWM outs

	// note this interrupt should be disabled on low
	// duty cycle since to slow !!!

	// -- starting edge at TMR2 Interrupt
	IPC1bits.T2IP = PWM_IRQ_PRIORITY_RISE; 
 	IFS0bits.T2IF = 0; // Reset Timer4 interrupt flag
 	IEC0bits.T2IE = 1; // Enable Timer4 interrupt

	// -- stopping edge  with timer 3

	// First Init like Timer 2
   	T3CON = 0;              // Timer reset
   	T3CONbits.TCKPS = TIMER2_PRESCALE;
   	T3CONbits.TCS = 0;      // Timer2 Clock= Internal 40MIPS
   	T3CONbits.TSIDL = 1;    // Timer2  stop in idle mode
   	T3CONbits.TGATE = 0;    // Timer2 gated time accumulation disabled

	// now set by holdduty
   	//PR3 = TIMER2_PR;        // Timer2 period register /50= 100kHz 10us 
	
	IPC2bits.T3IP = PWM_IRQ_PRIORITY_FALL;
	IFS0bits.T3IF = 0;	// Reset Timer4 interrupt flag
	IEC0bits.T3IE = 1;	// Enable Timer4 interrupt

	// TIMER3 is enable on interupt of TIMER 2
#endif // !FET16_SINGLE

	// Last enable Timer to start OC and SoftPWM
	T2CONbits.TON = 1;      // Enable Timer2 and start the counter	
}

#if !defined (FET16_SINGLE)

// should move to more common place
typedef struct _HOLD16 {
	unsigned bit0:1;
	unsigned bit1:1;
	unsigned bit2:1;
	unsigned bit3:1;
	unsigned bit4:1;
	unsigned bit5:1;
	unsigned bit6:1;
	unsigned bit7:1;
	unsigned bit8:1;
	unsigned bit9:1;
	unsigned bit10:1;
	unsigned bit11:1;
	unsigned bit12:1;
	unsigned bit13:1;
	unsigned bit14:1;
	unsigned bit15:1;
} HOLD16;

HOLD16 holdbits;

#define set_hold(nr) \
	__asm__ volatile(" bset	%0, #%1 " ::"U" (holdbits),"i" (nr)); 

#define unset_hold(nr) \
	__asm__ volatile(" bclr	%0, #%1 " ::"U" (holdbits), "i" (nr)); 

//	__asm__ volatile(" bclr	%0, nr " ::"i" (holdbits) ); 


#define spwm_rise(nr,port,bitnr) \
	__asm__ volatile(" btsc	%0, #%1" ::"U"(holdbits),"i"(nr) ); \
	__asm__ volatile(" bset	%0, #%1" :: "U"(port), "i"(bitnr))

#define spwm_fall(nr,port,bitnr) \
	__asm__ volatile(" btsc	%0, #%1" ::"U"(holdbits), "i"(nr)); \
	__asm__ volatile(" bclr	%0, #%1" :: "U"(port), "i"(bitnr))

// TMR2 Interrupt - set pwmpulse for soft pwms
void __attribute__((interrupt, no_auto_psv)) _T2Interrupt( void )
{
	// Toggle Port TEST_PIN
	TEST_PIN3_SET();

	// start TIMER3 first so PINs are stopped
	// because this has higher priority, stop will be done
	// afterwards
	TMR3=0;
    T3CONbits.TON = 1;      // Enable Timer3 and start the counter	

	spwm_rise(0,LATB,0);
	spwm_rise(1,LATB,1);
	spwm_rise(2,LATB,2);
	spwm_rise(3,LATB,3);
	spwm_rise(4,LATB,4);
	spwm_rise(5,LATB,5);
	spwm_rise(6,LATB,6);
	spwm_rise(7,LATB,7);
	spwm_rise(8,LATB,10);
	spwm_rise(9,LATB,11);
	spwm_rise(10,LATB,12);
	spwm_rise(11,LATB,13);
	spwm_rise(12,LATB,14);
	spwm_rise(13,LATB,15);
	spwm_rise(14,LATC,1); // RC1
	spwm_rise(15,LATC,2); // RC2

	// reset Timer 2 interrupt flag
 	IFS0bits.T2IF = 0;

    TEST_PIN3_UNSET();
}

// TMR3 Interrupt - unset pwm-pulse

void __attribute__((interrupt, no_auto_psv)) _T3Interrupt( void )
{
    T3CONbits.TON = 0;      // Disable TIMER3 and start the counter	

	/* Toggle Port TEST_PIN1 */
    TEST_PIN4_SET();

	spwm_fall(0,LATB,0);
	spwm_fall(1,LATB,1);
	spwm_fall(2,LATB,2);
	spwm_fall(3,LATB,3);
	spwm_fall(4,LATB,4);
	spwm_fall(5,LATB,5);
	spwm_fall(6,LATB,6);
	spwm_fall(7,LATB,7);
	spwm_fall(8,LATB,10);
	spwm_fall(9,LATB,11);
	spwm_fall(10,LATB,12);
	spwm_fall(11,LATB,13);
	spwm_fall(12,LATB,14);
	spwm_fall(13,LATB,15);
	spwm_fall(14,LATC,1); // RC1
	spwm_fall(15,LATC,2); // RC2

    TEST_PIN4_UNSET();
	/* reset Timer 3 interrupt flag */
 	IFS0bits.T3IF = 0;
}

#endif // !FET16_SINGLE

// ---------- set OUTs to active state (Pulse) -----------
__inline__ void setPWM(int nr)
{
	switch(nr)
	{
	// MOTORPWMs
	case 0: OVDCONbits.POUT1L = 1; OVDCONbits.POVD1L = 0; break; 
	case 1: OVDCONbits.POUT1H = 1; OVDCONbits.POVD1H = 0; break; 
	case 2: OVDCONbits.POUT2L = 1; OVDCONbits.POVD2L = 0; break; 
	case 3: OVDCONbits.POUT2H = 1; OVDCONbits.POVD2H = 0; break; 
	case 4: OVDCONbits.POUT3L = 1; OVDCONbits.POVD3L = 0; break; 
	case 5: OVDCONbits.POUT3H = 1; OVDCONbits.POVD3H = 0; break; 
	case 6: OVDCONbits.POUT4L = 1; OVDCONbits.POVD4L = 0; break; 
	case 7: OVDCONbits.POUT4H = 1; OVDCONbits.POVD4H = 0; break; 
	//OCs here
	case 8: OC1RS = OC_MAXRS; break; 
	case 9: OC2RS = OC_MAXRS; break; 
	case 10: OC3RS = OC_MAXRS; break; 
	case 11: OC4RS = OC_MAXRS; break; 
	case 12: OC5RS = OC_MAXRS; break; 
	case 13: OC6RS = OC_MAXRS; break; 
	case 14: OC7RS = OC_MAXRS; break; 
	case 15: OC8RS = OC_MAXRS; break; 

#if !defined (FET16_SINGLE)
	case 16: FET16=FET_ON; unset_hold(0); break; 
	case 17: FET17=FET_ON; unset_hold(1); break; 
	case 18: FET18=FET_ON; unset_hold(2); break; 
	case 19: FET19=FET_ON; unset_hold(3); break; 
	case 20: FET20=FET_ON; unset_hold(4); break; 
	case 21: FET21=FET_ON; unset_hold(5); break; 
	case 22: FET22=FET_ON; unset_hold(6); break; 
	case 23: FET23=FET_ON; unset_hold(7); break; 
	case 24: FET24=FET_ON; unset_hold(8); break; 
	case 25: FET25=FET_ON; unset_hold(9); break; 
	case 26: FET26=FET_ON; unset_hold(10); break; 
	case 27: FET27=FET_ON; unset_hold(11); break; 
	case 28: FET28=FET_ON; unset_hold(12); break; 
	case 29: FET29=FET_ON; unset_hold(13); break; 
	case 30: FET30=FET_ON; unset_hold(14); break; 
	case 31: FET31=FET_ON; unset_hold(15); break; 
#endif
	}
}

// -------- set OUTs to Inactive State -------------
__inline__ void clrPWM(int nr)
{
	switch(nr)
	{
	// MOTORPWMs
	case 0: OVDCONbits.POUT1L = 0; OVDCONbits.POVD1L = 0; break; 
	case 1: OVDCONbits.POUT1H = 0; OVDCONbits.POVD1H = 0; break; 
	case 2: OVDCONbits.POUT2L = 0; OVDCONbits.POVD2L = 0; break; 
	case 3: OVDCONbits.POUT2H = 0; OVDCONbits.POVD2H = 0; break; 
	case 4: OVDCONbits.POUT3L = 0; OVDCONbits.POVD3L = 0; break; 
	case 5: OVDCONbits.POUT3H = 0; OVDCONbits.POVD3H = 0; break; 
	case 6: OVDCONbits.POUT4L = 0; OVDCONbits.POVD4L = 0; break; 
	case 7: OVDCONbits.POUT4H = 0; OVDCONbits.POVD4H = 0; break; 
	//OCs here
	case 8: OC1RS = OC_MINRS; break; 
	case 9: OC2RS = OC_MINRS; break; 
	case 10: OC3RS = OC_MINRS; break; 
	case 11: OC4RS = OC_MINRS; break; 
	case 12: OC5RS = OC_MINRS; break; 
	case 13: OC6RS = OC_MINRS; break; 
	case 14: OC7RS = OC_MINRS; break; 
	case 15: OC8RS = OC_MINRS; break; 

	//SoftPWMs here
#if !defined (FET16_SINGLE)
	case 16: FET16=FET_OFF; unset_hold(0); break; 
	case 17: FET17=FET_OFF; unset_hold(1); break; 
	case 18: FET18=FET_OFF; unset_hold(2); break; 
	case 19: FET19=FET_OFF; unset_hold(3); break; 
	case 20: FET20=FET_OFF; unset_hold(4); break; 
	case 21: FET21=FET_OFF; unset_hold(5); break; 
	case 22: FET22=FET_OFF; unset_hold(6); break; 
	case 23: FET23=FET_OFF; unset_hold(7); break; 
	case 24: FET24=FET_OFF; unset_hold(8); break; 
	case 25: FET25=FET_OFF; unset_hold(9); break; 
	case 26: FET26=FET_OFF; unset_hold(10); break; 
	case 27: FET27=FET_OFF; unset_hold(11); break; 
	case 28: FET28=FET_OFF; unset_hold(12); break; 
	case 29: FET29=FET_OFF; unset_hold(13); break; 
	case 30: FET30=FET_OFF; unset_hold(14); break; 
	case 31: FET31=FET_OFF; unset_hold(15); break; 
#endif
	}
}

// ------ set Outs to HOLD State ---------------------
__inline__ void holdPWM(int nr)
{
	switch(nr)
	{
	// MOTORPWMs
	case 0: OVDCONbits.POUT1L = 0; OVDCONbits.POVD1L = 1; break; 
	case 1: OVDCONbits.POUT1H = 0; OVDCONbits.POVD1H = 1; break; 
	case 2: OVDCONbits.POUT2L = 0; OVDCONbits.POVD2L = 1; break; 
	case 3: OVDCONbits.POUT2H = 0; OVDCONbits.POVD2H = 1; break; 
	case 4: OVDCONbits.POUT3L = 0; OVDCONbits.POVD3L = 1; break; 
	case 5: OVDCONbits.POUT3H = 0; OVDCONbits.POVD3H = 1; break; 
	case 6: OVDCONbits.POUT4L = 0; OVDCONbits.POVD4L = 1; break; 
	case 7: OVDCONbits.POUT4H = 0; OVDCONbits.POVD4H = 1; break; 
	//OCs here
	case 8: OC1RS = oc_holdduty; break; 
	case 9: OC2RS = oc_holdduty; break; 
	case 10: OC3RS = oc_holdduty; break; 
	case 11: OC4RS = oc_holdduty; break; 
	case 12: OC5RS = oc_holdduty; break; 
	case 13: OC6RS = oc_holdduty; break; 
	case 14: OC7RS = oc_holdduty; break; 
	case 15: OC8RS = oc_holdduty; break; 

	//SoftPWMs here
#if !defined (FET16_SINGLE)
	case 16: FET16=FET_OFF; set_hold(0); break; 
	case 17: FET17=FET_OFF; set_hold(1); break; 
	case 18: FET18=FET_OFF; set_hold(2); break; 
	case 19: FET19=FET_OFF; set_hold(3); break; 
	case 20: FET20=FET_OFF; set_hold(4); break; 
	case 21: FET21=FET_OFF; set_hold(5); break; 
	case 22: FET22=FET_OFF; set_hold(6); break; 
	case 23: FET23=FET_OFF; set_hold(7); break; 
	case 24: FET24=FET_OFF; set_hold(8); break; 
	case 25: FET25=FET_OFF; set_hold(9); break; 
	case 26: FET26=FET_OFF; set_hold(10); break; 
	case 27: FET27=FET_OFF; set_hold(11); break; 
	case 28: FET28=FET_OFF; set_hold(12); break; 
	case 29: FET29=FET_OFF; set_hold(13); break; 
	case 30: FET30=FET_OFF; set_hold(14); break; 
	case 31: FET31=FET_OFF; set_hold(15); break; 
#endif

	}
}

// ------  Duty Cycle for all PWMs ----------------------
// value = 8Bit number will be scaled to resolution 
// 2^8=256

void dutyPWM(unsigned int hold)
{
	unsigned int value;

	if(hold > 190)
		value = 190;
	else
	 	value = hold;

	// MOTOR PWMs Be carfully with int rech since this is only right on 2^n
	unsigned int num = value * (PWM_DUTYMAX/256);
	PDC1 = PDC2 = PDC3 = PDC4 = num;

	// OC_PWMs
	oc_holdduty = value*8 + 2 ; /* if 2048 is counter */

	// SoftPWMS (should be synced to interrupt of MotorPWMs)
	PR3=oc_holdduty;

}

// --- clear all PWMS

void clearPWMs(void)
{
int i = MAX_FETS;
while(i--)
	clrPWM(i);
}