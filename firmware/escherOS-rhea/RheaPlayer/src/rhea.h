/*********************************************************************
 *
 *   RheaPlayer - Master settings and Header File
 *
 *   Application for using Escher and EscherFET16 Boards 
 *   for Autoklavierspieler Rhea
 *
 *	 -Used Libraries: TCP/IP Stack Microchip, Reference: AN833
 *
 *
 *********************************************************************
 * FileName:        rhea.h
 * Processor:       dsPIC33F
 * Compiler:		Microchip C30 v3.01 or higher
 * Company:         Algorythmics
 *
 * Author              Date         Comment
 *~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
 * W Ritsch			5.7.2008
 *    for Escher and 2 EscherFet16 Boards, 
 *    use only SNTP, UDP, telnet and DHCPClient 
 * W Ritsch			22.2.2010       adapted for Rhea Player 1 FET Board
 * W.Ritsch 18.8.2010 updated for Master slave operation
 * W.Ritsch 1.3.2011 corrected and added hold for low, mid and upper register
 * w.ritsch 6.7.2016 added Hold for every note 
 * log continued in repository... see: "svn log" or "git log" or so.
********************************************************************/
#ifndef _RHEA_H
#define _RHEA_H
/* use these types */
#include <GenericTypeDefs.h>
#include "HardwareProfile.h"

/* Rhea specific settings for this application */
#define RHEAOS_VERSION "1.2"

 /* Changes:
  1.1: added Hold for register low, high and mid and 
  1.2: added Hold for every note on native pwms,oc */


/* Fixed definition for this OS Version, no config option */

#ifdef RHEA_DOUBLED
 #define FET16_SINGLE  /* Only use one fetboard on PWM/OC Ports */
#endif

#define FET16_PWMS	  /* Use PWMS instead of FET IOs for first FETboard */
//#define CLOCK32KHZ // Use realtime clock for Timer1 in Tick.h/.c for the stack

// JUMPER DEFINITION
#define RHEA_MASTER_PIN	P2_P4 // should be RG3, patched in serial cable !!	
#define RHEA_MASTER_SELECTED 1 // if port is high its a master else slave
// macro function can be exchanged with more complex detection later
#define rhea_is_master() (RHEA_MASTER_PIN == RHEA_MASTER_SELECTED)

// behaviour
#define EMERGENCY_OFFTIME 100ul /*seconds no data -> all off */

//define behaviour of IOProcess Timer 
//(should be Realtime in future)

// user Extra interrupt routine at module which need it
// this application in play_pulses
#define RHEA_TIMER4_EXTRA 

// define if extra ProcessIO() is done in rhea.c (not needed until now.)
//#define TIMER_INTERRUPT_ESCHER 
/* if additional IO processing is done, include this here */
#if defined(TIMER_INTERRUPT_ESCHER)
	void ProcessIOInterrupt();
#endif

// On board LEDS
#define ACTIVE_LED	OB_LED0
#define NETWORK_LED	OB_LED1
#define	DATA_LED	OB_LED2
#define ERROR_LED	OB_LED3

/* define TICK as 32bit word for this application,
same as in the TCP/IP Stack TICK */

typedef DWORD RHEA_TICK;
// 6 byte ticks are used
#define RHEA_TICK_MAX (0xFFFFFFFFFFFFul) // ul

/* statistic for scheduler */
// Loop statistics for reporting
typedef struct _dt_statistic
{
	RHEA_TICK max;   // max ticks of mainloop
	RHEA_TICK min;   // min ticks of mainloop
	RHEA_TICK count; // loops for monitored
	RHEA_TICK time;  // time in ticks at report lower 32Bit
	RHEA_TICK tps;   // ticks per second
} DT_STATISTIC;
void sendStatistics(void);

/* for ENC28J60 connection */ 
//#define BAUD_RATE       (115200)		// bps for uart

/* defined in rhea.c for TCP/IPSTACK */
#if !defined(THIS_IS_STACK_APPLICATION)
	extern BYTE AN0String[8];
#endif

/* global function from rhea.c */
//void DoUARTConfig(void);

/* if usage of EEPROM or beeing implemented in EEPROM */
#if (defined(MPFS_USE_EEPROM) || defined(MPFS_USE_SPI_FLASH)) && (defined(STACK_USE_MPFS) || defined(STACK_USE_MPFS2))
	void SaveAppConfig(void);
#else
	#define SaveAppConfig()
#endif

// for debugging and testing timing of interrupts.
#define TEST_PINS 
#if defined(TEST_PINS)
	#define TEST_PIN1 P0_IO26               /* used for Pulse attack/trigger */
	#define TEST_PIN1_TRIS P0_IO26_TRIS
	#define TEST_PIN2 P0_IO27               /* main loop calculation time */
	#define TEST_PIN2_TRIS P0_IO27_TRIS
	#define TEST_PIN3 P1_IO26
	#define TEST_PIN3_TRIS P1_IO26_TRIS
	#define TEST_PIN4 P1_IO27
	#define TEST_PIN4_TRIS P1_IO27_TRIS

    #define TEST_PIN1_SET() { TEST_PIN1=1;}
    #define TEST_PIN2_SET() { TEST_PIN2=1;}
    #define TEST_PIN3_SET() { TEST_PIN3=1;}
    #define TEST_PIN4_SET() { TEST_PIN4=1;}
    #define TEST_PIN1_UNSET() { TEST_PIN1=0;}
    #define TEST_PIN2_UNSET() { TEST_PIN2=0;}
    #define TEST_PIN3_UNSET() { TEST_PIN3=0;}
    #define TEST_PIN4_UNSET() { TEST_PIN4=0;}
    #define TEST_PIN1_TOGGLE() { TEST_PIN1^=0b1;}
    #define TEST_PIN2_TOGGLE() { TEST_PIN2^=0b1;}
    #define TEST_PIN3_TOGGLE() { TEST_PIN3^=0b1;}
    #define TEST_PIN4_TOGGLE() { TEST_PIN4^=0b1;}
 #else
    #define TEST_PIN1_SET() 
    #define TEST_PIN2_SET() 
    #define TEST_PIN3_SET() 
    #define TEST_PIN4_SET() 
    #define TEST_PIN1_UNSET() 
    #define TEST_PIN2_UNSET() 
    #define TEST_PIN3_UNSET() 
    #define TEST_PIN4_UNSET() 
    #define TEST_PIN1_TOGGLE()
    #define TEST_PIN2_TOGGLE()
    #define TEST_PIN3_TOGGLE()
    #define TEST_PIN4_TOGGLE()
#endif

#endif // _RHEA_H
