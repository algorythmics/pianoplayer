/*********************************************************************
 *
 *   Hardware specific definitions for:
 *    - dsPIC33E USB Starter Kit
 *    - PIC24E, dsPIC33E
 *    - Fast 100Mbps Ethernet PICtail Plus (ENC624J600)
 *    - parallelboard uses PMP mode 5 (not indexed)
 *
 *********************************************************************
 * FileName:        HWP_dsPIC33E_SK_ENC624.h
 * Dependencies:    Compiler.h
 * Processor:       PIC24E, dsPIC33E
 * Compiler:        Microchip C30 v3.30 or higher
 * Company      : Algorythmics
 *
 *  * License: GPL V3.0
 *
 *  Derived from MicroChip TCP/IP-Stack used for Escher Hardware
 * 
 * This module defines the escher hardware specific parts for various
 * boards like escher1 and Evaluation boards
 * and also helper to startup escher boards.
 *
 * Ports are the Interfaces of the escher hardware like described
 * in the manual trying to keep up with versions of the board.
 *
 *
 * Author              Date         Comment
 *~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
 * Howard Schlunder      09/16/2010   Regenerated for specific boards
 * Winfried Ritsch     12.5.2012    diversion to dsPIC33E Startkit w PUCTAIL 100MB
 *  ********************************************************************/
#ifndef HARDWARE_PROFILE_dsPIC33E_SK_ENC624_H
#define HARDWARE_PROFILE_dsPIC33E_SK_ENC624_H

#include "Compiler.h"

// Define a macro describing this hardware set up (used in other files)
#define dsPIC33E_SK
#define ESCHER_HW_dsPIC33E_SK
#define ESCHER_ENC624      // we use the enc624
#define ESCHER_ENC624_PSP5 // for parallel board specific defines (should be avoided)

#if  defined(ESCHER2_DEFAULT_CLOCK_SETTINGS) && defined(THIS_IS_MAIN)
// All dsPIC33E and PIC24E PIMs
_FOSCSEL(FNOSC_PRIPLL) // Primary PLL enabled
_FOSC(OSCIOFNC_OFF & POSCMD_XT) // XT Osc
#endif

#if  defined(ESCHER2_DEFAULT_CLOCK_SETTINGS)

/* OSCILLATOR Frequency setting from Demo Application:
 * Multiply by 40 for 160MHz VCO output (8MHz XT oscillator)
 * FRC: divide by 2, PLLPOST: divide by 2, PLLPRE: divide by 2
 *
 * F_OSC= F_IN * (PLLDIV+2) / ( (PLLPRE+2) * 2*(PLLPOST+1) )
 *
 * 8Mhz * (38+2) / (0+2)*2*(0+1) = 80Mhz
 */
#define ESCHER_PLLPOST 0b00
#define ESCHER_PLLPRE 0b00
#define ESCHER_PLLFBD  43 // Same as PLLDIV=M-2
//#define ESCHER_PLLFBD  38 // Same as PLLDIV=M-2 (default for stack)

#define ESCHER_OSCCONH 0x03 // FRC with PLL (NOSC=0b001)
#define ESCHER_OSCCONL 0b001 // as last 3 bits
#define ESCHER_OSCCONH_COSC 0b11
#define ESCHER_SWDTEN 0 // watchdogg disable
#define ESCHER_OSCTUN 0


#define OSC_FCY      (90316800ul)

#define BCG_VAL  1 // DSI not so fast Mode

        //#define OSC_FCY      (80000000ul)
#endif

// Clock frequency values
// These directly influence timed events using the Tick module.  They also are used for UART and SPI baud rate generation.
#if ! defined(GetSystemClock)
#define GetSystemClock()      (OSC_FCY) // Hz
#endif

#if defined (__dsPIC33E__)
/* InstructionClock Normally GetSystemClock()/2 for PIC24/dsPIC
 * Might need changing if using Doze modes. */
#define GetInstructionClock()   (GetSystemClock()/2)
#define GetPeripheralClock()   (GetSystemClock()/2)
#endif


// Hardware I/O pin mappings
// ----------------- On Board Hardware Definitions -----------------
// On Board LEDs (SAME as IC out on Port 1 !!!!)

#define OB_LED_ON 1
#define OB_LED_OFF 0

#define   OB_LED0_TRIS   (TRISDbits.TRISD0)
#define OB_LED0      (LATDbits.LATD0)
#define   OB_LED1_TRIS   (TRISDbits.TRISD1)
#define OB_LED1      (LATDbits.LATD1)
#define   OB_LED2_TRIS   (TRISDbits.TRISD2)
#define OB_LED2      (LATDbits.LATD2)
#define   OB_LED3_TRIS   (OB_LED0_TRIS)    // No such LED
#define OB_LED3      (OB_LED0)

//// Momentary push buttons NOT used on escher Developments
//
//#define BUTTON0_TRIS      (TRISDbits.TRISD6)   // Ref SW1
//#define BUTTON0_IO         (PORTDbits.RD6)
//#define BUTTON1_TRIS      (TRISDbits.TRISD7)   // Ref SW2
//#define BUTTON1_IO         (PORTDbits.RD7)
//#define BUTTON2_TRIS      (TRISDbits.TRISD13)   // Ref SW3
//#define BUTTON2_IO         (PORTDbits.RD13)
//#define BUTTON3_TRIS      (TRISDbits.TRISD13)   // No BUTTON3 on this board
//#define BUTTON3_IO         (1)

