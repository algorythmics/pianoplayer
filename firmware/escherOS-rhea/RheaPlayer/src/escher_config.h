/*********************************************************************
 *
 *	Escher board individual Configuration Header
 *  For Rheaplayer New Version
 * 
 *********************************************************************
 * FileName:        escher_config.h
 * Dependencies:    None
 * Processor:       dsPIC33F, PIC32 
 *                  tested on dsPIC33F
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
//#define MY_BOARD_ID						4
//#define MY_DEFAULT_HOST_NAME			"ESCHER004"
#define MY_BOARD_ID						9
#define MY_DEFAULT_HOST_NAME			"ESCHER009"

// Hardware
#define ESCHER1_BOARD
#define RHEA_DOUBLED /* means only 16 FETs per board */

// this should be done by Jumper in future
//#define RHEA_DOUBLE // Rhea double takes FETnr 17-32, else FETnr 0-16
#define RHEA_FET_OFFSET  16 /* if double */

//#define  dsPIC33E_SK_ENC624
//#define EXPLORER16_GP710 // USE EXPLORER16 with dsPIC33FJ256GP710

// Not used anymore (see above):
//#define dsPIC33Estarter // Use the Starterkit with IOexpansion board

/* --- connected hardware ------  */
//#define 

// TCP/IP --- Stack
//#define ESCHER_USE_DHCP  TRUE   // if defined DHCP at startup,
#define ESCHER_USE_DHCP  FALSE  // otherwise it can be enabled later

// --- Define RTC Settings and Delay Usage defined for escherRTC.h
//#define ESCHER_DELAY_USE_TCPIPSTACK
//#define ESCHER_CLOCK32khz
// if TICK is on internal
#define ESCHER_DELAY_USE_TICK
#define ESCHER_DELAY10US_USE_TICK

// -------- Choose CONFIGURATION Bits Setting here ------------------
// Which clock settings to use (DCI needs specific ones for different Samplerates
//#define ESCHER2_DEFAULT_CLOCK_SETTINGS // Default Escher2 board
//#define USE_DCI_TDM_CLOCK_AND_CLOCKCONFIGS // Usage of DCI Module needs own settings
//#define dsPIC33E_HIGHSPEED

#define ESCHER1_DEFAULT_CLOCK_SETTINGS
#define ESCHER1_DEFAULT_CONFIGURATION_BITS
//#define ESCHER_NO_LP_OSC

//#define USE_CONFIG_CS4385 // additional configs e.g. _ALTI2C1 in escher_cs4385.h


// ---------- Config checks, dont change ----------
#if defined(USE_DCI_TDM_CONFIGS) && defined(ESCHER2_DEFAULT_CONFIGURATION_BITS)
#warning escher: multiple definition of CONFIG BITS
#endif

#endif // __ESCHER_CONFIG_H