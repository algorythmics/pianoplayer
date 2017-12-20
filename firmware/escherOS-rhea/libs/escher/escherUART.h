/* *******************************************************************
 *
 * Escher  UART Control
 *
 *********************************************************************
 * FileName:        escherUART.h
 * Dependencies:
 * Processor:       dsPIC33F (33FJ128MC708)
 * Company:         Algorythmics
 *
 * License: GPL V3.0 
 *
 * Author              Date         Comment
 *~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
 * W Ritsch			6.8.2010       adapted for phoibe Player 
 * W Ritsch			16.12.2011       adapted for escher lib
 * logs now on svn or git...
 * 
 * Comment now:
 * Use both uarts to control master/slave escher 
 * Not using hardware handshake since this pins are used for other I/Os
 * since transmit fifo is 4(5) bytes and max command is 4 bytes we dont need
 * a bigger FIFO until now...

 * Note: defines does not use the escher_ prefix hoping there is no
 *       name collission with other modules...
 *
 * TODO: use DMA for bigger FIFO 
 ********************************************************************/

// for old implementations uncomment or use before include
// #define NO_ESCHER_PREFIX

/* definitions for the UART communication ports 1,2 */
/* UARTs Definition for escher:

 Clock Source for UART Use FCY as Input:
 Here: Fosc=160MHz/2 = 80Mhz , FCY=FOSC/2=40MHz

  BRGH = 0: (normal speed) 1:16, BREG? = (FCY/16/baudrate)-1
  BRGH = 1: (high speed) 1:4, BREG? = (FCY/4/baudrate)-1 

   default we use: 115,200 so we use high speed
   BREG = (40000000/115200)/4 -1 = 85,8 => 86
   Fehler= 0,23% tolerabel bis +/-5%

   on 230400: BRGH=1, BREG= 42,4 => 42 (0,9% error)

   better stability
   BRGH=0, BREG=21,7 => 22 (1,3%Fehler) 16xsampling 

*/
/* testing module uncomment following line and compile*/
//#define UART_TEST

#define ESCHER_DEFAULT_BAUDRATE 115200
#define ESCHER_DEFAULT_BRGH 0
#define ESCHER_DEFAULT_BRGVAL 22

// local functions
void escher_UART1_init(void);
void escher_UART2_init(void);
void escher_UART1_reset(void);
void escher_UART2_reset(void);

#define escher_UART1_write(data) (U1TXREG = (data))
#define escher_UART1_read()	(U1RXREG)
#define escher_UART1_rts() (U1STAbits.UTXBF == 0b0) // ready to send
#define escher_UART1_rtr() (U1STAbits.URXDA == 0b01) // ready to receive

#define escher_UART2_write(data) (U2TXREG = (data))
#define escher_UART2_read()	(U2RXREG)
#define escher_UART2_rts() (U2STAbits.UTXBF == 0) // ready to send
#define escher_UART2_rtr() (U2STAbits.URXDA == 1) // ready to receive

// ------- deprecated old stuff now disable by default ---------------------

#if defined(ESCHER_USE_UART_DEPRICATED)
#warning UARTxxxx functions deprecated, use escher_ prefix in future

#define escherSerial1Write(byte) if(escher_UART1_rts())escher_UART1_write((byte))
#define escherSerial2Write(byte) if(escher_UART2_rts())escher_UART2_write((byte))

#if defined(NO_ESCHER_PREFIX)

#define UART1write(data) (U1TXREG = (data))
#define UART1read()	(U1RXREG)
#define UART1rts() (U1STAbits.UTXBF == 0b0) // ready to send#define UART1rtr() (U1STAbits.URXDA == 0b01) // ready to receive

#define UART2write(data) (U2TXREG = (data))
#define UART2read()	(U2RXREG)
#define UART2rts() (U2STAbits.UTXBF == 0) // ready to send
#define UART2rtr() (U2STAbits.URXDA == 1) // ready to receive
#endif
#endif