//// UART not used on Escher Developments
//// UART configuration (not too important since we don't have a UART
//// connector attached normally, but needed to compile if the STACK_USE_UART
//// or STACK_USE_UART2TCP_BRIDGE features are enabled.
//#define UARTTX_TRIS         (TRISFbits.TRISF3)
//#define UARTRX_TRIS         (TRISFbits.TRISF2)

// Hardware Definitions from maindemo.c for TCP/IP Stack 5.36


// Specify which SPI to use for the ENC28J60 or ENC624J600.  SPI1 is 
// the topmost slot with pin 1 on it.  SPI2 is the middle slot 
// starting on pin 33.
#define ENC_IN_SPI1
//#define ENC_IN_SPI2

// Note that SPI1 cannot be used when using the PIC32 USB Starter 
// Board or PIC32 USB Starter Kit II due to the USB peripheral pins 
// mapping on top of the ordinary SPI1 pinout.  
#if defined(ENC_IN_SPI1) && (defined(__32MX460F512L__) || defined(__32MX795F512L__))
#undef ENC_IN_SPI1
#define ENC_IN_SPI2
#endif


//// ENC28J60 I/O pins
//#if defined ENC_IN_SPI1
//   #define ENC_CS_TRIS         (TRISDbits.TRISD14)
//   #define ENC_CS_IO         (PORTDbits.RD14)
//   //#define ENC_RST_TRIS      (TRISDbits.TRISD15)   // Not connected by default.  It is okay to leave this pin completely unconnected, in which case this macro should simply be left undefined.
//   //#define ENC_RST_IO      (PORTDbits.RD15)
//
//   // SPI SCK, SDI, SDO pins are automatically controlled by the
//   #define ENC_SPI_IF         (IFS0bits.SPI1RXIF)
//   #define ENC_SSPBUF         (SPI1BUF)
//   #define ENC_SPICON1         (SPI1CON)
//   #define ENC_SPICON1bits      (SPI1CONbits)
//   #define ENC_SPIBRG         (SPI1BRG)
//   #define ENC_SPISTATbits      (SPI1STATbits)
//#elif defined ENC_IN_SPI2
//   #define ENC_CS_TRIS         (TRISFbits.TRISF12)
//   #define ENC_CS_IO         (PORTFbits.RF12)
//   //#define ENC_RST_TRIS      (TRISFbits.TRISF13)   // Not connected by default.  It is okay to leave this pin completely unconnected, in which case this macro should simply be left undefined.
//   //#define ENC_RST_IO      (PORTFbits.RF13)
//
//   // SPI SCK, SDI, SDO pins are automatically controlled by the
//   // PIC32 SPI module
//   #define ENC_SPI_IF         (IFS1bits.SPI2RXIF)
//   #define ENC_SSPBUF         (SPI2BUF)
//   #define ENC_SPICON1         (SPI2CON)
//   #define ENC_SPISTATbits      (SPI2STATbits)
//   #define ENC_SPICON1bits      (SPI2CONbits)
//   #define ENC_SPIBRG         (SPI2BRG)
//#endif


// ENC624J600 Interface Configuration
// Comment out ENC100_INTERFACE_MODE if you don't have an ENC624J600 or 
// ENC424J600.  Otherwise, choose the correct setting for the interface you 
// are using.  Legal values are:
//  - Commented out: No ENC424J600/624J600 present or used.  All other 
//                   ENC100_* macros are ignored.
//  - 0: SPI mode using CS, SCK, SI, and SO pins
//  - 1: 8-bit demultiplexed PSP Mode 1 with RD and WR pins
//  - 2: 8-bit demultiplexed PSP Mode 2 with R/Wbar and EN pins
//  - 3: 16-bit demultiplexed PSP Mode 3 with RD, WRL, and WRH pins
//  - 4: 16-bit demultiplexed PSP Mode 4 with R/Wbar, B0SEL, and B1SEL pins
//  - 5: 8-bit multiplexed PSP Mode 5 with RD and WR pins
//  - 6: 8-bit multiplexed PSP Mode 6 with R/Wbar and EN pins
//  - 9: 16-bit multiplexed PSP Mode 9 with AL, RD, WRL, and WRH pins
//  - 10: 16-bit multiplexed PSP Mode 10 with AL, R/Wbar, B0SEL, and B1SEL 
//        pins
#define ENC100_INTERFACE_MODE         5

// If using a parallel interface, direct RAM addressing can be used (if all 
// addresses wires are connected), or a reduced number of pins can be used 
// for indirect addressing.  If using an SPI interface or PSP Mode 9 or 10 
// (multiplexed 16-bit modes), which require all address lines to always be 
// connected, then this option is ignored. Comment out or uncomment this 
// macro to match your hardware connections.
//#define ENC100_PSP_USE_INDIRECT_RAM_ADDRESSING

