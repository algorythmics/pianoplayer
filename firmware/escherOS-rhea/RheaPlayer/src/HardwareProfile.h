/*********************************************************************
 *
 *	Hardware specific definitions for escher boards for TCP/IP Stack
 *
 *********************************************************************
 * FileName:        HardwareProfile.h
 * Dependencies:    Needed for TCPIP.h in TCPIP-Stack
 * Processor:       dsPIC33F, PIC32
 * Company:         Algorythmics
 *
 * Software License Agreement
 *
 * derived from TCP/IP Stack from 2002-2008 Microchip Technology Inc. 
 * for use in Escher Board
 *
 *
 * Author               Date		Comment
 *~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
 * Howard Schlunder		10/03/06	Original, copied from Compiler.h
 * Winfried Ritsch      05/07/08    Adapted for ALGO_DSPIC
 * further logs in svn git etc...
 ********************************************************************/
#ifndef __HARDWARE_PROFILE_H
#define __HARDWARE_PROFILE_H

// Choose which hardware profile to compile for here.  See 
#define ESCHER_V1_00

// Hardware mappings
#if defined(ESCHER_V1_00)
 #include "escherBoard.h"
#else
	#error "Hardware profile not defined.  See available profiles in HardwareProfile.h.  Add the appropriate macro definition to your application configuration file ('TCPIPConfig.h', etc.)"
#endif
#include "escherRTC.h"

// PIC24F, PIC24H, dsPIC30, dsPIC33, PIC32

// Select which UART the STACK_USE_UART and STACK_USE_UART2TCP_BRIDGE 
// options will use.  You can change these to U1BRG, U1MODE, etc. if you 
// want to use the UART1 module instead of UART2.
#define UBRG					U2BRG
#define UMODE					U2MODE
#define USTA					U2STA
#define BusyUART()				BusyUART2()
#define CloseUART()				CloseUART2()
#define ConfigIntUART(a)		ConfigIntUART2(a)
#define DataRdyUART()			DataRdyUART2()
#define OpenUART(a,b,c)			OpenUART2(a,b,c)
#define ReadUART()				ReadUART2()
#define WriteUART(a)			WriteUART2(a)
#define getsUART(a,b,c)			getsUART2(a,b,c)
#if defined(__C32__)
	#define putsUART(a)			putsUART2(a)
#else
	#define putsUART(a)			putsUART2((unsigned int*)a)
#endif
#define getcUART()				getcUART2()
#define putcUART(a)				WriteUART(a)
#define putrsUART(a)			putsUART(a)

#endif /* __HARDWARE_PROFILE_H */