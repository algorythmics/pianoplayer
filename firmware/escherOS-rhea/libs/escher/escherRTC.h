/* *******************************************************************
 *
 * ESCHER dsPIC-Board Hardware Definitions and helper
 *
 *********************************************************************
 * FileName     : escherRTC.h
 * Dependencies : none
 * Processor
 *  - targets   : dsPIC33F, PIC24, PIC32
 *  - tested    : 33FJ128MC708
 * Company      : Algorythmics
 *
 *  * License: GPL V3.0
 *
 * This module defines the escher hardware realtime clock, with the 32KHz
 * secondary oscillator and substitutes the Tick module of microchip TCP/IP Stack
 * 
 * Author              Date         Comment
 *~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
 * Winfried Ritsch     2.2.2012     adapted from rhea timer with tcp/ip header
 *
 *  * Comment now:
 *
 * already worked with prototype Escher and Escher V1.0 (CC-By-NC-SA)
 *
 * Note: its ainm is to extend with the RTCC chip and as reference for
 * precision time protocol, which can adjust the timer functions
 *
 ********************************************************************/
#ifndef __ESCHER_RTC_H
#define __ESCHER_RTC_H
#define __TICK_H  // substitutes TCP/IP Tick Module

typedef DWORD ESCHER_TICK;
#define ESCHER_TICK_MAX 0xFFFFFFFFul // 32Bit unsigned

// 32kHz crystal drives timer with no scalar

#if defined(ESCHER_CLOCK32Khz)
#define ESCHER_TICKS_PER_SECOND      (32768ul)
#else
// Internal core clock drives timer with 1:256 prescaler
// should be on 40 000 000 -> 156 250,5
#define ESCHER_TICKS_PER_SECOND   ((GetPeripheralClock()+128ull)/256ull)
#define ESCHER_TICKS_PER_MS   ((GetPeripheralClock()+128000ull)/256000ull)

#endif

// All TICKS are stored as 32-bit integers, with 16 Bit sub second count.

void escher_tick_init(void);
void escher_tick_exit(void);
ESCHER_TICK escher_tick_get(void);
ESCHER_TICK escher_tick_get_div256(void);
ESCHER_TICK escher_tick_get_div64k(void);
ESCHER_TICK escher_ticks_to_ms(ESCHER_TICK dwTickValue);
#define escher_ms_to_ticks(ms) ((ESCHER_TICK)(ms)* (ESCHER_TICK) ESCHER_TICKS_PER_MS)
//void escher_tick_update(void); //bot needed now in interrupt

// --------- for TCP/IP Stack compatibility --------------------------

// All TICKS are stored as 32-bit unsigned integers.
// This is deprecated since it conflicts with other TICK definitions used in
// other Microchip software libraries and therefore poses a merge and maintence
// problem.  Instead of using the TICK data type, just use the base DWORD data
// type instead.
typedef __attribute__((__deprecated__)) DWORD TICK;

// This value is used by TCP and other modules to implement timeout actions.
// For this definition, the Timer must be initialized to use a 1:256 prescalar
// in Tick.c.  If using a 32kHz watch crystal as the time base, modify the
// Tick.c file to use no prescalar.

#define TICKS_PER_SECOND ESCHER_TICKS_PER_SECOND

// Represents one second in Ticks
#define TICK_SECOND            ((ESCHER_TICK)TICKS_PER_SECOND)
// Represents one minute in Ticks
#define TICK_MINUTE            ((ESCHER_TICK)TICKS_PER_SECOND*60ul)
// Represents one hour in Ticks
#define TICK_HOUR            ((ESCHER_TICK)TICKS_PER_SECOND*3600ul)

#define TickInit() escher_rtc_init()
#define TickGet() escher_tick_get()
#define TickGetDiv256() escher_tick_get_div256()
#define TickGetDiv64K() escher_tick_get_div64k()
// Note type conversion can get lost of values since truncated to 16 Bit !!!
#define TickConvertToMilliseconds(dwTickValue) escher_tick_to_milliseconds((ESCHER_TICK) dwTickValue)
#define TickUpdate() escher_tick_update()

#endif // __ESCHER_RTC_H
