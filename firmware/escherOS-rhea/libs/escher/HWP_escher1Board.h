/* *******************************************************************
 *
 * ESCHER1 spezific dsPIC-Board Hardware Definitions
 * 
 * - derived from old escherBoard.h
 * - included in escherBoard.h
 *
 *********************************************************************
 * FileName     : HWP_escher1Board.h
 * Dependencies :
 * Processor
 *  - targets   : dsPIC33F
 *  - tested    : with 33FJ128MC708
 * Company      : Algorythmics
 *
 *  * License: GPL V3.0
 *
 * This module defines the escher Version 1.0 hardware specific parts
 * and also helper to startup escher boards.
 *
 * It can be diverted to support different dsPICs in future
 *
 * Now used: dsPIC33FJ708A
 *
 * Ports are the Interfaces of the escher hardware like described
 * in the manual trying to keep up with versions of the board.
 *
 * Author              Date         Comment
 *~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
 * Winfried Ritsch     12.5.2012    Diverted in HWP file
 * Winfried Ritsch     feb.2013    renewed structure
 * further logs now in svn and git...
 * 
 * This Includes the only the board definition
 * definitions for external modules are extra defined in own headers
 ***************************************************************************/

#ifndef __ESCHER1_BOARD_H
#define __ESCHER1_BOARD_H

#define ESCHER_HW_ESCHER1

// define which Hardwareversion to use:
//
// should be done before include of this header
//          eg. escher_config.h included before
// #define ESCHER_HW ALGOPIC_PROTOTYPE
// #define ESCHER_HW ESCHER_V1_00
#if !defined(ESCHER_HW) // default
#define ESCHER_HW V1_00
#define ESCHER_V1_00   // for compatibility, depricated
#endif

// ----------- Default Configurations Bits -----------
// if you use them then include in escher_config.h:
//    #define  ESCHER1_DEFAULT_CONFIGURATION_BITS
//    and THIS_IS_MAIN in your main code

#if  defined(ESCHER1_DEFAULT_CONFIGURATION_BITS) && defined(THIS_IS_MAIN)
// DSPIC33FJ128MC708A Configuration Bit Settings

// FBS
#pragma config BWRP = WRPROTECT_OFF     // Boot Segment Write Protect (Boot Segment may be written)
#pragma config BSS = NO_FLASH           // Boot Segment Program Flash Code Protection (No Boot program Flash segment)
#pragma config RBS = NO_RAM             // Boot Segment RAM Protection (No Boot RAM)

// FSS
#pragma config SWRP = WRPROTECT_OFF     // Secure Segment Program Write Protect (Secure Segment may be written)
#pragma config SSS = NO_FLASH           // Secure Segment Program Flash Code Protection (No Secure Segment)
#pragma config RSS = NO_RAM             // Secure Segment Data RAM Protection (No Secure RAM)

// FGS
#pragma config GWRP = OFF               // General Code Segment Write Protect (User program memory is not write-protected)
#pragma config GSS = OFF                // General Segment Code Protection (User program memory is not code-protected)

// FOSCSEL
#pragma config FNOSC = FRC              // Oscillator Mode (Internal Fast RC (FRC))
#pragma config IESO = ON                // Two-speed Oscillator Start-Up Enable (Start up with FRC, then switch)

// FOSC
#pragma config POSCMD = HS              // Primary Oscillator Source (HS Oscillator Mode)
#pragma config OSCIOFNC = OFF           // OSC2 Pin Function (OSC2 pin has clock out function)
#pragma config FCKSM = CSECMD           // Clock Switching and Monitor (Clock switching is enabled, Fail-Safe Clock Monitor is disabled)

// FWDT (see later)
#pragma config WDTPOST = PS32768        // Watchdog Timer Postscaler (1:32,768)
#pragma config WDTPRE = PR128           // WDT Prescaler (1:128)
#pragma config WINDIS = OFF             // Watchdog Timer Window (Watchdog Timer in Non-Window mode)
#pragma config FWDTEN = OFF             // Watchdog Timer Enable (Watchdog timer enabled/disabled by user software)

