/* *******************************************************************
 *
 * ESCHER dsPIC-Board Test routines for escher library
 *
 *********************************************************************
 * FileName:        main.c
 * Dependencies:    escher_board.h escher_UART.h ... escher_*.h
 * Processor:       dsPIC33F (tested on 33FJ128MC708)
 * Compiler:	    Microchip C30 v3.01 or higher
 * Company:         Algorythmics
 *
 * License: GPL V3.0
 *
 * Author              Date         Comment
 *~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
 * Created on 10. Dezember 2011, 20:26
 * Winfried Ritsch
 *
 *
 * Comment now:
 * for MPLABX did not get the project running for this as test without
 * include in the library
 * already worked with prototype Escher and Escher V1.0 (CC-By-NC-SA)
 ********************************************************************/
#include <p33Fxxxx.h> // now in escher_board.h dont know why...
#include "GenericTypeDefs.h"

// for configuration bits only once in a project
#define ESCHER_DEFAULT_CONFIGURATION_BITS

#include "escherRTC.h"

#include "escherBoard.h"
#include "escherUART.h"

#define UARTS_TEST
#define UARTS_TEST_LOOPS  10

#define LEDS_TEST
#define LEDS_TEST_LOOPS 10

// local prototypes
static void test_obleds(void);
static void test_uarts(void);

int main(void) {

    escher_init();

    while (1) {
#if defined(LEDS_TEST)
        test_obleds();
#endif

#if defined (UARTS_TEST)
        test_uarts();
#endif

    }
    return 0;
}

// ------------------------ LEDs Test -------------------------------------
// BLINK ledS for 10 sec

void test_obleds(void) {
    int i = LEDS_TEST_LOOPS;

    escher_led0();
    escher_led1();
    escher_led2();
    escher_led3();
    escher_delay_ms(1000);
    escher_unled0();
    escher_unled1();
    escher_unled2();
    escher_unled3();
    escher_delay_ms(1000);

    while (i--) {
        escher_delay_ms(250);
        escher_toggle_led0();
        escher_delay_ms(250);
        escher_toggle_led1();
        escher_delay_ms(250);
        escher_toggle_led2();
        escher_delay_ms(250);
        escher_toggle_led3();
    }
}

// ---------------- UARTS Test ------------------------------------------------
// NOTE: FOR TEST connect UART1 Receive and transmit for read, write test

#define MAX_BYTES 256

unsigned char ins[MAX_BYTES];
unsigned char outs[MAX_BYTES];

void test_uarts(void) {
    long int err_count, oerr_count, ferr_count, loop_count;
    unsigned int incount;
    unsigned int outcount;

    unsigned char byte;

    outcount = incount = 0;
    err_count = 0;
    oerr_count = 0;
    ferr_count = 0;
    loop_count = 0;

    escher_unled0();
    escher_unled1();
    escher_unled2();
    escher_unled3();
    
    escher_UART1_init();
    escher_UART2_init();

    while (loop_count < UARTS_TEST_LOOPS) {

        byte = (unsigned char) outcount;
        outs[outcount] = byte;

        while (!escher_UART1_rts());
        {
            escher_UART1_write((byte));
            escher_UART2_write((byte)); // should be in sync with UART1
            outcount++;
            if (outcount >= MAX_BYTES) {
                outcount = 0;
                loop_count++;
                escher_toggle_led0();
            };
        }

        while (escher_UART1_rtr()) {

            if (U1STAbits.FERR) {
                ferr_count++;
                escher_led3();

                byte = escher_UART1_read(); // drop wrong data
                continue;
            } else
                escher_unled3();

            byte = escher_UART1_read();
            ins[incount] = byte;
            if (byte != incount) {
                escher_led2();
                err_count++;
                incount = byte; // try to sync
            } else
                escher_unled2();

            incount++;
            if (incount >= MAX_BYTES)
                incount = 0;
        }

        if (U1STAbits.OERR) {
            oerr_count++;
            escher_led1();

            // data received should read first,
            // but here we dont care, read before
            U1STAbits.OERR = 0;
        } else
            escher_unled1();
    }
}
