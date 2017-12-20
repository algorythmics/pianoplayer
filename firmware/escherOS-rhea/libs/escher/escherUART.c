/* *******************************************************************
 *
 * Escher  UART Control
 *
 *********************************************************************
 * FileName:        escherUART.c
 * Dependencies:    escherBoard.h, escherUART.h
 * Processor:       dsPIC33F (33FJ128MC708)
 * Compiler:        Microchip C30 v3.01 or higher
 * Company:         Algorythmics
 *
 * License: GPL V3.0 
 *
 * Author              Date         Comment
 *~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
 * W Ritsch			6.8.2010       adapted for phoibe Player 1 FET Board

 * Comment now: see header
 * TODO: see header
 ********************************************************************/
// Include correct processor defs from compile arg in project
#include <p33Fxxxx.h>

#include "escherBoard.h"
#include "escherUART.h"

/*********************************************************************
 * Function:        void escher_UART1/2_init(void)
 *
 * Arguments:
 *
 * PreCondition:    Init Escher board
 * Side Effects:    default values for escher UART interconnection
 *
 * Overview:        Init UART1 or UART2 for interconnection between escher
 *                  with default values or with Host also using
 *                  default values defined in escherUART.h
 *
 ********************************************************************/

void escher_UART1_init(void) {
    U1MODEbits.USIDL = 0; // continue in idle moder
    U1MODEbits.IREN = 0; // disable IR function
    U1MODEbits.RTSMD = 0; // Flow Control if RTS/CTS used
    U1MODEbits.UEN = 0; // no RTS/CTS used (ltaches drive them)
    U1MODEbits.WAKE = 0; // no wakeup implemented
    U1MODEbits.LPBACK = 0; // no loopbackmode
    U1MODEbits.ABAUD = 0; // no autobaud detection
    U1MODEbits.URXINV = 0; // no inversion on receive pin

    U1MODEbits.STSEL = 0; // 1 Stop bit
    U1MODEbits.PDSEL = 0; // No Parity, 8 data bits

    U1MODEbits.BRGH = ESCHER_DEFAULT_BRGH; // Low Speed mode
    U1BRG = ESCHER_DEFAULT_BRGVAL; // BAUD Rate Setting for 9600

    IEC0bits.U1TXIE = 0; // Disable UART TX Interrupt
    // interupt mode 00 means interrupt each byte send.
    U1STAbits.UTXISEL0 = 0; // Interrupt after one TX Character is transmitted
    U1STAbits.UTXISEL1 = 0;
    U1STAbits.URXISEL = 0; // Interrupt after one RX character is received;

    U1MODEbits.UARTEN = 1; // Enable UART
    /* wait at least 1 bit as  (eg. 8.6 usec at 115200BAUD) before sending first char */
    escher_delay_10us(1);
    /* enable transmitter */
    U1STAbits.UTXEN = 1; // Enable UART TX
}

void escher_UART2_init(void) {
    U2MODEbits.USIDL = 0; // continue in idle moder
    U2MODEbits.IREN = 0; // disable IR function
    U2MODEbits.RTSMD = 0; // Flow Control if RTS/CTS used
    U2MODEbits.UEN = 0; // no RTS/CTS used (ltaches drive them)
    U2MODEbits.WAKE = 0; // no wakeup implemented
    U2MODEbits.LPBACK = 0; // no loopbackmode
    U2MODEbits.ABAUD = 0; // no autobaud detection
    U2MODEbits.URXINV = 0; // no inversion on receive pin

    U2MODEbits.STSEL = 0; // 1 Stop bit
    U2MODEbits.PDSEL = 0; // No Parity, 8 data bits

    U2MODEbits.BRGH = ESCHER_DEFAULT_BRGH; // Low Speed mode
    U2BRG = ESCHER_DEFAULT_BRGVAL; // BAUD Rate Setting for 9600

    IEC1bits.U2TXIE = 0; // Disable UART TX Interrupt
    // interupt mode 00 means interrupt each byte send.
    U2STAbits.UTXISEL0 = 0; // Interrupt after one TX Character is transmitted
    U2STAbits.UTXISEL1 = 0;
    U2STAbits.URXISEL = 0; // Interrupt after one RX character is received;

    U2MODEbits.UARTEN = 1; // Enable UART

    /* wait at least 1 bit as  (eg. 8.6 usec at 115200BAUD) before sending first char */
    escher_delay_10us(1);

    U2STAbits.UTXEN = 1; // Enable UART TX
}

