/*********************************************************************
 *
 *   RheaPlayer - UDP Implementation 
 *
 *   Application for using Escher and EscherFET16 Boards 
 *   for Autoklavierspieler Rhea
 *
 *	 -Used Libraries Microchip Reference: AN833
 *
 * Note: derived from Demo App of TCP/IP Stack
 *
 *********************************************************************
 * FileName:        escherUDP.c
 * Dependencies:    TCPIP.h, escherUDP.h, escher.h, escher_fet16.h, rhea.h
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

 ********************************************************************/
/* --- rhea specific settings ---- */
#include "rhea.h"
#include "escherBoard.h"
#include "fet16/fet16.h"
#include "escherPWM.h"
#include "escherUART.h"
#include "TCPIP Stack/TCPIP.h"
#include "escherSerial.h"
#include "play_pulses.h"

#define __ESCHERUDP_C
#include "escherUDP.h"

#define Escher_TIMEOUT (RHEA_TICK)(2ul*TICKS_PER_SECOND)  

// EscherUDP state machine variable
SM_ESCHERUDP smESCHERUDPState = SM_ESCHERUDP_GET_SOCKET;

// ESCHERUDP Client Flags to use	
ESCHERUDP_CLIENT_FLAGS ESCHERUDPFlags = {{0x00}};

// Socket for ESCHERUDP client to use
static UDP_SOCKET ESCHERUDPSocket = INVALID_UDP_SOCKET;

BYTE ESCHERUDPBindCount = 0;			// Counts how many times ESCHERUDP has been bound

/* received data storage */
#define ESCHERPACKETSIZE (sizeof(ep_timestamp)+sizeof(ep_type)+sizeof(ep_relaisnr)+sizeof(ep_velocity))
static	DWORD ep_timestamp;
static  BYTE  ep_type;
static	unsigned char  ep_relaisnr;
static	WORD  ep_velocity;
static BYTE	ep_hold;

int lastPlayedFet;

// private functions:
static BYTE _ESCHERUDPReceive(void);

/*****************************************************************************
  Function:
	void ESCHERUDPReset(void)

  Summary:
	Resets the ESCHERUDP Client.

  Description:
	Resets the ESCHERUDP Client, giving up any current lease, knowledge of 
	ESCHERUDP servers, etc.

  Precondition:
	None

  Parameters:
	None

  Returns:
  	None
  ***************************************************************************/
void ESCHERUDPReset(void)
{
    // Do nothing if ESCHERUDP is disabled
    if(smESCHERUDPState == SM_ESCHERUDP_DISABLED)
        return;

    if(ESCHERUDPSocket != INVALID_UDP_SOCKET)
		smESCHERUDPState = SM_ESCHERUDP_GET_SOCKET;

    ESCHERUDPBindCount = 0;
    ESCHERUDPFlags.bits.bIsBound = FALSE;
}


/*****************************************************************************
  Function:
	void ESCHERUDPDisable(void)

  Summary:
	Disables the ESCHERUDP Client.

  Description:
	Disables the ESCHERUDP client by sending the state machine to 
	"SM_ESCHERUDP_DISABLED".  If the board was previously configured by ESCHERUDP, the
	port will continue to be used but the module will no longer
	preform any reactions on input.

  Precondition:
	None

  Parameters:
	None

  Returns:
  	None
  	
  Remarks:
  ***************************************************************************/
void ESCHERUDPDisable(void)
{
	if(ESCHERUDPSocket != INVALID_UDP_SOCKET)
	{
        UDPClose(ESCHERUDPSocket);
    	ESCHERUDPSocket = INVALID_UDP_SOCKET;
	}
	
	smESCHERUDPState = SM_ESCHERUDP_DISABLED;
}


/*****************************************************************************
  Function:
	void ESCHERUDPEnable(void)

  Summary:
	Enables the ESCHERUDP Client.

  Description:
	Enables the ESCHERUDP client if it is disabled.  If it is already enabled,
	nothing is done.

  Precondition:
	None

  Parameters:
	None

  Returns:
  	None
  ***************************************************************************/
