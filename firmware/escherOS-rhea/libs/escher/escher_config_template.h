/*********************************************************************
 *
 *	Escher board individual Configuration Header
 *      individual for each board by now
 * 
 *********************************************************************
 * FileName:        escher_config.h
 * Dependencies:    None
 * Processor:       dsPIC33F, PIC32
 * Compiler:        Microchip C32 v1.10 or higher
 *					Microchip C30 v3.12 or higher
 *					Microchip C18 v3.34 or higher
 *					HI-TECH PICC-18 PRO 9.63PL2 or higher
 * Company:         Algorythmics
 *
 * Individual Configuration for projects in here (copy of template of library)
 *
 * Copyright (C) 2002-2010  Algorytmics Winfried Ritsch
 * Licence: GPL v3.0
 *
 *--------------------------------------------------------------------
 * Only config values are in here, which can be individual for each escher board
 ********************************************************************/
#ifndef __ESCHER_CONFIG_H
#define __ESCHER_CONFIG_H

#include "GenericTypeDefs.h"
#include "Compiler.h"

// ID for MAC and default IP and OSC Domain
#define ESCHER_ID    2l              // int32
#define ESCHER_ID_STRING    "0002"  // 4Bytes !

// Board switch
// Which Board to use, DO IT in MPLAB.X Project Properties->Config
//   as gcc-Preprocessor MACRO for different compiles
//#define  ESCHER1_BOARD
//#define  dsPIC33E_SK_ENC624
//#define EXPLORER16_GP710 // USE EXPLORER16 with dsPIC33FJ256GP710

// Not used anymore (see above):
//#define dsPIC33Estarter // Use the Starterkit with IOexpansion board


// TCP/IP --- Stack
#define ESCHER_USE_DHCP    // if defined DHCP at startup, 
                           // otherwise it can be enabled later

// --- Define RTC Settings and Delay Usage defined for escherRTC.h
#define ESCHER_CLOCK32khz
// if TICK is on internal
#define ESCHER_DELAY_USE_TICK
#define ESCHER_DELAY10US_USE_TICK

// -------- Choose CONFIGURATION Bits Setting here ------------------
// Which clock settings to use (DCI needs specific ones for different Samplerates
#define ESCHER2_DEFAULT_CLOCK_SETTINGS // Default Escher2 board
//#define USE_DCI_TDM_CLOCK_AND_CLOCKCONFIGS // Usage of DCI Module needs own settings
//#define dsPIC33E_HIGHSPEED

#define USE_CONFIG_CS4385 // additional configs e.g. _ALTI2C1 in escher_cs4385.h


#if defined(THIS_IS_MAIN)
//_FGS(GWRP_OFF & GSS_OFF & GCP_OFF); // ????
// JTAG should be disabled as well
_FICD(JTAGEN_OFF & ICS_PGD1);
// Disable Watchdog first, enable by software after boot
_FWDT(FWDTEN_OFF) // Disable Watchdog timer
#endif

// ---------- Config checks, dont change ----------
#if defined(USE_DCI_TDM_CONFIGS) && defined(ESCHER2_DEFAULT_CONFIGURATION_BITS)
#warning escher: multiple definition of CONFIG BITS
#endif

#endif // __ESCHER_CONFIG_H
