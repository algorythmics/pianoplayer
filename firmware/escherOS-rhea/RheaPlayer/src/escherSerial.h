/*********************************************************************
 *
 *   RheaPlayer - SERIAL communication Implementation Header
 *
 *   Application for using Escher and EscherFET16 Boards 
 *   for Autoklavierspieler Rhea
 *
 * Note: derived from MIDI as PSEUDO MIDI protocoll
 * TODO: should be upward compatible
 *
 *********************************************************************
 * FileName:        escherSERIAL.h
 * Dependencies:    escherUART.h
 * Processor:       dsPIC33F
 * Company:         Algorythmics
 *
 * Author              Date         Comment
 *~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
 * W Ritsch			6.8.2010
 *    for Escher Master and Slave on rhea 
 ********************************************************************/

#ifndef __ESCHERSERIAL_H
#define __ESCHERSERIAL_H

// Synthax is simple derived from MIDI:
// All status bytes have 8.Bit set and 
//  Pulse on/off is 0x80+ note number to play 32 values max
//  Hold value is appened on 0x FF
//  All io off 0xFE
//  Info 0xF0

// Message Types returned by read
#define ESCHERSERIAL_MAXNOTES					(32)
#define ESCHERSERIAL_MESSAGE_PLAY               (0x80)	// + relaisnr 0-31 + 2 data as 14bits velocity
#define ESCHERSERIAL_MESSAGE_INFO               (0xF0)   // Request for statistics
#define ESCHERSERIAL_MESSAGE_ALLOFF             (0xFE)	// All notes off (no data)
#define ESCHERSERIAL_MESSAGE_HOLD               (0xFF)   // Set Hold Allfactor + 2 data as 14bit hold data 

// -------- EscherSERIAL State Machine --------------
typedef enum _SM_ESCHERSERIAL
{
	SM_ESCHERSERIAL_UNKOWN = 0,		//  is not currently enabled
	SM_ESCHERSERIAL_PLAY_DATA1,		//  playing notes
	SM_ESCHERSERIAL_PLAY_DATA2,		//  playing notes
//	SM_ESCHERSERIAL_ALLOFF,		//	ALLOFF (Not really a state since no datas) 
	SM_ESCHERSERIAL_HOLD_DATA1,		//  HOLD data receiving
	SM_ESCHERSERIAL_HOLD_DATA2,		//  HOLD data receiving
//	SM_ESCHERSERIAL_INFO,		//  INFO requested (Not really a state since no datas)
	SM_ESCHERSERIAL_ERROR
}   SM_ESCHERSERIAL;

void escherSerialInit(void);	
void escherSerialReset(void);
void escherSerialTask(void);

// write on serial wait fir free buffer, later with time out, but not now
#define escherSerial1Write(byte) {while(!escher_UART1_rts());escher_UART1_write((byte));}
#define escherSerial2Write(byte) {while(!escher_UART2_rts());escher_UART2_write((byte));}

void escherSerial1Note(unsigned char nr,unsigned int vel);
void escherSerial2Note(unsigned char nr,unsigned int vel);
void escherSerial1Hold(unsigned int hold);
void escherSerial2Hold(unsigned int hold);
void escherSerial1Alloff(void);
void escherSerial2Alloff(void);
void escherSerial1Info(void);
void escherSerial2Info(void);

#endif