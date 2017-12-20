/* *******************************************************************
 *
 * ESCHER dsPIC-Board onboard Hardware  
 *
 * derived from and included in  HardwareProfile.h
 *********************************************************************
 * FileName:        escherRTC.c
 * Dependencies:    escherRTC.h
 * Processor:       dsPIC33F 80~Pin, PIC24, PIC32
 *                  (tested on 33FJ128MC708)
 * Company:         Algorythmics
 *
 * License: GPL V3.0 
 *
 * Author              Date         Comment
 *~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
 * Winfried Ritsch     2.2.2012     adapted from rhea timer with tcp/ip header
 *
 *  ********************************************************************/

#include "Compiler.h" // Include correct processor defs from compile arg
#include "GenericTypeDefs.h"
#include "HardwareProfile.h"
#include "escherRTC.h"

// Internal counter to store Ticks.  This variable is incremented in an ISR and
// therefore must be marked volatile to prevent the compiler optimizer from
// reordering code to use this value in the main context while interrupts are
// disabled.
static volatile DWORD dwInternalTicks = 0;

// 6-byte value to store Ticks.  Allows for use over longer periods of time.
// 2 more bytes in 16bit counter
static BYTE vTickReading[6];

/*********************************************************************
 * Function:        void escher_rtc_init(void)
 * PreCondition:    None
 * Side Effects:    Start secondary  oszillator, uses Timer1
 *
 * Overview:        Initializes Realtime clock and Timer1
 *
 * Note:            dont use with TCP/IP Stack it substitutes this
 ********************************************************************/

// notify the compiler we are not modifying the PSV
int dSec = 0;
int Sec = 0;
int Min = 0;

void escher_rtc_init(void) {

T1CONbits.TON = 0; // turn off before configure
T1CONbits.TSIDL = 0; // continue in Idle Mode (external clock)
T1CONbits.TGATE = 0; //Disable Gated Timer mode
TMR1 = 0;

#if defined(ESCHER_CLOCK32KHz)
    // Base
    PR1 = 0xFFFF;
    // Clear counter
    __builtin_write_OSCCONL(2); // unlock and enable SOSC

    T1CONbits.TCKPS = 3; // prescaler 1/256
    T1CONbits.TCS = 1; // Timer1 Clock=External
    T1CONbits.TSYNC = 0; // No Sync to external
#else 
    // use internal Clock GetInstructionClock() 40 000 000
    T1CONbits.TCS = 0; //Select internal instruction cycle clock
    T1CONbits.TCKPS = 0b11; // Prescaler 1/256 -> 156 250
    PR1 = 0xFFFF;

#endif

    // Enable timer interrupt
    IPC0bits.T1IP = 2; // Interrupt priority 2 (low)
    IFS0bits.T1IF = 0;
    IEC0bits.T1IE = 1;

    // Start timer
    T1CONbits.TON = 1;
}


// ____________-______________________________--


static void GetTickCopy(void);

/*****************************************************************************
  Function:
        static void GetTickCopy(void)

  Summary:
        Reads the tick value.

  Description:
        This function performs an interrupt-safe and synchronized read of the
        48-bit Tick value.

  Precondition:
        None

  Parameters:
        None

  Returns:
        None
 ***************************************************************************/
static void GetTickCopy(void) {
    // Perform an Interrupt safe and synchronized read of the 48-bit
    // tick value
#if defined(__18CXX)
    do {
        INTCONbits.TMR0IE = 1; // Enable interrupt
        Nop();
        INTCONbits.TMR0IE = 0; // Disable interrupt
        vTickReading[0] = TMR0L;
        vTickReading[1] = TMR0H;
        *((DWORD*) & vTickReading[2]) = dwInternalTicks;
    } while (INTCONbits.TMR0IF);
    INTCONbits.TMR0IE = 1; // Enable interrupt
#elif defined(__C30__)
    do {
        DWORD dwTempTicks;

        IEC0bits.T1IE = 1; // Enable interrupt
        Nop();
        IEC0bits.T1IE = 0; // Disable interrupt

        // Get low 2 bytes
        ((WORD*) vTickReading)[0] = TMR1;

        // Correct corner case where interrupt increments byte[4+] but
        // TMR1 hasn't rolled over to 0x0000 yet
        dwTempTicks = dwInternalTicks;
        if (((WORD*) vTickReading)[0] == 0xFFFFu)
            dwTempTicks--;

        // Get high 4 bytes
        vTickReading[2] = ((BYTE*) & dwTempTicks)[0];
        vTickReading[3] = ((BYTE*) & dwTempTicks)[1];
        vTickReading[4] = ((BYTE*) & dwTempTicks)[2];
        vTickReading[5] = ((BYTE*) & dwTempTicks)[3];
    } while (IFS0bits.T1IF);
    IEC0bits.T1IE = 1; // Enable interrupt
#else	// PIC32
    do {
        DWORD dwTempTicks;

        IEC0SET = _IEC0_T1IE_MASK; // Enable interrupt
        Nop();
        IEC0CLR = _IEC0_T1IE_MASK; // Disable interrupt
        Nop(); // PIC32 has some latency before the disable will
        Nop(); // take affect, so we need to wait a couple of cyles

        // Get low 2 bytes
        ((WORD*) vTickReading)[0] = TMR1;

        // Correct corner case where interrupt increments byte[4+] but
        // TMR1 hasn't rolled over to 0x0000 yet
        dwTempTicks = dwInternalTicks;
        Nop(); // PIC32 has some latency between the TMR1 match to PR1 before the IFS0bits.T1IF bit gets set.
        Nop(); // These Nop()s force the C32 compiler to hold off sampling the volatile IFS0 register for a couple of cycles for the bit to get set.
        if (((WORD*) vTickReading)[0] == 0xFFFFu)
            dwTempTicks--;

        // Get high 4 bytes
        vTickReading[2] = ((BYTE*) & dwTempTicks)[0];
        vTickReading[3] = ((BYTE*) & dwTempTicks)[1];
        vTickReading[4] = ((BYTE*) & dwTempTicks)[2];
        vTickReading[5] = ((BYTE*) & dwTempTicks)[3];
    } while (IFS0bits.T1IF);
    IEC0SET = _IEC0_T1IE_MASK; // Enable interrupt
#endif
}