/* ---- empty and clear errors ---- */

void escher_UART1_reset(void) {
    //empty inbuf
    while (escher_UART1_rtr())
        escher_UART1_read();
    // clear error state
    U1STAbits.OERR = 0;
}

void escher_UART2_reset(void) {
    //empty inbuf
    while (escher_UART2_rtr())
        escher_UART2_read();
    // clear error state
    U2STAbits.OERR = 0;
}

/* now used defines since so simple, later inline cmds and interrupt with dma */
//__inline__ void escher_UART1_write(BYTE data);
//__inline__ integer escher_UART1_datareceived(void);
//__inline__ unsigned char escher_UART1read(void);
//
//__inline__ void escher_UART2write(BYTE data);
//__inline__ integer escher_UART2_datareceived(void);
//__inline__ unsigned char escher_UART2_read(void);
//
// ------ if interrupts are used -----------------------

void __attribute__((interrupt, no_auto_psv)) _U1TXInterrupt(void) {
    IFS0bits.U1TXIF = 0; // clear TX interrupt flag
    // do transmit code ....
    // U1TXREG = ...;  Transmit one character
}

void __attribute__((interrupt, no_auto_psv)) _U1RXInterrupt(void) {
    IFS0bits.U1RXIF = 0; // clear TX interrupt flag
    // do transmit code ....
    // = U1RXREG;  Receive one character
}

void __attribute__((interrupt, no_auto_psv)) _U2TXInterrupt(void) {
    IFS1bits.U2TXIF = 0; // clear TX interrupt flag
    // do transmit code ....
    // U2TXREG = ...;  Transmit one character
}

void __attribute__((interrupt, no_auto_psv)) _U2RXInterrupt(void) {
    IFS1bits.U2RXIF = 0; // clear TX interrupt flag
    // do transmit code ....
    // = U1RXREG;  Receive one character
}

// --------------------------- CODE SNIPPETS for later implementation, better calc yourself
//#if defined(STACK_USE_UART)
//	UARTTX_TRIS = 0;
//	UARTRX_TRIS = 1;
//	UMODE = 0x8000;			// Set UARTEN.  Note: this must be done before setting UTXEN
//
//	#if defined(__C30__)
//	USTA = 0x0400;		// UTXEN set
//	#define CLOSEST_UBRG_VALUE ((GetPeripheralClock()+8ul*BAUD_RATE)/16/BAUD_RATE-1)
//	#define BAUD_ACTUAL (GetPeripheralClock()/16/(CLOSEST_UBRG_VALUE+1))
//	#else	//defined(__C32__)
//		USTA = 0x00001400;		// RXEN set, TXEN set
//		#define CLOSEST_UBRG_VALUE ((GetPeripheralClock()+8ul*BAUD_RATE)/16/BAUD_RATE-1)
//		#define BAUD_ACTUAL (GetPeripheralClock()/16/(CLOSEST_UBRG_VALUE+1))
//	#endif
//	
//	#define BAUD_ERROR ((BAUD_ACTUAL > BAUD_RATE) ? BAUD_ACTUAL-BAUD_RATE : BAUD_RATE-BAUD_ACTUAL)
//	#define BAUD_ERROR_PRECENT	((BAUD_ERROR*100+BAUD_RATE/2)/BAUD_RATE)
//	#if (BAUD_ERROR_PRECENT > 3)
//		#warning UART frequency error is worse than 3%
//	#elif (BAUD_ERROR_PRECENT > 2)
//		#warning UART frequency error is worse than 2%
//	#endif
//	
//	UBRG = CLOSEST_UBRG_VALUE;
//#endif
//

