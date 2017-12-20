/*********************************************************************
 *
 *	Escher AMP8 board CS4385 Configuration Header
 *
 *********************************************************************
 * FileName:        DCI_tdm_clock.h
 * Dependencies:    None
 * Processor:       dsPIC33F, PIC32
 * Compiler:        Microchip C32 v1.10 or higher
 *					Microchip C30 v3.12 or higher
 *					Microchip C18 v3.34 or higher
 *					HI-TECH PICC-18 PRO 9.63PL2 or higher
 * Company:         Algorythmics
 *
 * Software License Agreement
 *
 * Copyright (C) 2002-2010  Algorytmics Winfried Ritsch
 * Licence: GPL v3.0
 *
 * Description: Clocks, Configuratin  Bits and for
 * the use of DCI_tdm module
 ********************************************************************/
#if ! defined(__DCI_tdm_clock_h)
#define __DCI_tdm_clock_h

// define Speed

// Datasheet:
// F_SCL=1/(((1/(F_CY))*(I2CX_BRG+1))+T_globber)
//
// T_Globber ... Pulse Globber Delay: typical 130ns = 0,13 us
// F_CY=67737600 (roughly on FRC OSCTUNED)
//
// I2CX_BRG = F_CY*((1/F_SCL)-T_Globber) - 1
//          = 67,7376MHz*(10us - 0,13us)= 668,57 - 1 => 668
//          = 45,1584MHz*(10us - 0,13us)= 445,71 - 1 => 445
// MAX is 511 !!!!
//
// config for 32kHz, 32Bit, 8 channel since we need MCLK=DATACLK of DA
// BCG_VAL is normally (OSC_FCY/(8*FS))-1 // (1,627 -1) -> see excel

// config for 44.1kHz, 32Bit, 8 channel since we need MCLK=DATACLK of DA
// BCG_VAL is normally (OSC_FCY/(8*FS))-1 // (1,627 -1)

#if defined(USE_DCI_TDM_CLOCK_AND_CLOCKCONFIGS)

#if defined (__dsPIC33E__)

#if defined (dsPIC33E_HIGHSPEED)
//#define OSC_FCY 67737600ul
#define OSC_FCY		(80000000ul)

#define OSC_PLLFDB 72
#define OSC_PLLPRE 0    // N2=2
#define OSC_PLLPOST 0   // N1=2
#define OSC_TUNE 0x0

#define BCG_VAL  2 // DSI not so fast Mode

#else
#define OSC_FCY 45158400ul
#define OSC_PLLFDB 47
#define OSC_PLLPRE 0    // N2=2
#define OSC_PLLPOST 0   // N1=2
#define OSC_TUNE 0x0
#define BCG_VAL  1 // DSI fastest Mode
#endif

#if defined(THIS_IS_MAIN)
_FOSCSEL(FNOSC_FRC & IESO_OFF);
_FOSC(POSCMD_NONE & OSCIOFNC_OFF & FCKSM_CSECMD);
#endif

#elif defined (__dsPIC33F__)
#define OSC_FCY 32768000
#define OSC_PLLFDB 34
#define OSC_PLLPRE 0    // N2=2
#define OSC_PLLPOST 0   // N1=2
#define OSC_TUNE 0x26

//#define I2C_BRG 445 // not tested

// for dsPIC33F Include Config Defines in here !!!!

#endif

#endif // USE_DCI_TDM_CLOCK_AND_CLOCKCONFIGS

// SAMPLE RATE AND DATA FORMAT

// see documentation, since this depends on the Clock settings !!!!
#define	FS          44100
#define CHANNELS    8
#define SAMPLEBITS  (8*sizeof(DCI_SAMPLE)) // 32=24 Bit with 8 zeros
#define FRAMEBITS   (CHANNELS*SAMPLEBITS)  // 256
#define	FCSCK	(FRAMEBITS*FS)             // 256*48Khz= 12288 kHz


#define	LOOPBACKMODE	0


void dciStartOsc(void);
#endif // __DCI_tdm_clock_h