// FPOR
#pragma config FPWRT = PWR128           // POR Timer Value (128ms)
#pragma config LPOL = ON                // Low-side PWM Output Polarity (Active High)
#pragma config HPOL = ON                // Motor Control PWM High Side Polarity bit (PWM module high side output pins have active-high output polarity)
#pragma config PWMPIN = ON              // Motor Control PWM Module Pin Mode bit (PWM module pins controlled by PORT register at device Reset)

// FICD
#pragma config ICS = PGD1               // Comm Channel Select (Communicate on PGC1/EMUC1 and PGD1/EMUD1)
#pragma config JTAGEN = OFF             // JTAG Port Enable (JTAG is Disabled)

#endif

// ------------ OSCILLATOR  FREQUENCY ----------------
// start with FRC then PLL up on external !!!
//The settings below set up the oscillator and PLL:

//            Crystal Frequency  * (DIVISOR+2)
// Fcy =     ----------------------------------
//              PLLPOST * ((PRESCLR+2) * 4

#if defined(ESCHER_HW) && ESCHER_HW==V1_00

// Fcy= 25Mhz * (30 +2)/(2*5) = 80Mhz

// Fcy =  25Mhz * (30+2) / (2 * (1+2) * 4)

//#define ESCHER_CLKDIV  0x0003;   // ROI=0,DOZEN=0,FRCDIV=0,PLLPOST=0 (/2)
//                             // PLLPRE=3 (25MHz/(3+2)=5MHz)
//    	PLLFBD = 0x001E;    // 5MHz*(30+2)=160MHz (/2(PLLPOST)=80MHz)

#define ESCHER_PLLPOST 0    // N1=2
#define ESCHER_PLLPRE 3    // N2=2
#define ESCHER_PLLFBD 30   // M=30
#define ESCHER_OSCCONH 0b011  // HS Oscillator with PLL (NOSC=3)

#if (defined(ESCHER_NO_LP_OSC))
    #define ESCHER_OSCCONL 0b001 // LPOSCEN=0+OSWEN=1
#else
    #define ESCHER_OSCCONL 0b011 // LPOSCEN=1+OSWEN=1
#endif


#define ESCHER_OSCTUN 0
#else // 8MHz Oscillator

#define ESCHER_PLLFBD  38         // Multiply by 40 for 160MHz VCO output (8MHz XT oscillator)
#define ESCHER_CLKDIV 0x0000;   // FRC: divide by 2, PLLPOST: divide by 2, PLLPRE: divide by 2
#define ESCHER_OSCCONH 0x01   // FRC with PLL (NOSC=0b001)
#define ESCHER_OSCCONH_COSC 0b001 // as last 3 bits

#endif
// following can be overwritten from outside on main

#if ! defined(MAXIMUM_PIC_FREQ)
 #define MAXIMUM_PIC_FREQ (80000000ul)
#endif

#if ! defined(GetSystemClock)
#define GetSystemClock() (MAXIMUM_PIC_FREQ)  // Hz
#endif

#if defined(__dsPIC33F__)
// dsPIC33F processor
#define GetInstructionClock() (GetSystemClock()/2)
#define GetPeripheralClock() GetInstructionClock()
#elif defined(__PIC32MX__)
// PIC32MX processor
#define GetInstructionClock() (GetSystemClock()/1)
#define GetPeripheralClock() (GetInstructionClock()/1) // Set your divider according to your Peripheral Bus Frequency configuration fuse setting
#endif

// ----------------- On Board Hardware Definitions -----------------
// On Board LEDs (SAME as IC out on Port 1 !!!!)

#define OB_LED_ON 0
#define OB_LED_OFF 1

#define OB_LED0_TRIS (TRISDbits.TRISD8)
#define OB_LED0 (LATDbits.LATD8)
#define OB_LED1_TRIS (TRISDbits.TRISD9)
#define OB_LED1 (LATDbits.LATD9)
#define OB_LED2_TRIS (TRISDbits.TRISD10)
#define OB_LED2 (LATDbits.LATD10)
#define OB_LED3_TRIS (TRISDbits.TRISD11)
#define OB_LED3 (LATDbits.LATD11)

// -------------- ENC 28J60 PIN Connection -----------------------------
// connected ON SPI2 on Escher1 or use slot2 on explorer 16