// ENC424J600/624J600 parallel indirect address remapping macro function.
// This section translates SFR and RAM addresses presented to the 
// ReadMemory() and WriteMemory() APIs in ENCX24J600.c to the actual 
// addresses that must be presented on the parallel interface.  This macro 
// must be modified to match your hardware if you are using an indirect PSP 
// addressing mode (ENC100_PSP_USE_INDIRECT_RAM_ADDRESSING is defined) and 
// have some of your address lines tied off to Vdd.  If you are using the 
// SPI interface, then this section can be ignored or deleted.
#if (ENC100_INTERFACE_MODE == 1) || (ENC100_INTERFACE_MODE == 2) || (ENC100_INTERFACE_MODE == 5) || (ENC100_INTERFACE_MODE == 6) // 8-bit PSP
#define ENC100_TRANSLATE_TO_PIN_ADDR(a)      ((((a)&0x0100)<<6) | ((a)&0x00FF))
#elif (ENC100_INTERFACE_MODE == 3) || (ENC100_INTERFACE_MODE == 4) // 16-bit PSP
#define ENC100_TRANSLATE_TO_PIN_ADDR(a)      (a)
#endif

// Auto-crossover pins on Fast 100Mbps Ethernet PICtail/PICtail Plus.  If 
// your circuit doesn't have such a feature, delete these two defines.
#if defined(__dsPIC33E__)|| defined (__PIC24E__)

#define ENC100_MDIX_TRIS            (TRISAbits.TRISA9)
#define ENC100_MDIX_IO               (LATAbits.LATA9)

#else

#define ENC100_MDIX_TRIS            (TRISBbits.TRISB3)
#define ENC100_MDIX_IO               (LATBbits.LATB3)
#endif
// ENC624J600 I/O control and status pins
// If a pin is not required for your selected ENC100_INTERFACE_MODE 
// interface selection (ex: WRH/B1SEL for PSP modes 1, 2, 5, and 6), then 
// you can ignore, delete, or put anything for the pin definition.  Also, 
// the INT and POR pins are entirely optional.  If not connected, comment 
// them out.
#define ENC100_INT_TRIS               (TRISEbits.TRISE9)      // INT signal is optional and currently unused in the Microchip TCP/IP Stack.  Leave this pin disconnected and comment out this pin definition if you don't want it.
#define ENC100_INT_IO               (PORTEbits.RE9)
#if (ENC100_INTERFACE_MODE >= 1)   // Parallel mode
// PSP control signal pinout
#define ENC100_CS_TRIS               (TRISAbits.TRISA5)   // CS is optional in PSP mode.  If you are not sharing the parallel bus with another device, tie CS to Vdd and comment out this pin definition.
#define ENC100_CS_IO               (LATAbits.LATA5)
#define ENC100_POR_TRIS               (TRISCbits.TRISC1)   // POR signal is optional.  If your application doesn't have a power disconnect feature, comment out this pin definition.
#define ENC100_POR_IO               (LATCbits.LATC1)
#define ENC100_SO_WR_B0SEL_EN_TRIS      (TRISDbits.TRISD4)
#define ENC100_SO_WR_B0SEL_EN_IO      (LATDbits.LATD4)
#define ENC100_SI_RD_RW_TRIS         (TRISDbits.TRISD5)
#define ENC100_SI_RD_RW_IO            (LATDbits.LATD5)
#define ENC100_SCK_AL_TRIS            (TRISBbits.TRISB15)
#define ENC100_SCK_AL_IO            (LATBbits.LATB15)
#else
// SPI pinout
#if defined(__PIC24FJ256GA110__) || defined(__dsPIC33E__)|| defined (__PIC24E__)   // The PIC24FJ256GA110 must use SPI2 slot on Explorer 16.  If you don't have a PIC24FJ256GA110 but want to use SPI2 for some reason, you can use these definitions.
#define ENC100_CS_TRIS               (TRISFbits.TRISF12)   // CS is mandatory when using the SPI interface
#define ENC100_CS_IO               (LATFbits.LATF12)
#define ENC100_POR_TRIS               (TRISFbits.TRISF13)   // POR signal is optional.  If your application doesn't have a power disconnect feature, comment out this pin definition.
#define ENC100_POR_IO               (LATFbits.LATF13)
#else   // All other PIC24s, dsPICs, and PIC32s use SPI1 slot (top most closest to LCD)
#define ENC100_CS_TRIS               (TRISDbits.TRISD14)   // CS is mandatory when using the SPI interface
#define ENC100_CS_IO               (LATDbits.LATD14)
#define ENC100_POR_TRIS               (TRISDbits.TRISD15)   // POR signal is optional.  If your application doesn't have a power disconnect feature, comment out this pin definition.
#define ENC100_POR_IO               (LATDbits.LATD15)
#define ENC100_SO_WR_B0SEL_EN_TRIS      (TRISFbits.TRISF7)   // SO is ENCX24J600 Serial Out, which needs to connect to the PIC SDI pin for SPI mode
#define ENC100_SO_WR_B0SEL_EN_IO      (PORTFbits.RF7)
#define ENC100_SI_RD_RW_TRIS         (TRISFbits.TRISF8)   // SI is ENCX24J600 Serial In, which needs to connect to the PIC SDO pin for SPI mode
#define ENC100_SI_RD_RW_IO            (LATFbits.LATF8)
#define ENC100_SCK_AL_TRIS            (TRISFbits.TRISF6)
#endif
#endif