void ESCHERUDPEnable(void)
{
	if(smESCHERUDPState == SM_ESCHERUDP_DISABLED)
	{
		smESCHERUDPState = SM_ESCHERUDP_GET_SOCKET;
		ESCHERUDPBindCount = 0;
		ESCHERUDPFlags.bits.bIsBound = FALSE;
	}
}


/*****************************************************************************
  Function:
	void ESCHERUDPTask(void)

  Summary:
	Performs periodic ESCHERUDP tasks.

  Description:
	This function performs any periodic tasks required by the ESCHERUDP module, 
	such as sending and receiving messages.

  Precondition:
	None

  Parameters:
	None

  Returns:
  	None
  ***************************************************************************/
static RHEA_TICK sentDiscoveryTime = 0ul;

void ESCHERUDPTask(void)
{
	RHEA_TICK nt;
	BYTE type;

    switch(smESCHERUDPState)
    {
		case SM_ESCHERUDP_GET_SOCKET:
			// Open a socket to send and receive broadcast messages on
	        ESCHERUDPSocket = UDPOpen(ESCHERUDP_CLIENT_PORT, NULL, ESCHERUDP_SERVER_PORT);
			if(ESCHERUDPSocket == INVALID_UDP_SOCKET)
				break;


			NETWORK_LED = OB_LED_OFF;

			ESCHERUDPFlags.bits.bIsBound = 1;
			smESCHERUDPState = SM_ESCHERUDP_SEND_DISCOVERY;
			break;

		case SM_ESCHERUDP_SEND_DISCOVERY:

			/* write the 8 Byte discovery message */
			if(UDPIsPutReady(ESCHERUDPSocket) < 10u)
				break;

			Nop();

			ESCHERUDPSend(ESCHERUDP_DISCOVER_MESSAGE,NULL,0ul);

			// Start new timer
			sentDiscoveryTime = TickGet();
			Nop();
			smESCHERUDPState = SM_ESCHERUDP_GET_DATA;
	        break;

					// Receive DATA
		case SM_ESCHERUDP_GET_DATA:

			// Check to see if a packet has arrived
			if(UDPIsGetReady(ESCHERUDPSocket) < 8u){
				// if no receive packet we ues the time for discovery messages

				nt = TickGet();
				if(nt < sentDiscoveryTime) //dirty wraparound
					sentDiscoveryTime = 0ul;

				// every 10 second anounce me if no reveived bytes
				if((nt - sentDiscoveryTime) >= 10ul*TICKS_PER_SECOND)
					smESCHERUDPState = SM_ESCHERUDP_SEND_DISCOVERY;
				break;
			}

			DATA_LED ^= 1;

			type = _ESCHERUDPReceive();

			// Check to see if we received an PLAY message
			// since play much more often should be faster then switch statement
			if(type == ESCHERUDP_MESSAGE_PLAY)
			{
				// play note

				if(ep_relaisnr < 32)
				{
					play_fet(ep_relaisnr,ep_velocity);
					lastPlayedFet = 1;
				}
				else if (ep_relaisnr < 64)
				{
					escherSerial1Note(ep_relaisnr,ep_velocity);
				}
				else
				{
					escherSerial2Note(ep_relaisnr,ep_velocity);
				}
				Nop();
				break;
			}
			else if (type == ESCHERUDP_MESSAGE_ALLOFF )
			{
				stop_all();
				escherSerial1Alloff();
				escherSerial2Alloff();
				break;
			}
			else if (type == ESCHERUDP_MESSAGE_HOLD )
			{
				dutyPWM((unsigned int) ep_hold);
				escherSerial1Hold((unsigned int) ep_hold);
				escherSerial2Hold((unsigned int) ep_hold);
				break;
			}
			else if (type == ESCHERUDP_MESSAGE_HOLDL )
			{
//				dutyPWM((unsigned int) ep_hold); 
				escherSerial1Hold((unsigned int) ep_hold);
//				escherSerial2Hold((unsigned int) ep_hold);
				break;
			}
			else if (type == ESCHERUDP_MESSAGE_HOLDM )
			{
//				dutyPWM((unsigned int) ep_hold);
//				escherSerial1Hold((unsigned int) ep_hold);
				escherSerial2Hold((unsigned int) ep_hold);
				break;
			}
			else if (type == ESCHERUDP_MESSAGE_HOLDH )
			{
				dutyPWM((unsigned int) ep_hold);
//				escherSerial1Hold((unsigned int) ep_hold);
//				escherSerial2Hold((unsigned int) ep_hold);
				break;
			}
			else if (type == ESCHERUDP_MESSAGE_INFO)
			{	
				// should deliver statistics on SerialIn from other escher
				escherSerial1Info();
				escherSerial2Info();

				// next time send discovery
				smESCHERUDPState = SM_ESCHERUDP_SEND_DISCOVERY;
				// in main loop send statistics
				sendStatistics(); // collected in main loop
				break;
			}
		// Handle SM_ESCHERUDP_DISABLED state by doing nothing.  Default case needed 
		// to supress compiler diagnostic.
		default:	
			break;
	}
}

