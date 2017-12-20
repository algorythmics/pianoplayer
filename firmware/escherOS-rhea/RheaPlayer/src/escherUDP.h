/*********************************************************************
 *
 *   RheaPlayer - UDP Implementation Header
 *
 *   Application for using Escher and EscherFET16 Boards 
 *   for Autoklavierspieler Rhea
 *
 *	 -Used Libraries Microchip Reference: AN833
 *
 * Note: derived from Demo App of TCP/IP Stack
 *
 *********************************************************************
 * FileName:        escherUDP.h
 * Dependencies:    TCPIP.h
 * Processor:       dsPIC33F
 * Company:         Algorythmics
 * License:         GPL 3.0 (as far microchip allows with the TCP/IP stack)
 *
 * Author              Date         Comment
 *~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
 * W Ritsch			5.7.2008
 *    for Escher and 2 EscherFet16 Boards, 
 *    use only SNTP, UDP, telnet and DHCPClient 
 * W Ritsch			22.2.2010       adapted for Rhea Player 1 FET Board
 * further logs in svn or git or ...
 ********************************************************************/
#ifndef __ESCHERUDP_H
#define __ESCHERUDP_H

// UDP client port for ESCHERUDP Client transactions
#define ESCHERUDP_CLIENT_PORT                (6000u)

// UDP listening port for ESCHERUDP Server messages
#define ESCHERUDP_SERVER_PORT                (6001u)

// Monitoring Messages
#define ESCHERUDP_DISCOVER_MESSAGE	(0u)		// broadcast MAC+IPAddr
#define ESCHERUDP_TICKS_PER_SECOND	(1u)		// TicksPerSecond
#define ESCHERUDP_STATISTICS		(2u)		// Ticks per processing loop

// Message Types returned by read
#define ESCHERUDP_MESSAGE_UNKNOWN            (0u)	// Code for unknown ESCHERUDP message
#define ESCHERUDP_MESSAGE_PLAY               (1u)	// ESCHERUDP Message Type constant
#define ESCHERUDP_MESSAGE_ALLOFF             (2u)	// Length of ESCHERUDP Message Type
#define ESCHERUDP_MESSAGE_INFO               (3u)   // Request for statistics
#define ESCHERUDP_MESSAGE_HOLD               (4u)   // Set Hold factor

#define ESCHERUDP_MESSAGE_HOLDL              (5u)   // Set Hold factor low register
#define ESCHERUDP_MESSAGE_HOLDM              (6u)   // Set Hold factor mid register
#define ESCHERUDP_MESSAGE_HOLDH              (7u)   // Set Hold factor high register

// -------- EscherUDP State Machine --------------
typedef enum _SM_ESCHERUDP
{
	SM_ESCHERUDP_DISABLED = 0,		//  is not currently enabled
	SM_ESCHERUDP_GET_SOCKET,		//  is trying to obtain a socket
	SM_ESCHERUDP_SEND_DISCOVERY,	//	for DHCP ask for IP
	SM_ESCHERUDP_GET_DATA,			//  ESCHERUDP is waiting for a UDP Packet
}   SM_ESCHERUDP;

// Flags for the ESCHERUDP client
typedef union _ESCHERUDP_CLIENT_FLAGS
{
    struct
    {
        unsigned char bIsBound : 1;				// Whether or not Port is currently open
        unsigned char bDataReceived : 1;		// Whether or not an data has been received
    } bits;
    BYTE Val;
} ESCHERUDP_CLIENT_FLAGS;

#if !defined(__ESCHERUDP_C)   // for export to main loop
    extern ESCHERUDP_CLIENT_FLAGS ESCHERUDPFlags;
    extern SM_ESCHERUDP smESCHERUDPState;
	extern BYTE ESCHERUDPBindCount;
	extern int lastPlayedFet;
#endif

// PLAY Modi used from outside NEVER CHANGE only add (16bit)
#define PLAY_NOTE	(0u)
#define PLAY_ALLOFF	(1u)
#define PLAY_HOLD	(2u)
#define PLAY_INFO	(3u)
#define PLAY_HOLDL	(4u)
#define PLAY_HOLDM	(5u)
#define PLAY_HOLDH	(6u)

typedef struct _escherudp_header {
	BYTE	messageType;    // Header 4 Bytes command
	BYTE	mac[3];         // 3  Lower MacAddress Bytes for Identity
	DWORD	ipaddr;         // IP number
}	ESCHERUDP_HEADER;

void ESCHERUDPReset(void);
void ESCHERUDPTask(void);
void ESCHERUDPServerTask(void);
void ESCHERUDPDisable(void);
void ESCHERUDPEnable(void);
void ESCHERUDPSend(BYTE messageType,BYTE* data,WORD wDataLen);

//	This function is a MACRO to ESCHERUDPFlags.bits.bIsBound.
#define ESCHERUDPIsBound()       (ESCHERUDPFlags.bits.bIsBound)

#endif