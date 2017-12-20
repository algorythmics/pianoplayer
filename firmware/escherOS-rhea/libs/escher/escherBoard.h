/* *******************************************************************
 *
 * ESCHER dsPIC-Board Hardware Definitions and helper
 *
 *********************************************************************
 * FileName     : escherBoard.h
 * Processor
 *  - targets   : dsPIC33F, dsPIC33E
 *  - tested    : escher1 dsPIC33FJ128MC708A, dsPIC33E SK + PICTAIL Eth0
 * Company      : Algorythmics
 *
 *  * License: GPL V3.0
 *
 * This module defines the escher hardware specific parts for various
 * boards like escher1 and Evaluation boards
 * and also helper to startup escher boards.
 *
 * Ports are the Interfaces of the escher hardware like described
 * in the manual trying to keep up with versions of the board.
 *
 * Author              Date         Comment
 *~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
 * Winfried Ritsch     5.7.08       Initial Try
 * Winfried Ritsch     22.2.10      adapted for autopianoplayer
 * Winfried Ritsch     7.8.10       added Port Statement to Port for read
 * Winfried Ritsch     2.2.2012     more generalized for new OS
 * Winfried Ritsch     12.5.2012    diversion to dsPIC33E Startkit w PICTAIL 100MB
 *
 *  * Comment now:
 *
 * already worked with prototype Escher and Escher V1.0 (CC-By-NC-SA)
 *
 * Note: within of some defines the escher_ prefix is not used, but should
 * (mostly if they are quite unique names)
 *
 ********************************************************************/

#ifndef __ESCHER_BOARD_H
#define __ESCHER_BOARD_H

#include "escher_config.h"
#if defined(ESCHER1_BOARD)
#include "HWP_escher1Board.h"
void escher_init_enc60_spi(void);
#elif defined(dsPIC33E_SK_ENC624)
#include  "HWP_dsPIC33E_SK_ENC624.h"
void escher_init_enc624_psp5(void);
#else
#warning "No Hardware board defined"
#endif

// ----------------- Common Interfaces ----------------
// --- led functions/macros ---
void escher_animate_leds(); // animate onboard LEDS

// shortcut  as defines, or use escher_set_port();
#define escher_led0() {OB_LED0 = OB_LED_ON;}
#define escher_led1() {OB_LED1 = OB_LED_ON;}
#define escher_led2() {OB_LED2 = OB_LED_ON;}
#define escher_led3() {OB_LED3 = OB_LED_ON;}
#define escher_unled0() {OB_LED0 = OB_LED_OFF;}
#define escher_unled1() {OB_LED1 = OB_LED_OFF;}
#define escher_unled2() {OB_LED2 = OB_LED_OFF;}
#define escher_unled3() {OB_LED3 = OB_LED_OFF;}
#define escher_toggle_led0() {OB_LED0 ^= 1;}
#define escher_toggle_led1() {OB_LED1 ^= 1;}
#define escher_toggle_led2() {OB_LED2 ^= 1;}
#define escher_toggle_led3() {OB_LED3 ^= 1;}

// -------- global functions ----------
void escher_init(void); // init escher inclusive oscillator
void escher_startup_osc(void);

// -- port control---
#define PORT_ALL  -1

#define PORT_TRIS_OUT 0
#define PORT_TRIS_IN  1
void escher_port_init(unsigned char portnr, unsigned char inout);

#define PORT_OUT_HIGH 1
#define PORT_OUT_LOW  0
void escher_port_set(unsigned char portnr, unsigned char state);

// if delayMs is used, eg. from escherRTC modules or TCP/IP Stack or
// any other timer module use this  which makes a better synchronised or efficient
// measurement
// preferred is if timer4 is used for measurement as thread
// ATTENTION: if external lib is not initialized, it maybe fails on init board !

//#if defined(DelayMs)

#if defined(ESCHER_DELAY_USE_TICK)
#define	escher_delay_ms(time) DelayMs(time)
void escher_delay_ms(WORD ms);
#else
void escher_delay_ms(word time);
#define DelayMs(time) escher_delay_ms(time)
#endif

#if defined(Delay10us)
#define escher_delay_10us(count) Delay10us(count)
#else
//void escher_delay_10us(int count);
#define Delay10us(count) escher_delay_10us(count)
#endif

#endif // __ESCHER_BOARD_H
