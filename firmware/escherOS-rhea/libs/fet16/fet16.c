/* *******************************************************************
 *
 * Escher 2x (1x) FET16 an Escher
 *
 *********************************************************************
 * FileName:        escher/fet16.c
 * Dependencies:
 * Processor:       dsPIC33F (33FJ128MC708)
 * Company:         Algorythmics
 *
 * License: GPL V3.0 
 *
 * Author              Date         Comment
 *~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
 * Winfried Ritsch      5.7.08       Initial Try
 * W Ritsch         22.2.2010       adapted for phoibe Player 1 FET Board
 * log continued in repository... see: "svn log" or "git log" or so.
 *
 * use #define FET16_SINGLE for only one board on PWM outs
 * this is not used if PWMs are controlled, but can superceed this. 
 *
 * usage of PWMs will not activate FET I/Os will activate them not Init
 *
 ********************************************************************/
#include    "escherBoard.h"
#include    "fet16/fet16.h"


void   init_fets(void)
{
   clear_fets();
}

void activate_fets()
{
/* if for first FET Board PWM/OC outputs are used, TRIS not needed !*/
#if !defined( FET16_PWMS )
   FET00_TRIS = 0;
   FET01_TRIS = 0;
   FET02_TRIS = 0;
   FET03_TRIS = 0;
   FET04_TRIS = 0;
   FET05_TRIS = 0;
   FET06_TRIS = 0;
   FET07_TRIS = 0;
   FET08_TRIS = 0;
   FET09_TRIS = 0;
   FET10_TRIS = 0;
   FET11_TRIS = 0;
   FET12_TRIS = 0;
   FET13_TRIS = 0;
   FET14_TRIS = 0;
   FET15_TRIS = 0;
#endif

#if !defined(FET16_SINGLE)
   FET16_TRIS = 0;
   FET17_TRIS = 0;
   FET18_TRIS = 0;
   FET19_TRIS = 0;
   FET20_TRIS = 0;
   FET21_TRIS = 0;
   FET22_TRIS = 0;
   FET23_TRIS = 0;
   FET24_TRIS = 0;
   FET25_TRIS = 0;
   FET26_TRIS = 0;
   FET27_TRIS = 0;
   FET28_TRIS = 0;
   FET29_TRIS = 0;
   FET30_TRIS = 0;
   FET31_TRIS = 0;
#endif
}

void   clear_fets(void)
{
   int i;
   for (i=0;i<MAX_FETS;i++){
      clr_fet(i);
   }
}

void   set_fet(unsigned int nr)
{
   nr &= 0x1F;

   switch(nr){
   case 0:   FET00 = FET_ON;break;
   case 1:   FET01 = FET_ON;break;
   case 2:   FET02 = FET_ON;break;
   case 3:   FET03 = FET_ON;break;
   case 4:   FET04 = FET_ON;break;
   case 5:   FET05 = FET_ON;break;
   case 6:   FET06 = FET_ON;break;
   case 7:   FET07 = FET_ON;break;
   case 8:   FET08 = FET_ON;break;
   case 9:   FET09 = FET_ON;break;
   case 10:   FET10 = FET_ON;break;
   case 11:   FET11 = FET_ON;break;
   case 12:   FET12 = FET_ON;break;
   case 13:   FET13 = FET_ON;break;
   case 14:   FET14 = FET_ON;break;
   case 15:   FET15 = FET_ON;break;
#ifndef  FET16_SINGLE
   case 16:   FET16 = FET_ON;break;
   case 17:   FET17 = FET_ON;break;
   case 18:   FET18 = FET_ON;break;
   case 19:   FET19 = FET_ON;break;
   case 20:   FET20 = FET_ON;break;
   case 21:   FET21 = FET_ON;break;
   case 22:   FET22 = FET_ON;break;
   case 23:   FET23 = FET_ON;break;
   case 24:   FET24 = FET_ON;break;
   case 25:   FET25 = FET_ON;break;
   case 26:   FET26 = FET_ON;break;
   case 27:   FET27 = FET_ON;break;
   case 28:   FET28 = FET_ON;break;
   case 29:   FET29 = FET_ON;break;
   case 30:   FET30 = FET_ON;break;
   case 31:   FET31 = FET_ON;break;
#endif
   default: break;
    }
}

void   clr_fet(unsigned int nr)
{
   nr &= 0x1F;

   switch(nr){
   case 0:   FET00 = FET_OFF;break;
   case 1:   FET01 = FET_OFF;break;
   case 2:   FET02 = FET_OFF;break;
   case 3:   FET03 = FET_OFF;break;
   case 4:   FET04 = FET_OFF;break;
   case 5:   FET05 = FET_OFF;break;
   case 6:   FET06 = FET_OFF;break;
   case 7:   FET07 = FET_OFF;break;
   case 8:   FET08 = FET_OFF;break;
   case 9:   FET09 = FET_OFF;break;
   case 10:   FET10 = FET_OFF;break;
   case 11:   FET11 = FET_OFF;break;
   case 12:   FET12 = FET_OFF;break;
   case 13:   FET13 = FET_OFF;break;
   case 14:   FET14 = FET_OFF;break;
   case 15:   FET15 = FET_OFF;break;
#ifndef  FET16_SINGLE
   case 16:   FET16 = FET_OFF;break;
   case 17:   FET17 = FET_OFF;break;
   case 18:   FET18 = FET_OFF;break;
   case 19:   FET19 = FET_OFF;break;
   case 20:   FET20 = FET_OFF;break;
   case 21:   FET21 = FET_OFF;break;
   case 22:   FET22 = FET_OFF;break;
   case 23:   FET23 = FET_OFF;break;
   case 24:   FET24 = FET_OFF;break;
   case 25:   FET25 = FET_OFF;break;
   case 26:   FET26 = FET_OFF;break;
   case 27:   FET27 = FET_OFF;break;
   case 28:   FET28 = FET_OFF;break;
   case 29:   FET29 = FET_OFF;break;
   case 30:   FET30 = FET_OFF;break;
   case 31:   FET31 = FET_OFF;break;
#endif
   default: break;
    }
}