#define ENC_CS_TRIS     (TRISGbits.TRISG9)
#define ENC_CS_IO       (PORTGbits.RG9)
#define ENC_SPI_IF      (IFS2bits.SPI2IF)
#define ENC_SSPBUF      (SPI2BUF)
#define ENC_SPISTAT     (SPI2STAT)
#define ENC_SPISTATbits (SPI2STATbits)
#define ENC_SPICON1     (SPI2CON1)
#define ENC_SPICON1bits (SPI2CON1bits)
#define ENC_SPICON2     (SPI2CON2)
// NO RST Pin connected
//#define ENC_RST_TRIS  // Not connected
//#define ENC_RST_IO    // on Escher algodspic board

// ----------------- Onboard PORT Definitions -----------------
#define PORT_P0_MAX 28
#define PORT_P1_MAX 28
#define PORT_P2_MAX 12
#define PORT_P3_MAX 6

#define PORT_PORTS_MAX (PORT_P0_MAX+PORT_P1_MAX+PORT_P2_MAX+PORT_P3_MAX)

// Port 0: JP3 44 PINs
// using LAT for I/O as default (not PORT)
// please note: PORT can be used as read directly
//              write is done to LATCH

// GPIO 0-9  (PWM)
#define P0_IO0_TRIS (TRISEbits.TRISE0)  // Pin 1
#define P0_IO0      (LATEbits.LATE0)
#define P0_P0       (PORTEbits.RE0)
#define P0_IO1_TRIS (TRISEbits.TRISE1)  // Pin 2
#define P0_IO1      (LATEbits.LATE1)
#define P0_P1       (PORTEbits.RE1)
#define P0_IO2_TRIS (TRISEbits.TRISE2)  // Pin 3
#define P0_IO2      (LATEbits.LATE2)
#define P0_P2       (PORTEbits.RE2)
#define P0_IO3_TRIS (TRISEbits.TRISE3)  // Pin 4
#define P0_IO3      (LATEbits.LATE3)
#define P0_P3       (PORTEbits.RE3)
#define P0_IO4_TRIS (TRISEbits.TRISE4)  // Pin 5
#define P0_IO4      (LATEbits.LATE4)
#define P0_P4       (PORTEbits.RE4)
#define P0_IO5_TRIS (TRISEbits.TRISE5)  // Pin 6
#define P0_IO5      (LATEbits.LATE5)
#define P0_P5       (PORTEbits.RE5)
#define P0_IO6_TRIS (TRISEbits.TRISE6)  // Pin 7
#define P0_IO6      (LATEbits.LATE6)
#define P0_P6       (PORTEbits.RE6)
#define P0_IO7_TRIS (TRISEbits.TRISE7)  // Pin 8
#define P0_IO7      (LATEbits.LATE7)
#define P0_P7       (PORTEbits.RE7)
#define P0_IO8_TRIS (TRISEbits.TRISE8)  // Pin 9
#define P0_IO8      (LATEbits.LATE8)
#define P0_P8       (PORTEbits.RE8)
#define P0_IO9_TRIS (TRISEbits.TRISE9)  // Pin 10
#define P0_IO9      (LATEbits.LATE9)
#define P0_P9       (PORTEbits.RE9)
// PIN 11,13,15,16 GND, PIN 12,14 V+
// GPIO 10-19 (OC)
#define P0_IO10_TRIS    (TRISDbits.TRISD0)  // Pin 17
#define P0_IO10         (LATDbits.LATD0)
#define P0_P10          (PORTDbits.RD0)
#define P0_IO11_TRIS    (TRISDbits.TRISD1)  // Pin 18
#define P0_IO11         (LATDbits.LATD1)
#define P0_P11          (PORTDbits.RD1)
#define P0_IO12_TRIS    (TRISDbits.TRISD2)  // Pin 19
#define P0_IO12         (LATDbits.LATD2)
#define P0_P12          (PORTDbits.RD2)
#define P0_IO13_TRIS    (TRISDbits.TRISD3)  // Pin 20
#define P0_IO13         (LATDbits.LATD3)
#define P0_P13          (PORTDbits.RD3)
#define P0_IO14_TRIS    (TRISDbits.TRISD4)  // Pin 21
#define P0_IO14         (LATDbits.LATD4)
#define P0_P14          (PORTDbits.RD4)
#define P0_IO15_TRIS    (TRISDbits.TRISD5)  // Pin 22
#define P0_IO15         (LATDbits.LATD5)
#define P0_P15          (PORTDbits.RD5)
#define P0_IO16_TRIS    (TRISDbits.TRISD6)  // Pin 23
#define P0_IO16         (LATDbits.LATD6)
#define P0_P16          (PORTDbits.RD6)
#define P0_IO17_TRIS    (TRISDbits.TRISD7)  // Pin 24
#define P0_IO17         (LATDbits.LATD7)
#define P0_P17          (PORTDbits.RD7)
#define P0_IO18_TRIS    (TRISAbits.TRISA2)  // Pin 25
#define P0_IO18         (LATAbits.LATA2)
#define P0_P18          (PORTAbits.RA2)
#define P0_IO19_TRIS    (TRISAbits.TRISA3)  // Pin 26
#define P0_IO19         (LATAbits.LATA3)
#define P0_P19          (PORTAbits.RA3)
// PIN 27,29,31,32 GND, PIN 28,30 V+
// GPIO 10-19 (IC)
#define P0_IO20_TRIS    (TRISDbits.TRISD8)  // Pin 33
#define P0_IO20         (LATDbits.LATD8)
#define P0_P20          (PORTDbits.RD8)
#define P0_IO21_TRIS    (TRISDbits.TRISD9)  // Pin 34
#define P0_IO21         (LATDbits.LATD9)
#define P0_P21          (PORTDbits.RD9)
#define P0_IO22_TRIS    (TRISDbits.TRISD10)  // Pin 35
#define P0_IO22         (LATDbits.LATD10)
#define P0_P22          (PORTDbits.RD10)
#define P0_IO23_TRIS    (TRISDbits.TRISD11)  // Pin 36
#define P0_IO23         (LATDbits.LATD11)
#define P0_P23          (PORTDbits.RD11)
#define P0_IO24_TRIS    (TRISDbits.TRISD12)  // Pin 37
#define P0_IO24         (LATDbits.LATD12)
#define P0_P24          (PORTDbits.RD12)
#define P0_IO25_TRIS    (TRISDbits.TRISD13)  // Pin 38
#define P0_IO25         (LATDbits.LATD13)
#define P0_P25          (PORTDbits.RD13)
#define P0_IO26_TRIS    (TRISDbits.TRISD14)  // Pin 39
#define P0_IO26         (LATDbits.LATD14)
#define P0_P26          (PORTDbits.RD14)
#define P0_IO27_TRIS    (TRISDbits.TRISD15)  // Pin 40
#define P0_IO27         (LATDbits.LATD15)
#define P0_P27          (PORTDbits.RD15)
// PIN 41,42 GND, PIN 42,44 V+
// Port 1: JP4, 44 PINs
// GPIO 28-37  (AD)
#define P1_IO0_TRIS     (TRISBbits.TRISB0)  // Pin 1
#define P1_IO0          (LATBbits.LATB0)
#define P1_P0           (PORTBbits.RB0)
#define P1_IO1_TRIS     (TRISBbits.TRISB1)  // Pin 2
#define P1_IO1          (LATBbits.LATB1)
#define P1_P1           (PORTBbits.RB1)
#define P1_IO2_TRIS     (TRISBbits.TRISB2)  // Pin 3
#define P1_IO2          (LATBbits.LATB2)
#define P1_P2           (PORTBbits.RB2)
#define P1_IO3_TRIS     (TRISBbits.TRISB3)  // Pin 4
#define P1_IO3          (LATBbits.LATB3)
#define P1_P3           (PORTBbits.RB3)
#define P1_IO4_TRIS     (TRISBbits.TRISB4)  // Pin 5
#define P1_IO4          (LATBbits.LATB4)
#define P1_P4           (PORTBbits.RB4)
#define P1_IO5_TRIS     (TRISBbits.TRISB5)  // Pin 6
#define P1_IO5          (LATBbits.LATB5)
#define P1_P5           (PORTBbits.RB5)
#define P1_IO6_TRIS     (TRISBbits.TRISB6)  // Pin 7 (Jumper on ICD Port)
#define P1_IO6          (LATBbits.LATB6)
#define P1_P6           (PORTBbits.RB6)
#define P1_IO7_TRIS     (TRISBbits.TRISB7)  // Pin 8 (Jumper on ICD Port)
#define P1_IO7          (LATBbits.LATB7)
#define P1_P7           (PORTBbits.RB7)
#define P1_IO8_TRIS     (TRISBbits.TRISB8)  // Pin 9
#define P1_IO8          (LATBbits.LATB8)
#define P1_P8           (PORTBbits.RB8)
#define P1_IO9_TRIS     (TRISBbits.TRISB9)  // Pin 10
#define P1_IO9          (LATBbits.LATB9)
#define P1_P9           (PORTBbits.RB9)
// PIN 11,13,15,16 GND, PIN 12,14 V+
// GPIO 38-47  (AD)
#define P1_IO10_TRIS    (TRISBbits.TRISB10)  // Pin 17
#define P1_IO10         (LATBbits.LATB10)
#define P1_P10          (PORTBbits.RB10)
#define P1_IO11_TRIS    (TRISBbits.TRISB11)  // Pin 18
#define P1_IO11         (LATBbits.LATB11)
#define P1_P11          (PORTBbits.RB11)
#define P1_IO12_TRIS    (TRISBbits.TRISB12)  // Pin 19
#define P1_IO12         (LATBbits.LATB12)
#define P1_P12          (PORTBbits.RB12)
#define P1_IO13_TRIS    (TRISBbits.TRISB13)  // Pin 20
#define P1_IO13         (LATBbits.LATB13)
#define P1_P13          (PORTBbits.RB13)
#define P1_IO14_TRIS    (TRISBbits.TRISB14)  // Pin 21
#define P1_IO14         (LATBbits.LATB14)
#define P1_P14          (PORTBbits.RB14)
#define P1_IO15_TRIS    (TRISBbits.TRISB15)  // Pin 22
#define P1_IO15         (LATBbits.LATB15)
#define P1_P15          (PORTBbits.RB15)
#define P1_IO16_TRIS    (TRISCbits.TRISC1)  // Pin 23
#define P1_IO16         (LATCbits.LATC1)
#define P1_P16          (PORTCbits.RC1)
#define P1_IO17_TRIS    (TRISCbits.TRISC2)  // Pin 24
#define P1_IO17         (LATCbits.LATC2)
#define P1_P17          (PORTCbits.RC2)
#define P1_IO18_TRIS    (TRISAbits.TRISA9)  // Pin 25
#define P1_IO18         (LATAbits.LATA9)
#define P1_P18          (PORTAbits.RA9)
#define P1_IO19_TRIS    (TRISAbits.TRISA10)  // Pin 26
#define P1_IO19         (LATAbits.LATA10)
#define P1_P19          (PORTAbits.RA10)
// PIN 27,29,31,32 GND, PIN 28,30 V+
// GPIO 48-56 (GP)
#define P1_IO20_TRIS    (TRISFbits.TRISF2)  // Pin 33
#define P1_IO20         (LATFbits.LATF2)
#define P1_P20          (PORTFbits.RF2)
#define P1_IO21_TRIS    (TRISFbits.TRISF3)  // Pin 34
#define P1_IO21         (LATFbits.LATF3)
#define P1_P21          (PORTFbits.RF3)
#define P1_IO22_TRIS    (TRISGbits.TRISG2)  // Pin 35
#define P1_IO22         (LATGbits.LATG2)
#define P1_P22          (PORTGbits.RG2)
#define P1_IO23_TRIS    (TRISGbits.TRISG3)  // Pin 36
#define P1_IO23         (LATGbits.LATG3)
#define P1_P23          (PORTGbits.RG3)
#define P1_IO24_TRIS    (TRISGbits.TRISG0)  // Pin 37
#define P1_IO24         (LATGbits.LATG0)
#define P1_P24          (PORTGbits.RG0)
#define P1_IO25_TRIS    (TRISGbits.TRISG1)  // Pin 38
#define P1_IO25         (LATGbits.LATG1)
#define P1_P25          (PORTGbits.RG1)
#define P1_IO26_TRIS    (TRISFbits.TRISF4)  // Pin 39
#define P1_IO26         (LATFbits.LATF4)
#define P1_P26          (PORTFbits.RF4)
#define P1_IO27_TRIS    (TRISFbits.TRISF5)  // Pin 40
#define P1_IO27         (LATFbits.LATF5)
#define P1_P27          (PORTFbits.RF5)
// PIN 41,42 GND, PIN 42,44 V+
// Port 2: JP6, 16 PINs (I2C,UART,ECAN)
// PIN 1 GND, PIN 2: +3.3V
#define P2_IO0_TRIS     (TRISFbits.TRISF2) // Pin 3
#define P2_IO0          (LATFbits.LATF2)
#define P2_P0           (PORTFbits.RF2)
#define P2_IO1_TRIS     (TRISFbits.TRISF3) // Pin 4
#define P2_IO1          (LATFbits.LATF3)
#define P2_P1           (PORTFbits.RF3)
#define P2_IO2_TRIS     (TRISDbits.TRISD14) // Pin 5
#define P2_IO2          (LATDbits.LATD14)
#define P2_P2           (PORTDbits.RD14)
#define P2_IO3_TRIS     (TRISDbits.TRISD15) // Pin 6
#define P2_IO3          (LATDbits.LATD15)
#define P2_P3           (PORTDbits.RD15)
#define P2_IO4_TRIS     (TRISGbits.TRISG2) // Pin 7
#define P2_IO4          (LATGbits.LATG2)
#define P2_P4           (PORTGbits.RG2)
#define P2_IO5_TRIS     (TRISGbits.TRISG3) // Pin 8
#define P2_IO5          (LATGbits.LATG3)
#define P2_P5           (PORTGbits.RG3)
#define P2_IO6_TRIS     (TRISGbits.TRISG0) // Pin 9
#define P2_IO6          (LATGbits.LATG0)
#define P2_P6           (PORTGbits.RG0)
#define P2_IO7_TRIS     (TRISGbits.TRISG1) // Pin 10
#define P2_IO7          (LATGbits.LATG1)
#define P2_P7           (PORTGbits.RG1)
#define P2_IO8_TRIS     (TRISFbits.TRISF4) // Pin 11
#define P2_IO8          (LATFbits.LATF4)
#define P2_P8           (PORTFbits.RF4)
#define P2_IO9_TRIS     (TRISFbits.TRISF5) // Pin 12
#define P2_IO9          (LATFbits.LATF5)
#define P2_P9           (PORTFbits.RF5)
#define P2_IO10_TRIS    (TRISBbits.TRISB8)  // Pin 13
#define P2_IO10         (LATBbits.LATB8)
#define P2_P10          (PORTBbits.RB8)
#define P2_IO11_TRIS    (TRISBbits.TRISB14) // Pin 14
#define P2_IO11         (LATBbits.LATB14)
#define P2_P11          (PORTBbits.RB14)
// PIN 15 GND, PIN 16 +5V
// Port 3: SPI
// PIN 1 GND, PIN 2: +3.3V
#define P3_IO0_TRIS     (TRISFbits.TRISF6) // Pin 3
#define P3_IO0          (LATFbits.LATF6)
#define P3_P0           (PORTFbits.RF6)
#define P3_IO1_TRIS     (TRISBbits.TRISF2) // Pin 4
#define P3_IO1          (LATBbits.LATF2)
#define P3_P1           (PORTFbits.RF2)
#define P3_IO2_TRIS     (TRISFbits.TRISF7) // Pin 5
#define P3_IO2          (LATFbits.LATF7)
#define P3_P2           (PORTFbits.RF7)
#define P3_IO3_TRIS     (TRISFbits.TRISF8) // Pin 6
#define P3_IO3          (LATFbits.LATF8)
#define P3_P3           (PORTFbits.RF8)
#define P3_IO4_TRIS     (TRISFbits.TRISF0) // Pin 7
#define P3_IO4          (LATFbits.LATF0)
#define P3_P4           (PORTFbits.RF0)
#define P3_IO5_TRIS     (TRISFbits.TRISF1) // Pin 8
#define P3_IO5          (LATFbits.LATF1)
#define P3_P5           (PORTFbits.RF1)
// PIN 9 GND, PIN 10 +5V

#endif // __ESCHER_BOARD_H