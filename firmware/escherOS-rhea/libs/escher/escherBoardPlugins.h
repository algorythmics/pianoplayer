/* *******************************************************************
 *
 * ESCHER dsPIC-Board Hardware Plugins Definitions
 *
 *********************************************************************
 * FileName     : escher_boardplugins.h
 * Dependencies : escher_board.h
 * Processor
 *  - targets   : dsPIC33F
 *  - tested    : 33FJ128MC708
 * Compiler     : Microchip C30 v3.01 or higher
 * Company      : Algorythmics
 *
 *  * License: GPL V3.0
 *
 * A hardware plugin is small a circuit which can plugged on the escher board
 * and removed and have been made for testing purposes and small interfaces
 * Here some historical plugins are defined to be used and this file is used
 * to seperate them from the core board definition
 *
 * NOTE: modules, like fet16, are defined in seperate files for each module
 * 
 * Author              Date         Comment
 *~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
 * Winfried Ritsch     2.2.2012     more generalized for new OS
 *
 *  * Comment now: not tested
 *
 ********************************************************************/

#ifndef __ESCHER_BOARDPLUGINS_H
#define __ESCHER_BOARDPLUGINS_H

/* ------ Defines for external Hardware, for different MCUs in future ----- */

/* definitions for the UART communication ports 1,2 */
/*
  BREGH = 0: (normal speed) 1:16, BREG? = (FCY/16/baudrate)-1
  BREGH = 1: (high speed) 1:4, BREG? = (FCY/4/baudrate)-1 */

/* default we use: 115,200 so we use high speed
   BREG = (80000000/115200)/4 -1 = 173,6 => 174
   Fehler= 0,23% tolerabel
 */
#define DEFAULT_BAUDRATE 115200
#define DEFAULT_BREG 174

/* UART 1 */
#define UART1TX_TRIS		(TRISFbits.TRISF5)
#define UART1TX_IO			(PORTFbits.RF5)
#define UART1RX_TRIS		(TRISFbits.TRISF4)
#define UART1RX_IO			(PORTFbits.RF4)

// Attention: overlap with General IO Pins IC7, IC8 (CN20, CN21)
#define UART1CTS_IO			(PORTDbits.RD14)
#define UART1CTS_TRIS		(TRISDbits.RD14)
#define UART1RTS_IO			(PORTDbits.RD15)
#define UART1RTS_TRIS		(TRISDbits.RD15)


/* UART 2 (overlap with CN20, CN21) */
#define UART2TX_TRIS		(TRISFbits.TRISF5)
#define UART2TX_IO			(PORTFbits.RF5)
#define UART2RX_TRIS		(TRISFbits.TRISF4)
#define UART2RX_IO			(PORTFbits.RF4)

// optional Handshake,
// Attention: overlap with General IO Pins AN8, AN14
#define UART2CTS_IO			(PORTBbits.RB8)
#define UART2CTS_TRIS		(TRISBbits.RB8)
#define UART2RTS_IO			(PORTBbits.RB14)
#define UART2RTS_TRIS		(TRISBbits.RB14)

#if defined(ALGOPIC_PROTOTYPE)
// RG9 Algopic
#define LED0_TRIS			(P0_IO0_TRIS)	// Ref D3
#define LED0_IO				(P0_IO0)
#define LED1_TRIS			(P0_IO1_TRIS)	// Ref D4
#define LED1_IO				(P0_IO1)
#define LED2_TRIS			(P0_IO2_TRIS)	// Ref D5
#define LED2_IO				(P0_IO2)
#define LED3_TRIS			(P0_IO3_TRIS)	// Ref D6
#define LED3_IO				(P0_IO3)
#define LED4_TRIS			(P0_IO4_TRIS)	// Ref D7
#define LED4_IO				(P0_IO4)
#define LED5_TRIS			(P0_IO5_TRIS)	// Ref D8
#define LED5_IO				(P0_IO5)
#define LED6_TRIS			(P0_IO6_TRIS)	// Ref D9
#define LED6_IO				(P0_IO6)
#define LED7_TRIS			(P0_IO7_TRIS)	// Ref D10	// Note: This is multiplexed with BUTTON1
#define LED7_IO				(P0_IO7)

//	#define LED_GET()			(*((volatile unsigned char*)(&LATA)))
//	#define LED_PUT(a)			(*((volatile unsigned char*)(&LATA)) = (a))

#define BUTTON0_TRIS		(P1_IO0_TRIS)	// Ref S4
#define	BUTTON0_IO			(P1_IO0)
#define BUTTON1_TRIS		(P1_IO1_TRIS)	// Ref S5	// Note: This is multiplexed with LED7
#define	BUTTON1_IO			(P1_IO1)
#define BUTTON2_TRIS		(P1_IO2_TRIS)	// Ref S6
#define	BUTTON2_IO			(P1_IO2)
#define BUTTON3_TRIS		(P1_IO3_TRIS)	// Ref S3
#define	BUTTON3_IO			(P1_IO3)