/*****************************************************************************
  Function:
	BYTE _ESCHERUDPReceive(void)

  Description:
	Receives and parses a ESCHERUDP message.

  Precondition:
	A ESCHERUDP message is waiting in the UDP buffer.

  Parameters:
	None

  Returns:
  	One of the DCHP_TYPE* contants.
  ***************************************************************************/

static BYTE _ESCHERUDPReceive(void)
{
	/*********************************************************************
	        ESCHERUDP PACKET FORMAT AS PER Definition
	
   0                   1                   2                   3
   0 1 2 3 4 5 6 7 8 9 0 1 2 3 4 5 6 7 8 9 0 1 2 3 4 5 6 7 8 9 0 1

   +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
   |   Timestamp in Ticks                                          |
   +---------------+---------------+---------------+---------------+
   |TYPE:  NOTE    | note nr 8Bit  |    Velocity  14bit in 50us    |
   +---------------+---------------+---------------+---------------+
		
   +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
   |   Timestamp in Ticks                                          |
   +---------------+---------------+---------------+---------------+
   |TYPE:  ALL_OFF | not used                                      |
   +---------------+---------------+---------------+---------------+

   +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
   |   Timestamp in Ticks                                          |
   +---------------+---------------+---------------+---------------+
   | TYPE:  HOLD   | 8bit 0..100%  | dummy 14Bit                   |
   +---------------+---------------+---------------+---------------+
   +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
   |   Timestamp in Ticks                                          |
   +---------------+---------------+---------------+---------------+
   | TYPE:  HOLDL  | 8bit 0..100%  | dummy 14Bit                   |
   +---------------+---------------+---------------+---------------+
   +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
   |   Timestamp in Ticks                                          |
   +---------------+---------------+---------------+---------------+
   | TYPE:  HOLDM  | 8bit 0..100%  | dummy 14Bit                   |
   +---------------+---------------+---------------+---------------+
   +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
   |   Timestamp in Ticks                                          |
   +---------------+---------------+---------------+---------------+
   | TYPE:  HOLDH  | 8bit 0..100%  | dummy 14Bit                   |
   +---------------+---------------+---------------+---------------+

   +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
   |   Timestamp in Ticks                                          |
   +---------------+---------------+---------------+---------------+
   |TYPE:  INFO    | not used                                      |
   +---------------+---------------+---------------+---------------+

   ********************************************************************/
    BYTE type;

    // Assume unknown message until proven otherwise.
    type = ESCHERUDP_MESSAGE_UNKNOWN;

	UDPGetArray((BYTE*)&ep_timestamp, sizeof(ep_timestamp));
    UDPGet(&ep_type);  // Type
    
	switch(ep_type){

    case PLAY_NOTE:
    
		UDPGet(&ep_relaisnr); 
		UDPGetArray((BYTE*)&ep_velocity, sizeof(ep_velocity));
		type = ESCHERUDP_MESSAGE_PLAY;
		break;

	case PLAY_ALLOFF:
        // Discard RelaisNumber, Velocity
		type = ESCHERUDP_MESSAGE_ALLOFF;
		break;

	case PLAY_HOLD:
		UDPGet(&ep_hold); // dummy
		ep_hold &= 0x7F;  // 7 bit limit 
		// next two bytes ignore
		type = ESCHERUDP_MESSAGE_HOLD;
		break;
	case PLAY_HOLDL:
		UDPGet(&ep_hold); // dummy
		ep_hold &= 0x7F;  // 7 bit limit 
		// next two bytes ignore
		type = ESCHERUDP_MESSAGE_HOLDL;
		break;
	case PLAY_HOLDM:
		UDPGet(&ep_hold); // dummy
		ep_hold &= 0x7F;  // 7 bit limit 
		// next two bytes ignore
		type = ESCHERUDP_MESSAGE_HOLDM;
		break;
	case PLAY_HOLDH:
		UDPGet(&ep_hold); // dummy
		ep_hold &= 0x7F;  // 7 bit limit 
		// next two bytes ignore
		type = ESCHERUDP_MESSAGE_HOLDH;
		break;

	case PLAY_INFO:
		type = ESCHERUDP_MESSAGE_INFO;
		break;
	}

	/* Play Relais now */

	Nop(); // for debugging

    UDPDiscard();                             // We are done with this packet
    return type;
}


