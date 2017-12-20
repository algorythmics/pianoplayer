/* **************************************************
 *
 * Timer 4 - Realtime Task within Interrupt
 *
 *********************************************************************
 * FileName:        rhea_timer4.h
 * Dependencies:
 * Processor:       dsPIC33F (33FJ128MC708)
 * Compiler:		Microchip C30 v3.01 or higher
 * Company:         Algorythmics
 *

 * License: GPL V3.0 
 *
 * Author              Date         Comment
 *~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
 * W Ritsch			26.2.2010       adapted for Rhea Player 1 FET Board

 * Comment now:
 * Timer2 to time Pulse and Hold Phases of PWMs
 ********************************************************************/
#ifndef _RHEA_TIMER4_H
#define _RHEA_TIMER4_H
/*
 Clock Source for PWM Use TCY as Input:
 Here: Fosc=160MHz/4 = 40Mhz =>T_CY=0,025 us	

a)
 T_RES=1/19,53125kHz = 51,2us
         = (PR2 + 1)*(T_CY/PRESCALE2)
 PRESCALE2=1 -> 0b00
 PR2= (51,2us/0,025us/(1/1))-1= 2047 (11bits res) = 0x07FF 

b)
 T_RES=1/20kHz = 50us
         = (PR2 + 1)*T_CY*PRESCALE2
 PRESCALE2=8 -> 0b01
 PR2= (50us/(0,025us*8)))-1= 249  
 */
#define TIMER4_PRESCALE	0b01
#define TIMER4_PR	249  	
#define TIMER4_PRIORITY 4

/* functions */
void Init_Timer4(void); // init and start timer2

#endif
