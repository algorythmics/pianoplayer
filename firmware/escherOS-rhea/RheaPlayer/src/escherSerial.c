/*********************************************************************
 *
 *   RheaPlayer - SERIAL Parser Implementation 
 * 
 *   Communication between Escher Master and Slave Boards 
 *   for Autoklavierspieler Rhea
 *
 *********************************************************************
 * FileName:        escherSERIAL.c
 * Dependencies:    escherSERIAL.h, escherUART.h, playpulses.h
 * Processor:       dsPIC33F
 * Company:         Algorythmics
 *
 * Author              Date         Comment
 *~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
 * W Ritsch			6.8.2010
 * further logs now in svn or git repositories
 ********************************************************************/

/* --- rhea specific settings ---- */
#include "rhea.h"
#include "escherBoard.h"
#include "escherUART.h"
#include "escherPWM.h"
#include "play_pulses.h"

#define __ESCHERSERIAL_C
#include "escherSerial.h"

/* static variables for state machine parser */
static SM_ESCHERSERIAL smESCHERSERIALState = SM_ESCHERSERIAL_UNKOWN;
static	unsigned char status;
static	unsigned int data;

/*****************************************************************************
  Function:
	void EscherSerialReset(void)

  Summary:
	Resets the serial parser Client.

  ***************************************************************************/
void escherSerialReset(void)
{
	smESCHERSERIALState = SM_ESCHERSERIAL_UNKOWN;
	escher_UART1_reset();
	escher_UART2_reset();
}

/*****************************************************************************
  Function:
	void escherSerialInit(void)

  Summary:
	Inits the serial master/client module

  ***************************************************************************/

void escherSerialInit(void)
{
	escherSerialReset();
}



/*****************************************************************************
  Function:
	void escherSerialTask(void)

  Summary:
	Performs periodic ESCHERSERIAL tasks.

  Description:
	This function performs any periodic tasks required by the ESCHERSERIAL module, 
	such as sending and receiving messages, put this in main loop.

  ***************************************************************************/

void escherSerialTask(void)
{
	unsigned char byte;
	int error=0;

	while(escher_UART1_rtr())
	{	
		// test for frame error
		if (U1STAbits.FERR)
		{
			error++;
			ERROR_LED = OB_LED_ON;
			byte = escher_UART1_read(); // drop wrong data
			smESCHERSERIALState = SM_ESCHERSERIAL_ERROR;
			continue;
		}

		byte = escher_UART1_read();


		if(byte < 0x80) // data bytes set switch state if needed
		{	
	    switch(smESCHERSERIALState)
    		{
			case SM_ESCHERSERIAL_PLAY_DATA1:
				// first data byte
				data = byte;
				data = data << 7;
				smESCHERSERIALState = SM_ESCHERSERIAL_PLAY_DATA2;
			break;

			case SM_ESCHERSERIAL_PLAY_DATA2:
				data += byte;
				play_fet(status&0x1F,data);
				smESCHERSERIALState = SM_ESCHERSERIAL_UNKOWN; // no running state
			break;

			case SM_ESCHERSERIAL_HOLD_DATA1:
				// first data byte
				data = byte;
				data = data << 7;
				smESCHERSERIALState = SM_ESCHERSERIAL_HOLD_DATA2;
			break;

			case SM_ESCHERSERIAL_HOLD_DATA2:
				data += byte;
				dutyPWM((unsigned int) data);
				smESCHERSERIALState = SM_ESCHERSERIAL_UNKOWN;
			break;
	
			case SM_ESCHERSERIAL_UNKOWN:
			case SM_ESCHERSERIAL_ERROR:
			default:
				break;	
		}
	} // else status byte
	else if(byte < (ESCHERSERIAL_MESSAGE_PLAY+ ESCHERSERIAL_MAXNOTES)) 
	{
		status = byte; // new status
		smESCHERSERIALState = SM_ESCHERSERIAL_PLAY_DATA1;
		DATA_LED ^= 1;
	}
	else if (byte == ESCHERSERIAL_MESSAGE_HOLD)
	{
		status = byte; //new status
		smESCHERSERIALState = SM_ESCHERSERIAL_HOLD_DATA1;
		DATA_LED ^= 1;
	}
	else if (byte == ESCHERSERIAL_MESSAGE_ALLOFF)
	{
		stop_all(); // no new status
		DATA_LED ^= 1;
	}
	else if (byte == ESCHERSERIAL_MESSAGE_INFO)
	{
//		send_info(); // no new status
		DATA_LED ^= 1;
	}
	}

	if (U1STAbits.OERR)
	{
		error++;
		ERROR_LED = OB_LED_ON;
		// data received should read first, 
		// but here we dont care, read before
		U1STAbits.OERR = 0;
		smESCHERSERIALState = SM_ESCHERSERIAL_ERROR;
	}

//	if(error == 0)
//		ERROR_LED = OB_LED_OFF;
// error led cleared in houskeeping task

}

/*****************************************************************************
  Functions:
	void escherSerialNote|Hold....

  Summary:
	send serial commands with data

  Description:

  ***************************************************************************/

void escherSerial1Note(unsigned char nr,unsigned int vel)
{
	escherSerial1Write((nr & 0x1F)+ESCHERSERIAL_MESSAGE_PLAY);            // Statusbit + relaisnr
	escherSerial1Write((unsigned char) (vel>>7));
	escherSerial1Write((unsigned char) (vel & 0x7F));
}

void escherSerial2Note(unsigned char nr,unsigned int vel)
{
	escherSerial2Write((nr & 0x1F)+ESCHERSERIAL_MESSAGE_PLAY);            // Statusbit + relaisnr
	escherSerial2Write( (unsigned char) (vel>>7));
	escherSerial2Write( (unsigned char) (vel & 0x7F));
}

void escherSerial1Hold(unsigned int hold)
{
	escherSerial1Write(ESCHERSERIAL_MESSAGE_HOLD);            // Statusbit + relaisnr
	escherSerial1Write( (unsigned char) (hold>>7)); 
	escherSerial1Write( (unsigned char) (hold & 0x7F));
}

void escherSerial2Hold(unsigned int hold)
{
	escherSerial2Write(ESCHERSERIAL_MESSAGE_HOLD);            // Statusbit + relaisnr
	escherSerial2Write( (unsigned char) (hold>>7));
	escherSerial2Write( (unsigned char) (hold & 0x7F));
}

void escherSerial1Alloff(void)
{
	escherSerial1Write(ESCHERSERIAL_MESSAGE_ALLOFF);            // Statusbit + relaisnr
}

void escherSerial2Alloff(void)
{
	escherSerial2Write(ESCHERSERIAL_MESSAGE_ALLOFF);            // Statusbit + relaisnr
}

void escherSerial1Info(void)
{
	escherSerial1Write(ESCHERSERIAL_MESSAGE_INFO);            // Statusbit + relaisnr
}

void escherSerial2Info(void)
{
	escherSerial2Write(ESCHERSERIAL_MESSAGE_INFO);            // Statusbit + relaisnr
}