// ENC624J600 SPI SFR register selection (controls which SPI peripheral to 
// use on PICs with multiple SPI peripherals).  If a parallel interface is 
// used (ENC100_INTERFACE_MODE is >= 1), then the SPI is not used and this 
// section can be ignored or deleted.
#if defined(__PIC24FJ256GA110__)   // The PIC24FJ256GA110 must use SPI2 slot on Explorer 16.  If you don't have a PIC24FJ256GA110 but want to use SPI2 for some reason, you can use these definitions.
#define ENC100_ISR_ENABLE      (IEC3bits.INT4IE)
#define ENC100_ISR_FLAG         (IFS3bits.INT4IF)
#define ENC100_ISR_POLARITY      (INTCON2bits.INT4EP)
#define ENC100_ISR_PRIORITY      (IPC13bits.INT4IP)
#define ENC100_SPI_ENABLE      (ENC100_SPISTATbits.SPIEN)
#define ENC100_SPI_IF         (IFS1bits.SPI2IF)
#define ENC100_SSPBUF         (SPI2BUF)
#define ENC100_SPISTAT         (SPI2STAT)
#define ENC100_SPISTATbits      (SPI2STATbits)
#define ENC100_SPICON1         (SPI2CON1)
#define ENC100_SPICON1bits      (SPI2CON1bits)
#define ENC100_SPICON2         (SPI2CON2)

#elif defined (__dsPIC33E__) || defined (__PIC24E__)

#define ENC100_ISR_ENABLE      (IEC1bits.INT2IE)
#define ENC100_ISR_FLAG         (IFS1bits.INT2IF)
#define ENC100_ISR_POLARITY      (INTCON2bits.INT2EP)
#define ENC100_ISR_PRIORITY      (IPC7bits.INT2IP)
#define ENC100_SPI_ENABLE      (ENC100_SPISTATbits.SPIEN)
#define ENC100_SPI_IF         (IFS0bits.SPI2IF)
#define ENC100_SSPBUF         (SPI2BUF)
#define ENC100_SPISTAT         (SPI2STAT)
#define ENC100_SPISTATbits      (SPI2STATbits)
#define ENC100_SPICON1         (SPI2CON1)
#define ENC100_SPICON1bits      (SPI2CON1bits)
#define ENC100_SPICON2         (SPI2CON2)

#else   // All other PIC24s and dsPICs use SPI1 slot (top most closest to LCD)
#define ENC100_ISR_ENABLE      (IEC1bits.INT2IE)
#define ENC100_ISR_FLAG         (IFS1bits.INT2IF)
#define ENC100_ISR_POLARITY      (INTCON2bits.INT2EP)
#define ENC100_ISR_PRIORITY      (IPC7bits.INT2IP)
#define ENC100_SPI_ENABLE      (ENC100_SPISTATbits.SPIEN)
#define ENC100_SPI_IF         (IFS0bits.SPI1IF)
#define ENC100_SSPBUF         (SPI1BUF)
#define ENC100_SPISTAT         (SPI1STAT)
#define ENC100_SPISTATbits      (SPI1STATbits)
#define ENC100_SPICON1         (SPI1CON1)
#define ENC100_SPICON1bits      (SPI1CON1bits)
#define ENC100_SPICON2         (SPI1CON2)
#endif


