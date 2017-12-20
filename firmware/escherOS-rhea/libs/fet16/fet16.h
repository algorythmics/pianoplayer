/* *******************************************************************
 *
 * Hardware definitions for EscherFET Boards on Escher 
 * for P0 or/and optionale P1
 * Escher 2x FET16 an Escher
 *
 *********************************************************************
 * FileName:        escher_fet16.h
 * Dependencies:
 * Processor:       dsPIC33F (33FJ128MC708)
 * Company:         Algorythmics
 *
 * GPL V3.0 
 *
 * Author              Date         Comment
 *~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
 * Winfried Ritsch	   5.7.08       Initial Try
 * Winfried Ritsch	   22.2.2010    adapdted for phoibeplayer
 * further logs now in repositories see svn, git
 * 
 * Comment now:
 * define if only one board on PWMs is used
 *  #define FET16_SINGLE
 * 2 boards are used by default (for compatibility)
 ********************************************************************/
#ifndef __ESCHER_FET16_H
#define __ESCHER_FET16_H

#ifdef  FET16_SINGLE
 #define MAX_FETS 16
 #define MASK_FET_NR 0x0Fu
#else
 #define MAX_FETS 32
 #define MASK_FET_NR 0x1Fu
#endif

// polarity of driver
//#define FET_ON	0
//#define FET_OFF	1
#define FET_ON	1
#define FET_OFF	0

// define Ports
#define FET00_TRIS	P0_IO0_TRIS
#define FET00		P0_IO0
#define FET01_TRIS	P0_IO1_TRIS
#define FET01		P0_IO1
#define FET02_TRIS	P0_IO2_TRIS
#define FET02		P0_IO2
#define FET03_TRIS	P0_IO3_TRIS
#define FET03		P0_IO3
#define FET04_TRIS	P0_IO4_TRIS
#define FET04		P0_IO4
#define FET05_TRIS	P0_IO5_TRIS
#define FET05		P0_IO5
#define FET06_TRIS	P0_IO6_TRIS
#define FET06		P0_IO6
#define FET07_TRIS	P0_IO7_TRIS
#define FET07		P0_IO7
#define FET08_TRIS	P0_IO10_TRIS
#define FET08		P0_IO10
#define FET09_TRIS	P0_IO11_TRIS
#define FET09		P0_IO11
#define FET10_TRIS	P0_IO12_TRIS
#define FET10		P0_IO12
#define FET11_TRIS	P0_IO13_TRIS
#define FET11		P0_IO13
#define FET12_TRIS	P0_IO14_TRIS
#define FET12		P0_IO14
#define FET13_TRIS	P0_IO15_TRIS
#define FET13		P0_IO15
#define FET14_TRIS	P0_IO16_TRIS
#define FET14		P0_IO16
#define FET15_TRIS	P0_IO17_TRIS
#define FET15		P0_IO17

#ifndef  FET16_SINGLE

#define FET16_TRIS	P1_IO0_TRIS
#define FET16		P1_IO0
#define FET17_TRIS	P1_IO1_TRIS
#define FET17		P1_IO1
#define FET18_TRIS	P1_IO2_TRIS
#define FET18		P1_IO2
#define FET19_TRIS	P1_IO3_TRIS
#define FET19		P1_IO3
#define FET20_TRIS	P1_IO4_TRIS
#define FET20		P1_IO4
#define FET21_TRIS	P1_IO5_TRIS
#define FET21		P1_IO5
#define FET22_TRIS	P1_IO6_TRIS
#define FET22		P1_IO6
#define FET23_TRIS	P1_IO7_TRIS
#define FET23		P1_IO7
#define FET24_TRIS	P1_IO10_TRIS
#define FET24		P1_IO10
#define FET25_TRIS	P1_IO11_TRIS
#define FET25		P1_IO11
#define FET26_TRIS	P1_IO12_TRIS
#define FET26		P1_IO12
#define FET27_TRIS	P1_IO13_TRIS
#define FET27		P1_IO13
#define FET28_TRIS	P1_IO14_TRIS
#define FET28		P1_IO14
#define FET29_TRIS	P1_IO15_TRIS
#define FET29		P1_IO15
#define FET30_TRIS	P1_IO16_TRIS
#define FET30		P1_IO16
#define FET31_TRIS	P1_IO17_TRIS
#define FET31		P1_IO17
#endif

/* functions externs */
void	init_fets(void);      // initialize FETS
void    activate_fets(void); // activate outputs 
void	clear_fets(void);    // clear all

void	set_fet(unsigned int nr); // set fet with nr (0..31)
void	clr_fet(unsigned int nr); // unset fet with nr (0..31)

#endif