/*****************************************************************************
  Function:
	void ESCHERUDPSend(BYTE messageType, BYTE * data,WORD len)

  Description:
	Sends a broadcast ESCHERUDP message to local net

  Precondition:
	UDP is ready to write a ESCHERUDP packet.

  Parameters:
	messageType - One of the ESCHERUDP_TYPE constants
	pointer to data
	len of data	
  Returns:
  	None

   Synthax: (see code)

    DISCOVERY: <header> <MAC address><IP address>
    TICK_PER_LOOP: <header>(just data with len)
    TICK_PER_SECOND: <header>???????

    header := <Message type:byte><MACaddrbyte4><MACaddrbyte5><MACaddrbyte6>
              <IP-address byte1><IP-address byte2><IP-address byte3><IP-address byte4>

  ***************************************************************************/
static ESCHERUDP_HEADER header;
static volatile unsigned long ldata; // dont optimize since used as pointer to

void ESCHERUDPSend(BYTE messageType,BYTE* data,WORD len)
{
	DWORD	MyIP;

	// Ignore message Type always send same
	
	header.messageType = messageType;
	header.mac[0] = MY_DEFAULT_MAC_BYTE4;
	header.mac[1] = MY_DEFAULT_MAC_BYTE5;
	header.mac[2] = MY_DEFAULT_MAC_BYTE6;
	header.ipaddr = AppConfig.MyIPAddr.Val;

//	memCopy(&header.IPAddr,&AppConfig.MyIPAddr.Val,4);
	UDPPutArray((BYTE *) &header,sizeof(header));

	switch(messageType){

	case ESCHERUDP_DISCOVER_MESSAGE:

    	// Send MAC Adr - Header

		UDPPutArray((BYTE*)&AppConfig.MyMACAddr, sizeof(AppConfig.MyMACAddr));
		// Send IP address 
		MyIP = AppConfig.MyIPAddr.Val;
		UDPPutArray((BYTE*)&MyIP, sizeof(MyIP));

		break;

	case ESCHERUDP_STATISTICS:
		UDPPutArray(data,len);
		break;

	case	ESCHERUDP_TICKS_PER_SECOND:
		ldata = TICKS_PER_SECOND;
		UDPPutArray((BYTE*) &ldata,sizeof(ldata));
		break;

	default:
		break;
	}
    UDPFlush();	// end of packet
}