////----------------------------
//// MRF24WB0M WiFi I/O pins
////----------------------------
//// If you have a MRF24WB0M WiFi PICtail, you must uncomment one of 
//// these two lines to use it.  SPI1 is the top-most slot while SPI2 corresponds to 
//// insertion of the PICtail into the middle of the side edge connector slot.
//
////#define MRF24WB0M_IN_SPI1
//#define MRF24WB0M_IN_SPI2
//#if defined(MRF24WB0M_IN_SPI1)
//   // MRF24WB0M in SPI1 slot
//   #define WF_CS_TRIS         (TRISBbits.TRISB2)
//   #define WF_CS_IO         (LATBbits.LATB2)
//   #define WF_SDI_TRIS         (TRISFbits.TRISF7)
//   #define WF_SCK_TRIS         (TRISFbits.TRISF6)
//   #define WF_SDO_TRIS         (TRISFbits.TRISF8)
//   #define WF_RESET_TRIS      (TRISFbits.TRISF0)
//   #define WF_RESET_IO         (LATFbits.LATF0)
//   #define WF_INT_TRIS         (TRISEbits.TRISE8)   // INT1
//   #define WF_INT_IO         (PORTEbits.RE8)
//   #define WF_HIBERNATE_TRIS   (TRISFbits.TRISF1)
//   #define WF_HIBERNATE_IO      (PORTFbits.RF1)
//   #define WF_INT_EDGE         (INTCONbits.INT1EP)
//   #define WF_INT_IE         (IEC0bits.INT1IE)
//   #define WF_INT_IF         (IFS0bits.INT1IF)
//   #define WF_INT_IE_CLEAR      IEC0CLR
//   #define WF_INT_IF_CLEAR      IFS0CLR
//   #define WF_INT_IE_SET      IEC0SET
//   #define WF_INT_IF_SET      IFS0SET
//   #define WF_INT_BIT         0x00000080
//   #define WF_INT_IPCSET      IPC1SET
//   #define WF_INT_IPCCLR      IPC1CLR
//   #define WF_INT_IPC_MASK      0xFF000000
//   #define WF_INT_IPC_VALUE   0x0C000000
//
//   #define WF_SSPBUF         (SPI1BUF)
//   #define WF_SPISTAT         (SPI1STAT)
//   #define WF_SPISTATbits      (SPI1STATbits)
//   #define WF_SPICON1         (SPI1CON)
//   #define WF_SPICON1bits      (SPI1CONbits)
//   #define WF_SPI_IE_CLEAR      IEC0CLR
//   #define WF_SPI_IF_CLEAR      IFS0CLR
//   #define WF_SPI_INT_BITS      0x03800000
//   #define WF_SPI_BRG         (SPI1BRG)
//   #define WF_MAX_SPI_FREQ      (10000000ul)   // Hz
//
//#elif defined(MRF24WB0M_IN_SPI2)
//   // MRF24WB0M in SPI2 slot
//   #define WF_CS_TRIS         (TRISGbits.TRISG9)
//   #define WF_CS_IO         (LATGbits.LATG9)
//   #define WF_SDI_TRIS         (TRISGbits.TRISG7)
//   #define WF_SCK_TRIS         (TRISGbits.TRISG6)
//   #define WF_SDO_TRIS         (TRISGbits.TRISG8)
//   #define WF_RESET_TRIS      (TRISGbits.TRISG0)
//   #define WF_RESET_IO         (LATGbits.LATG0)
//   #define WF_INT_TRIS         (TRISAbits.TRISA14)   // INT3
//   #define WF_INT_IO         (PORTAbits.RA14)
//   #define WF_HIBERNATE_TRIS   (TRISGbits.TRISG1)
//   #define WF_HIBERNATE_IO      (PORTGbits.RG1)
//   #define WF_INT_EDGE         (INTCONbits.INT3EP)
//   #define WF_INT_IE         (IEC0bits.INT3IE)
//   #define WF_INT_IF         (IFS0bits.INT3IF)
//   #define WF_INT_IE_CLEAR      IEC0CLR
//   #define WF_INT_IF_CLEAR      IFS0CLR
//   #define WF_INT_IE_SET      IEC0SET
//   #define WF_INT_IF_SET      IFS0SET
//   #define WF_INT_BIT         0x00008000
//   #define WF_INT_IPCSET      IPC3SET
//   #define WF_INT_IPCCLR      IPC3CLR
//   #define WF_INT_IPC_MASK      0xFF000000
//   #define WF_INT_IPC_VALUE   0x0C000000
//
//   #define WF_SSPBUF         (SPI2BUF)
//   #define WF_SPISTAT         (SPI2STAT)
//   #define WF_SPISTATbits      (SPI2STATbits)
//   #define WF_SPICON1         (SPI2CON)
//   #define WF_SPICON1bits      (SPI2CONbits)
//   #define WF_SPI_IE_CLEAR      IEC1CLR
//   #define WF_SPI_IF_CLEAR      IFS1CLR
//   #define WF_SPI_INT_BITS      0x000000e0
//   #define WF_SPI_BRG         (SPI2BRG)
//   #define WF_MAX_SPI_FREQ      (10000000ul)   // Hz
//#endif


