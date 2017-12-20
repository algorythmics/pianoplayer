/* **************************************************
 *
 * Play pulses
 *
 *********************************************************************
 * FileName:        play_pulses.h
 * Dependencies:
 * Processor:       dsPIC33F (33FJ128MC708)
 * Company:         Algorythmics
 *
 * License: GPL V3.0 
 *
 * Author              Date         Comment
 *~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
 * Winfried Ritsch	   5.7.08       Initial Try
 * W Ritsch			22.2.2010       adapted for Rhea Player 1 FET Board
 * further logs see svn, git, ...
 * 
 * Comment now:
 * We use #define FET16_SINGLE for  boards with PWM/OC outs without SoftPWM
 * this is not used if PWMs are controlled, but can superceed this. 
 ********************************************************************/
#ifndef _PLAY_PULSES_H
#define _PLAY_PULSES_H

// DATA Types for pulses
typedef union _PLAY_STATUS_FLAGS
{
    struct
    {
        unsigned char trigger : 1;				// Whether or not Port is currently open
        unsigned char play : 1;		// Whether or not an data has been received
		unsigned char hold : 1;
    } bits;
    unsigned char Val;
} PLAY_STATUS_FLAGS;

typedef struct _PULS_DATA {
   PLAY_STATUS_FLAGS flags;
   int puls;
} PULS_DATA;

extern PULS_DATA pulse[];

void init_pulses(void);
void play_fet(unsigned int nr,unsigned int velo);
void stop_fet(unsigned int nr);
void stop_all(void);
void play_fetsTask(void);
void play_fetsInterrupt(void);

#endif
