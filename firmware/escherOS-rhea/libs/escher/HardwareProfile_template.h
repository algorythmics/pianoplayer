/*********************************************************************
 *
 *	Hardware specific definitions for TCPIP/Stack on Escher Board
 *      includes the escherBoard.h
 *      for: Ethernet PICtail Plus (ENC28J60)
 *
 *********************************************************************
 * FileName:        HardwareProfile.h
 * Dependencies:    Compiler.h
 * Processor:       PIC24F, PIC24H, dsPIC30F, dsPIC33F
 * Compiler:        Microchip C30 v3.24 or higher
 * Company:         Algorythmics
 *
 * Modified by Algorytmics Winfried Ritsch for for use with
 * escher board which contains ENC28J60 within License Agreement.
 * Description:
 * All Hardware definitions should be referenced within here
 * mostly defined in escherboard.h
 * 
 * Author               Date		Comment
 *~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
 * Howard Schlunder		09/16/2010	Regenerated for specific boards
 * Winfried Ritsch              02/02/2012      newly adapted
 *
 *  ********************************************************************/
#ifndef HARDWARE_PROFILE_H
#define HARDWARE_PROFILE_H

#include "escherBoard.h" // PIN declaration and default clock, configs
#include "DCI_tdm_clock.h" // Defines from DCI_tdm modules (maybe Clock)
#include "escherRTC.h"   // how realtime clock is done

#endif // #ifndef HARDWARE_PROFILE_H