//// ------- PORTS to use ----- to be done
//// ----------------- Onboard PORT Definitions -----------------
//#define PORT_P0_MAX 28
//#define PORT_P1_MAX 28
//#define PORT_P2_MAX 12
//#define PORT_P3_MAX 6
//
//#define PORT_PORTS_MAX (PORT_P0_MAX+PORT_P1_MAX+PORT_P2_MAX+PORT_P3_MAX)
//
//// Port 0: JP3 44 PINs
//// USing LAT for I/O as default, please note, that PORT
//// can be used as read directly, write is done to LATCH
//
//// GPIO 0-9  (PWM)
//#define   P0_IO0_TRIS      (TRISEbits.TRISE0)  // Pin 1
//#define P0_IO0         (LATEbits.LATE0)
//#define P0_P0         (PORTEbits.RE0)
//#define   P0_IO1_TRIS      (TRISEbits.TRISE1)  // Pin 2
//#define P0_IO1         (LATEbits.LATE1)
//#define P0_P1         (PORTEbits.RE1)
//#define   P0_IO2_TRIS      (TRISEbits.TRISE2)  // Pin 3
//#define P0_IO2         (LATEbits.LATE2)
//#define P0_P2         (PORTEbits.RE2)
//#define   P0_IO3_TRIS      (TRISEbits.TRISE3)  // Pin 4
//#define P0_IO3         (LATEbits.LATE3)
//#define P0_P3         (PORTEbits.RE3)
//#define   P0_IO4_TRIS      (TRISEbits.TRISE4)  // Pin 5
//#define P0_IO4         (LATEbits.LATE4)
//#define P0_P4         (PORTEbits.RE4)
//#define   P0_IO5_TRIS      (TRISEbits.TRISE5)  // Pin 6
//#define P0_IO5         (LATEbits.LATE5)
//#define P0_P5         (PORTEbits.RE5)
//#define   P0_IO6_TRIS      (TRISEbits.TRISE6)  // Pin 7
//#define P0_IO6         (LATEbits.LATE6)
//#define P0_P6         (PORTEbits.RE6)
//#define   P0_IO7_TRIS      (TRISEbits.TRISE7)  // Pin 8
//#define P0_IO7         (LATEbits.LATE7)
//#define P0_P7         (PORTEbits.RE7)
//#define   P0_IO8_TRIS      (TRISEbits.TRISE8)  // Pin 9
//#define P0_IO8         (LATEbits.LATE8)
//#define P0_P8         (PORTEbits.RE8)
//#define   P0_IO9_TRIS      (TRISEbits.TRISE9)  // Pin 10
//#define P0_IO9         (LATEbits.LATE9)
//#define P0_P9         (PORTEbits.RE9)
//// PIN 11,13,15,16 GND, PIN 12,14 V+
//// GPIO 10-19 (OC)
//#define   P0_IO10_TRIS   (TRISDbits.TRISD0)  // Pin 17
//#define P0_IO10         (LATDbits.LATD0)
//#define P0_P10         (PORTDbits.RD0)
//#define   P0_IO11_TRIS   (TRISDbits.TRISD1)  // Pin 18
//#define P0_IO11         (LATDbits.LATD1)
//#define P0_P11         (PORTDbits.RD1)
//#define   P0_IO12_TRIS   (TRISDbits.TRISD2)  // Pin 19
//#define P0_IO12         (LATDbits.LATD2)
//#define P0_P12         (PORTDbits.RD2)
//#define   P0_IO13_TRIS   (TRISDbits.TRISD3)  // Pin 20
//#define P0_IO13         (LATDbits.LATD3)
//#define P0_P13         (PORTDbits.RD3)
//#define   P0_IO14_TRIS   (TRISDbits.TRISD4)  // Pin 21
//#define P0_IO14         (LATDbits.LATD4)
//#define P0_P14         (PORTDbits.RD4)
//#define   P0_IO15_TRIS   (TRISDbits.TRISD5)  // Pin 22
//#define P0_IO15         (LATDbits.LATD5)
//#define P0_P15         (PORTDbits.RD5)
//#define   P0_IO16_TRIS   (TRISDbits.TRISD6)  // Pin 23
//#define P0_IO16         (LATDbits.LATD6)
//#define P0_P16         (PORTDbits.RD6)
//#define   P0_IO17_TRIS   (TRISDbits.TRISD7)  // Pin 24
//#define P0_IO17         (LATDbits.LATD7)
//#define P0_P17         (PORTDbits.RD7)
//#define   P0_IO18_TRIS   (TRISAbits.TRISA2)  // Pin 25
//#define P0_IO18         (LATAbits.LATA2)
//#define P0_P18         (PORTAbits.RA2)
//#define   P0_IO19_TRIS   (TRISAbits.TRISA3)  // Pin 26
//#define P0_IO19         (LATAbits.LATA3)
//#define P0_P19         (PORTAbits.RA3)
//// PIN 27,29,31,32 GND, PIN 28,30 V+
//// GPIO 10-19 (IC)
//#define   P0_IO20_TRIS   (TRISDbits.TRISD8)  // Pin 33
//#define P0_IO20         (LATDbits.LATD8)
//#define P0_P20         (PORTDbits.RD8)
//#define   P0_IO21_TRIS   (TRISDbits.TRISD9)  // Pin 34
//#define P0_IO21         (LATDbits.LATD9)
//#define P0_P21         (PORTDbits.RD9)
//#define   P0_IO22_TRIS   (TRISDbits.TRISD10)  // Pin 35
//#define P0_IO22         (LATDbits.LATD10)
//#define P0_P22         (PORTDbits.RD10)
//#define   P0_IO23_TRIS   (TRISDbits.TRISD11)  // Pin 36
//#define P0_IO23         (LATDbits.LATD11)
//#define P0_P23         (PORTDbits.RD11)
//#define   P0_IO24_TRIS   (TRISDbits.TRISD12)  // Pin 37
//#define P0_IO24         (LATDbits.LATD12)
//#define P0_P24         (PORTDbits.RD12)
//#define   P0_IO25_TRIS   (TRISDbits.TRISD13)  // Pin 38
//#define P0_IO25         (LATDbits.LATD13)
//#define P0_P25         (PORTDbits.RD13)
//#define   P0_IO26_TRIS   (TRISDbits.TRISD14)  // Pin 39
//#define P0_IO26         (LATDbits.LATD14)
//#define P0_P26         (PORTDbits.RD14)
//#define   P0_IO27_TRIS   (TRISDbits.TRISD15)  // Pin 40
//#define P0_IO27         (LATDbits.LATD15)
//#define P0_P27         (PORTDbits.RD15)
//// PIN 41,42 GND, PIN 42,44 V+
//// Port 1: JP4, 44 PINs
//// GPIO 28-37  (AD)
//#define   P1_IO0_TRIS      (TRISBbits.TRISB0)  // Pin 1
//#define P1_IO0         (LATBbits.LATB0)
//#define P1_P0         (PORTBbits.RB0)
//#define   P1_IO1_TRIS      (TRISBbits.TRISB1)  // Pin 2
//#define P1_IO1         (LATBbits.LATB1)
//#define P1_P1         (PORTBbits.RB1)
//#define   P1_IO2_TRIS      (TRISBbits.TRISB2)  // Pin 3
//#define P1_IO2         (LATBbits.LATB2)
//#define P1_P2         (PORTBbits.RB2)
//#define   P1_IO3_TRIS      (TRISBbits.TRISB3)  // Pin 4
//#define P1_IO3         (LATBbits.LATB3)
//#define P1_P3         (PORTBbits.RB3)
//#define   P1_IO4_TRIS      (TRISBbits.TRISB4)  // Pin 5
//#define P1_IO4         (LATBbits.LATB4)
//#define P1_P4         (PORTBbits.RB4)
//#define   P1_IO5_TRIS      (TRISBbits.TRISB5)  // Pin 6
//#define P1_IO5         (LATBbits.LATB5)
//#define P1_P5         (PORTBbits.RB5)
//#define   P1_IO6_TRIS      (TRISBbits.TRISB6)  // Pin 7 (Jumper on ICD Port)
//#define P1_IO6         (LATBbits.LATB6)
//#define P1_P6         (PORTBbits.RB6)
//#define   P1_IO7_TRIS      (TRISBbits.TRISB7)  // Pin 8 (Jumper on ICD Port)
//#define P1_IO7         (LATBbits.LATB7)
//#define P1_P7         (PORTBbits.RB7)
//#define   P1_IO8_TRIS      (TRISBbits.TRISB8)  // Pin 9
//#define P1_IO8         (LATBbits.LATB8)
//#define P1_P8         (PORTBbits.RB8)
//#define   P1_IO9_TRIS      (TRISBbits.TRISB9)  // Pin 10
//#define P1_IO9         (LATBbits.LATB9)
//#define P1_P9         (PORTBbits.RB9)
//// PIN 11,13,15,16 GND, PIN 12,14 V+
//// GPIO 38-47  (AD)
//#define   P1_IO10_TRIS   (TRISBbits.TRISB10)  // Pin 17
//#define P1_IO10         (LATBbits.LATB10)
//#define P1_P10         (PORTBbits.RB10)
//#define   P1_IO11_TRIS   (TRISBbits.TRISB11)  // Pin 18
//#define P1_IO11         (LATBbits.LATB11)
//#define P1_P11         (PORTBbits.RB11)
//#define   P1_IO12_TRIS   (TRISBbits.TRISB12)  // Pin 19
//#define P1_IO12         (LATBbits.LATB12)
//#define P1_P12         (PORTBbits.RB12)
//#define   P1_IO13_TRIS   (TRISBbits.TRISB13)  // Pin 20
//#define P1_IO13         (LATBbits.LATB13)
//#define P1_P13         (PORTBbits.RB13)
//#define   P1_IO14_TRIS   (TRISBbits.TRISB14)  // Pin 21
//#define P1_IO14         (LATBbits.LATB14)
//#define P1_P14         (PORTBbits.RB14)
//#define   P1_IO15_TRIS   (TRISBbits.TRISB15)  // Pin 22
//#define P1_IO15         (LATBbits.LATB15)
//#define P1_P15         (PORTBbits.RB15)
//#define   P1_IO16_TRIS   (TRISCbits.TRISC1)  // Pin 23
//#define P1_IO16         (LATCbits.LATC1)
//#define P1_P16         (PORTCbits.RC1)
//#define   P1_IO17_TRIS   (TRISCbits.TRISC2)  // Pin 24
//#define P1_IO17         (LATCbits.LATC2)
//#define P1_P17         (PORTCbits.RC2)
//#define   P1_IO18_TRIS   (TRISAbits.TRISA9)  // Pin 25
//#define P1_IO18         (LATAbits.LATA9)
//#define P1_P18         (PORTAbits.RA9)
//#define   P1_IO19_TRIS   (TRISAbits.TRISA10)  // Pin 26
//#define P1_IO19         (LATAbits.LATA10)
//#define P1_P19         (PORTAbits.RA10)
//// PIN 27,29,31,32 GND, PIN 28,30 V+
//// GPIO 48-56 (GP)
//#define   P1_IO20_TRIS   (TRISFbits.TRISF2)  // Pin 33
//#define P1_IO20         (LATFbits.LATF2)
//#define P1_P20         (PORTFbits.RF2)
//#define   P1_IO21_TRIS   (TRISFbits.TRISF3)  // Pin 34
//#define P1_IO21         (LATFbits.LATF3)
//#define P1_P21         (PORTFbits.RF3)
//#define   P1_IO22_TRIS   (TRISGbits.TRISG2)  // Pin 35
//#define P1_IO22         (LATGbits.LATG2)
//#define P1_P22         (PORTGbits.RG2)
//#define   P1_IO23_TRIS   (TRISGbits.TRISG3)  // Pin 36
//#define P1_IO23         (LATGbits.LATG3)
//#define P1_P23         (PORTGbits.RG3)
//#define   P1_IO24_TRIS   (TRISGbits.TRISG0)  // Pin 37
//#define P1_IO24         (LATGbits.LATG0)
//#define P1_P24         (PORTGbits.RG0)
//#define   P1_IO25_TRIS   (TRISGbits.TRISG1)  // Pin 38
//#define P1_IO25         (LATGbits.LATG1)
//#define P1_P25         (PORTGbits.RG1)
//#define   P1_IO26_TRIS   (TRISFbits.TRISF4)  // Pin 39
//#define P1_IO26         (LATFbits.LATF4)
//#define P1_P26         (PORTFbits.RF4)
//#define   P1_IO27_TRIS   (TRISFbits.TRISF5)  // Pin 40
//#define P1_IO27         (LATFbits.LATF5)
//#define P1_P27         (PORTFbits.RF5)
//// PIN 41,42 GND, PIN 42,44 V+
//// Port 2: JP6, 16 PINs (I2C,UART,ECAN)
//// PIN 1 GND, PIN 2: +3.3V
//#define P2_IO0_TRIS      (TRISFbits.TRISF2)   // Pin 3
//#define P2_IO0         (LATFbits.LATF2)
//#define P2_P0         (PORTFbits.RF2)
//#define P2_IO1_TRIS      (TRISFbits.TRISF3)   // Pin 4
//#define P2_IO1         (LATFbits.LATF3)
//#define P2_P1         (PORTFbits.RF3)
//#define P2_IO2_TRIS      (TRISDbits.TRISD14)   // Pin 5
//#define P2_IO2         (LATDbits.LATD14)
//#define P2_P2         (PORTDbits.RD14)
//#define P2_IO3_TRIS      (TRISDbits.TRISD15)   // Pin 6
//#define P2_IO3         (LATDbits.LATD15)
//#define P2_P3         (PORTDbits.RD15)
//#define P2_IO4_TRIS      (TRISGbits.TRISG2)   // Pin 7
//#define P2_IO4         (LATGbits.LATG2)
//#define P2_P4         (PORTGbits.RG2)
//#define P2_IO5_TRIS      (TRISGbits.TRISG3)   // Pin 8
//#define P2_IO5         (LATGbits.LATG3)
//#define P2_P5         (PORTGbits.RG3)
//#define P2_IO6_TRIS      (TRISGbits.TRISG0)   // Pin 9
//#define P2_IO6         (LATGbits.LATG0)
//#define P2_P6         (PORTGbits.RG0)
//#define P2_IO7_TRIS      (TRISGbits.TRISG1)   // Pin 10
//#define P2_IO7         (LATGbits.LATG1)
//#define P2_P7         (PORTGbits.RG1)
//#define P2_IO8_TRIS      (TRISFbits.TRISF4)   // Pin 11
//#define P2_IO8         (LATFbits.LATF4)
//#define P2_P8         (PORTFbits.RF4)
//#define P2_IO9_TRIS      (TRISFbits.TRISF5)   // Pin 12
//#define P2_IO9         (LATFbits.LATF5)
//#define P2_P9         (PORTFbits.RF5)
//#define   P2_IO10_TRIS   (TRISBbits.TRISB8)  // Pin 13
//#define P2_IO10         (LATBbits.LATB8)
//#define P2_P10         (PORTBbits.RB8)
//#define   P2_IO11_TRIS   (TRISBbits.TRISB14) // Pin 14
//#define P2_IO11         (LATBbits.LATB14)
//#define P2_P11         (PORTBbits.RB14)
//// PIN 15 GND, PIN 16 +5V
//// Port 3: SPI
//// PIN 1 GND, PIN 2: +3.3V
//#define P3_IO0_TRIS      (TRISFbits.TRISF6)   // Pin 3
//#define P3_IO0         (LATFbits.LATF6)
//#define P3_P0         (PORTFbits.RF6)
//#define P3_IO1_TRIS      (TRISBbits.TRISF2)   // Pin 4
//#define P3_IO1         (LATBbits.LATF2)
//#define P3_P1         (PORTFbits.RF2)
//#define P3_IO2_TRIS      (TRISFbits.TRISF7)   // Pin 5
//#define P3_IO2         (LATFbits.LATF7)
//#define P3_P2         (PORTFbits.RF7)
//#define P3_IO3_TRIS      (TRISFbits.TRISF8)   // Pin 6
//#define P3_IO3         (LATFbits.LATF8)
//#define P3_P3         (PORTFbits.RF8)
//#define P3_IO4_TRIS      (TRISFbits.TRISF0)   // Pin 7
//#define P3_IO4         (LATFbits.LATF0)
//#define P3_P4         (PORTFbits.RF0)
//#define P3_IO5_TRIS      (TRISFbits.TRISF1)   // Pin 8
//#define P3_IO5         (LATFbits.LATF1)
//#define P3_P5         (PORTFbits.RF1)
//// PIN 9 GND, PIN 10 +5V

#endif // #ifndef HARDWARE_PROFILE_H