/*****************************************************************************
  Function:
        DWORD escher_tick_get(void)

  Summary:
        Obtains the current Tick value.

  Description:
        This function retrieves the current Tick value, allowing timing and
        measurement code to be written in a non-blocking fashion.  This function
        retrieves the least significant 32 bits of the internal tick counter,
        and is useful for measuring time increments ranging from a few
        microseconds to a few hours.  Use TickGetDiv256 or TickGetDiv64K for
        longer periods of time.

  Precondition:
        None

  Parameters:
        None

  Returns:
        Lower 32 bits of the current Tick value.
 ***************************************************************************/
DWORD escher_tick_get(void) {
    GetTickCopy();
    return *((DWORD*) & vTickReading[0]);
}

/*****************************************************************************
  Function:
        DWORD escher_tick_get_div256(void)

  Summary:
        Obtains the current Tick value divided by 256.

  Description:
        This function retrieves the current Tick value, allowing timing and
        measurement code to be written in a non-blocking fashion.  This function
        retrieves the middle 32 bits of the internal tick counter,
        and is useful for measuring time increments ranging from a few
        minutes to a few weeks.  Use TickGet for shorter periods or TickGetDiv64K
        for longer ones.

  Precondition:
        None

  Parameters:
        None

  Returns:
        Middle 32 bits of the current Tick value.
 ***************************************************************************/
DWORD escher_tick_get_div256(void) {
    DWORD_VAL ret;

    GetTickCopy();
    ret.v[0] = vTickReading[1]; // Note: This copy must be done one
    ret.v[1] = vTickReading[2]; // byte at a time to prevent misaligned
    ret.v[2] = vTickReading[3]; // memory reads, which will reset the PIC.
    ret.v[3] = vTickReading[4];

    return ret.Val;
}

/*****************************************************************************
  Function:
        DWORD escher_tick_get_div64K(void)

  Summary:
        Obtains the current Tick value divided by 64K.

  Description:
        This function retrieves the current Tick value, allowing timing and
        measurement code to be written in a non-blocking fashion.  This function
        retrieves the most significant 32 bits of the internal tick counter,
        and is useful for measuring time increments ranging from a few
        days to a few years, or for absolute time measurements.  Use TickGet or
        TickGetDiv256 for shorter periods of time.

  Precondition:
        None

  Parameters:
        None

  Returns:
        Upper 32 bits of the current Tick value.
 ***************************************************************************/
DWORD escher_tick_get_div64K(void) {
    DWORD_VAL ret;

    GetTickCopy();
    ret.v[0] = vTickReading[2]; // Note: This copy must be done one
    ret.v[1] = vTickReading[3]; // byte at a time to prevent misaligned
    ret.v[2] = vTickReading[4]; // memory reads, which will reset the PIC.
    ret.v[3] = vTickReading[5];

    return ret.Val;
}

/*****************************************************************************
  Function:
        DWORD escher_tick_to_milliseconds(DWORD dwTickValue)

  Summary:
        Converts a Tick value or difference to milliseconds.

  Description:
        This function converts a Tick value or difference to milliseconds.  For
        example, TickConvertToMilliseconds(32768) returns 1000 when a 32.768kHz
        clock with no prescaler drives the Tick module interrupt.

  Precondition:
        None

  Parameters:
        dwTickValue	- Value to convert to milliseconds

  Returns:
        Input value expressed in milliseconds.

  Remarks:
        This function performs division on DWORDs, which is slow.  Avoid using
        it unless you absolutely must (such as displaying data to a user).  For
        timeout comparisons, compare the current value to a multiple or fraction
        of TICK_SECOND, which will be calculated only once at compile time.
 ***************************************************************************/
DWORD escher_tick_to_ms(DWORD dwTickValue) {
    return (dwTickValue + (TICKS_PER_SECOND / 2000ul)) / ((DWORD) (TICKS_PER_SECOND / 1000ul));
}


/*****************************************************************************
  Function: Timer1 Interrupt Service Routine
  Description:
        Updates the tick value when an interrupt occurs.
 ***************************************************************************/

#if defined(__PIC32MX__)
void __attribute((interrupt(ipl2), vector(_TIMER_1_VECTOR), nomips16)) _T1Interrupt(void) {
    // Increment internal high tick counter
    dwInternalTicks++;

    // Reset interrupt flag
    IFS0CLR = _IFS0_T1IF_MASK;

#else
#if __C30_VERSION__ >= 300
void _ISR __attribute__((__no_auto_psv__)) _T1Interrupt(void)
#else
void _ISR _T1Interrupt(void)
#endif
{
    // Increment internal high tick counter
    dwInternalTicks++;
    IFS0bits.T1IF = 0;

//     LATFbits.LATF12  ^= 1;

#endif
// update time
//    Sec++; // increment the seconds counter
//    if (Sec > 59) // 60 seconds make a minute
//    {
//        Sec = 0;
//        Min++; // increment the minute counter
//
//        if (Min > 59)// 59 minutes in an hour
//            Min = 0;
//    } // minutes
}