#endif // __ESCHER_BOARDPLUGINS_H
void escher_init_poti(void); // historic plugin, not used anymore


/* For Future: Usage if Peripherals are used */

//	// 25LC256 I/O pins
//	#define EEPROM_CS_TRIS		(TRISDbits.TRISD12)
//	#define EEPROM_CS_IO		(PORTDbits.RD12)
//	#define EEPROM_SCK_TRIS		(TRISGbits.TRISG6)
//	#define EEPROM_SDI_TRIS		(TRISGbits.TRISG7)
//	#define EEPROM_SDO_TRIS		(TRISGbits.TRISG8)
//	#if defined(__C30__)	// PIC24F, PIC24H, dsPIC30, dsPIC33
//		#define EEPROM_SPI_IF		(IFS2bits.SPI2IF)
//		#define EEPROM_SSPBUF		(SPI2BUF)
//		#define EEPROM_SPICON1		(SPI2CON1)
//		#define EEPROM_SPICON1bits	(SPI2CON1bits)
//		#define EEPROM_SPICON2		(SPI2CON2)
//		#define EEPROM_SPISTAT		(SPI2STAT)
//		#define EEPROM_SPISTATbits	(SPI2STATbits)
//	#else					// PIC32
//		#define EEPROM_SPI_IF		(IFS1bits.SPI2RXIF)
//		#define EEPROM_SSPBUF		(SPI2BUF)
//		#define EEPROM_SPICON1		(SPI2CON)
//		#define EEPROM_SPICON1bits	(SPI2CONbits)
//		#define EEPROM_SPIBRG		(SPI2BRG)
//	#endif
//

//	// Serial Flash/SRAM/UART PICtail Plus attached to SPI2 (middle pin group)
//	#define SPIRAM_CS_TRIS			(TRISGbits.TRISG9)
//	#define SPIRAM_CS_IO			(LATGbits.LATG9)
//	#define SPIRAM_SCK_TRIS			(TRISGbits.TRISG6)
//	#define SPIRAM_SDI_TRIS			(TRISGbits.TRISG7)
//	#define SPIRAM_SDO_TRIS			(TRISGbits.TRISG8)
//	#if defined(__C30__)	// PIC24F, PIC24H, dsPIC30, dsPIC33
//		#define SPIRAM_SPI_IF			(IFS2bits.SPI2IF)
//		#define SPIRAM_SSPBUF			(SPI2BUF)
//		#define SPIRAM_SPICON1			(SPI2CON1)
//		#define SPIRAM_SPICON1bits		(SPI2CON1bits)
//		#define SPIRAM_SPICON2			(SPI2CON2)
//		#define SPIRAM_SPISTAT			(SPI2STAT)
//		#define SPIRAM_SPISTATbits		(SPI2STATbits)
//	#else					// PIC32
//		#define SPIRAM_SPI_IF			(IFS1bits.SPI2RXIF)
//		#define SPIRAM_SSPBUF			(SPI2BUF)
//		#define SPIRAM_SPICON1			(SPI2CON)
//		#define SPIRAM_SPICON1bits		(SPI2CONbits)
//		#define SPIRAM_SPIBRG			(SPI2BRG)
//	#endif
//	#define SPIFLASH_CS_TRIS		(TRISBbits.TRISB8)
//	#define SPIFLASH_CS_IO			(LATBbits.LATB8)
//	#define SPIFLASH_SCK_TRIS		(TRISGbits.TRISG6)
//	#define SPIFLASH_SDI_TRIS		(TRISGbits.TRISG7)
//	#define SPIFLASH_SDI_IO			(PORTGbits.RG7)
//	#define SPIFLASH_SDO_TRIS		(TRISGbits.TRISG8)
//	#if defined(__C30__)	// PIC24F, PIC24H, dsPIC30, dsPIC33
//		#define SPIFLASH_SPI_IF			(IFS2bits.SPI2IF)
//		#define SPIFLASH_SSPBUF			(SPI2BUF)
//		#define SPIFLASH_SPICON1		(SPI2CON1)
//		#define SPIFLASH_SPICON1bits	(SPI2CON1bits)
//		#define SPIFLASH_SPICON2		(SPI2CON2)
//		#define SPIFLASH_SPISTAT		(SPI2STAT)
//		#define SPIFLASH_SPISTATbits	(SPI2STATbits)
//	#else					// PIC32
//		#define SPIFLASH_SPI_IF			(IFS1bits.SPI2RXIF)
//		#define SPIFLASH_SSPBUF			(SPI2BUF)
//		#define SPIFLASH_SPICON1		(SPI2CON)
//		#define SPIFLASH_SPICON1bits	(SPI2CONbits)
//		#define SPIFLASH_SPIBRG			(SPI2BRG)
//	#endif

