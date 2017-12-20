/* *******************************************************************
 *
 * Escher PWM Control
 * 8 Motor PWMs with 4 pulswidth gens
 * 8 OC as PWMS
 * 16 SoftPWMs over Timer4
 *
 *********************************************************************
 * FileName:        escherPWM.h
 * Processor:       dsPIC33F (33FJ128MC708)
 * Company:         Algorythmics
 * License: GPL V3.0 
 *
 * Author              Date         Comment
 *~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
 * W Ritsch			2.3.2010       adapted for Rhea Player 1 FET Board
 * logs now in repositories like svn or git...
 * 
 * Comment now:
 ********************************************************************/

#ifndef __ESCHER_PWM_H
#define __ESCHER_PWM_H

/* Motor PWMs Definition:
 Clock Source for PWM Use TCY as Input:
 Here: Fosc=160MHz/4 = 40Mhz =>T_CY=0,025 us	

 T_PWM = (T_CY * (PTPER + 1))/(Prescale * Postscale)
       = (0,025us * (499+1))/(1/4) = 50us = 20 kHz

 PTPER = T_PWM*PTMR_Prescale / T_CY - 1
       = (Fosc/4) * T_PWM * Prescale * Postscale *  - 1

 Sol A: T_PWM = 1/20kHz, Prescale=(1/4),Postscale=1,Fosc/4=40MHz
	PTPER = (40*10^6)/(4*1*20*10^3) - 1 = 500-1 = 499

 Sol B: PTPER = 511,  Prescale=(1/4),Postscale=1,Fosc/4=40MHz
	T_PWM = (1/(40*10^6))*4*1 = 51,2us => F_PWM=19,53125kHz
    (Trick: PWM_DUTYMAX = 1024 so better to scale an 10Bit resolution)
*/

// Input Clock Prescale 2 Bits 
// 00 = 1:1 TCY, 01=1:4 TCY, 10= 1:16, 11=1:64
#define PWM_PRESCALE 0b01

// 4 Bits Output Post Scale Register 
// 0000 ... 1111 = 1:1 ... 1:16
#define PWM_POSTSCALE 0b0000

// see calculation above
#define PWM_PERIOD	 511
// Maximal PDC Value for full resolution
#define PWM_DUTYMAX 2*(PWM_PERIOD+1)

/* --- OC PWM definition -----
 Timer 2 used as source
 Clock Source for PWM Use TCY as Input:
 Here: Fosc=160MHz/4 = 40Mhz =>T_CY=0,025 us	

 OC T_PWM=1/19,53125kHz = 51,2us
         = (PR2 + 1)*T_CY*PRESCALE2
 PRESCALE2=1
 PR2= 51,2us/(0,025us*(1/1))-1= 2047 (11bits res) = 0x07FF 
*/

#define TIMER2_PRESCALE	0b00 	 // prescaler 1 =>  40Mhz
//#define TIMER2_PRESCALE 0b01 // prescaler 8 =>  8Mhz
#define TIMER2_PR		0x07FF	
#define TMR2_RESOLUTION 11 // Bits

#define OC_MAXRS (TIMER2_PR-1)
#define OC_MINRS (2)

/* OCM, MODE xxx for each OC:
   101 ... continous output
   110 ... PWM no fault pin
   111 ... PWM faultpin enabled */
#define OC_OCM 0b101

/* OCTSEL, selected TIME Base:
  0... Timer 2, 1... Timer 3 */
#define OC_OCTSEL 0   /* use timer 2 */

// soft pwms interrupts
#define PWM_IRQ_PRIORITY_RISE	6 // higher than fall
#define PWM_IRQ_PRIORITY_FALL	5 // higher than pulscalc

void InitPWM(void);

__inline__ void setPWM(int nr);
__inline__ void clrPWM(int nr);
__inline__ void holdPWM(int nr);

// control PWMS with value 15Bit will be rounded to resolution
void clearPWMs(void);
void dutyPWM(unsigned int hold);

#endif /* __ESCHER_PWM_H */
