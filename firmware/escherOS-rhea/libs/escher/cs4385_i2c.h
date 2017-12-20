/*********************************************************************
 *
 *	Escher AMP8 board CS4385 Configuration Header
 *
 *********************************************************************
 * FileName:        cs4386_i2c.h
 * Dependencies:    None
 * Processor:       dsPIC33F, PIC32
 * Compiler:        Microchip C32 v1.10 or higher
 *					Microchip C30 v3.12 or higher
 *					Microchip C18 v3.34 or higher
 *					HI-TECH PICC-18 PRO 9.63PL2 or higher
 * Company:         Algorythmics
 *
 * Software License Agreement
 *
 * Copyright (C) 2002-2010  Algorytmics Winfried Ritsch
 * Licence: GPL v3.0
 *
 * Note: to be update to use optional also I2C2
 ********************************************************************/
#ifndef __ESCHER_CS4385_H
#define __ESCHER_CS4385_H

// How often try to write before return an Error on writes
#define CS4385_WRITE_MAX_ATTEMPTS 10

// maybe defined in some hardware def header before
#if !defined(PORT_TRIS_OUT)
    #define PORT_TRIS_OUT 0
    #define PORT_TRIS_IN  1
#endif

#if defined(EXPLORER16_GP710)
    // RG1
    #define ESCHER_CS4385_NRST_TRIS  (TRISGbits.TRISG1)
    #define ESCHER_CS4385_NRST       (LATGbits.LATG1)
#elif defined(dsPIC33E_SK_ENC624)
    // RF12
    #define ESCHER_CS4385_NRST_TRIS  (TRISFbits.TRISF12)
    #define ESCHER_CS4385_NRST       (LATFbits.LATF12)

#if defined(USE_CONFIG_CS4385) && defined(THIS_IS_MAIN)
    // Use ALT I2C1 RD9/RD10
    _FPOR(ALTI2C1_ON);
    //_FPOR(ALTI2C2_ON);
#endif

#endif



// define I2C Speed
// this should go to HW_Profile for main an is only for this test in here

// Datasheet:
// F_SCL=1/(((1/(F_CY))*(I2CX_BRG+1))+T_globber)
//
// T_Globber ... Pulse Globber Delay: typical 130ns = 0,13 us
// F_CY=67737600 (roughly on FRC OSCTUNED)
//
// I2CX_BRG = F_CY*((1/F_SCL)-T_Globber) - 1
//          = 67,7376MHz*(10us - 0,13us)= 668,57 - 1 => 668
//          = 45,1584MHz*(10us - 0,13us)= 445,71 - 1 => 445
// MAX is 511 !!!!
#ifndef OSC_FCY
#include "DCI_tdm_clock.h"
#endif

#define I2C_BUSCLK  100000
#if (OSC_FCY/I2C_BUSCLK) > 511
#define I2C_BRG 511
#undef I2C_BUSCLK
#define I2C_BUSCLK (OSC_FCY/I2C_BRG)
#warning "cs4385 settings: I2C_BUSCLK has to be higher than 100000"
#else
#define I2C_BRG (OSC_FCY/I2C_BUSCLK)
#endif

//#if defined (__dsPIC33E__)
//
//    #if defined (dsPIC33E_HIGHSPEED)
//        #define I2C_BUSCLK  132300 // out of range !!! please test
//        #define I2C_BRG 511
//    #else
//
//    #define I2C_BUSCLK  100000
//        #define I2C_BRG 445
//    #endif
//
//#elif defined (__dsPIC33F__)
//    #define I2C_BUSCLK  100000
//    //#define I2C_BRG 445 // not tested
//#endif



// Note: AN0//CS is the Adress Bit and should be hardwired on powering the device
//       elso it will go into SPI mode on a change (burst, glitch)
// Note: AD0 is same as /CS and M0 Pin.
//
// ADDRESS is Jumper on AD0 Pin (Low by default)
#define ESCHER_CS4385_ADDRESS 0b00000000 // address 0
//#define ESCHER_CS4385_ADDRESS 0b00000010 // address 1
#define CS4385_ADDR_ID 0b00110000

#define CS4385_ADDR_READ  (CS4385_ADDR_ID | ESCHER_CS4385_ADDRESS | 0b00000001)
#define CS4385_ADDR_WRITE (CS4385_ADDR_ID | ESCHER_CS4385_ADDRESS | 0b00000000)

// ======= Register in CS 4385 - 23 Register =======
#define CS4385_REGISTER_MAX 23 // 0x17

//  Memory Map for addressing the register to write (read ???)
#define CS4385_REG_MAP 0x00 // MAP register holds Address to read and write
// MAP = Memory Address Pointer (8 Bit)
#define CS4385_MAP_INCR 0b10000000 // Increase Pointer on next read/write
#define cs4385_map(reg)      ((reg)&0b00011111)
#define cs4385_map_incr(reg) (((reg)&0b00011111)|0b10000000)

// ------- Register Listing with default values -------
// 01: Revision of Chip
//Addr     Function           7        6        5        4        3         2        1          0
//01h Chip Revision        PART4    PART3    PART2    PART1    PART0      REV      REV       REV
//               default     0        0        0        0        1         x        x          x
#define CS4385_REG_REVISION 0x01
#define CS4385_SET_REVISION 0 // initialize with 0 since read only

#define CS4385_REG_REVISION_REV_MASK 0b111
#define CS4385_REG_REVISION_PART_MASK 0b11111000
#define CS4385_REG_REVISION_PART 0b0001000
#define cs4385_revision_number(rev) ((rev)&CS4385_REG_REVISION_REV_MASK)

//02h Mode Control         CPEN    FREEZE  DSD/PCM DAC4_DIS DAC3_DIS DAC2_DIS DAC1_DIS       PDN
//               default     0        0        0        0        0         0        0          1
#define CS4385_REG_MOD_CONTROL1 0x02
#define CS4385_SET_MOD_CONTROL1 0b10000000 // power up and unfreeze
#define CS4385_SET_MOD_CONTROL1_FREEZE 0b11000000 // Powerup and freeze
#define CS4385_SET_MOD_CONTROL1_PDOWN 0b10000001  // Powerdown and unfreeze

//03h PCM Control           DIF3     DIF2     DIF1     DIF0  Reserved  Reserved    FM1       FM0
//               default     0        0        0        0        0         0        1          1
#define CS4385_REG_PCM_CONTROL 0x03
#define CS4385_SET_PCM_CONTROL 0b11000000  // TDM Dif, single speed

//04h DSD Control        DSD_DIF2 DSD_DIF1 DSD_DIF0 DIR_DSD  STATIC_D INVALID_D DSD_PM_ DSD_PM_
//                                                              SD        SD       MD         EN
//               default     0        0        0        0        1         0        0          0
#define CS4385_REG_DSD 0x04
#define CS4385_SET_DSD 0b00001000 // Disabled

//05h Filter Control     Reserved Reserved Reserved Reserved Reserved  Reserved Reserved  FILT_SEL
//               default     0        0        0        0        0         0        0          0
#define CS4385_REG_FILTER 0x05
#define CS4385_SET_FILTER 0b00000000 // fast roll off

//06h Invert Control      INV_B4   INV_A4   INV_B3   INV_A3   INV_B2    INV_A2   INV_B1    INV_A1
//               default     0        0        0        0        0         0        0          0
#define CS4385_REG_INVERT 0x06
#define CS4385_SET_INVERT 0b00000000 //  No inversion

//07h Group Control      Reserved  MUTEC   Reserved  P1_A=B   P2_A=B    P3_A=B   P4_A=B   SNGLVOL
//               default     0        0        0        0        0         0        0          0
#define CS4385_REG_GROUP 0x07
#define CS4385_SET_GROUP 0b01000000 // MUTEC single signal, no pairing, no single

//08h Ramp and Mute        SZC1     SZC0   RMP_UP   RMP_DN   PAMUTE    DAMUTE   MUTE_P1   MUTE_P0
//               default     1        0        1        1        1         1        0          0
#define CS4385_REG_RAMPMUTE 0x08
#define CS4385_SET_RAMPMUTE 0b10110100 // soft ramp, unmute after ERROR, no auto mute, dsd auto mute, auto mute

//09h Mute Control       MUTE_B4 MUTE_A4 MUTE_B3 MUTE_A3 MUTE_B2       MUTE_A2  MUTE_B1   MUTE_A1
//               default     0        0        0        0        0         0        0          0
#define CS4385_REG_RAMP 0x09
#define CS4385_SET_RAMP 0b00000000 // unmute

//0Ah Mixing Control     Reserved P1_DEM1  P1_DEM0  P1ATAPI4 P1ATAPI3  P1ATAPI2 P1ATAPI1  P1ATAPI0
//    Pair 1 (AOUTx1)
//               default     0        0        0        0        1         0        0          1
#define CS4385_REG_MIX1 0x0A
#define CS4385_SET_MIX1 0b11001001 // 32kHz Deemphasis, Stereo

//0Bh Vol. Control A1    A1_VOL7  A1_VOL6  A1_VOL5  A1_VOL4  A1_VOL3   A1_VOL2  A1_VOL1   A1_VOL0
//               default     0        0        0        0        0         0        0          0
#define CS4385_REG_VOLA1 0x0B
#define CS4385_SET_VOLA1 0   // 0dB (0=0 ... 255=-127.5 dB)

//0Ch Vol. Control B1     B1_VOL7  B1_VOL6  B1_VOL5  B1_VOL4  B1_VOL3   B1_VOL2  B1_VOL1   B1_VOL0
//               default     0        0        0        0        0         0        0          0
#define CS4385_REG_VOLB1 0x0C
#define CS4385_SET_VOLB1 0   // 0dB (0=0 ... 255=-127.5 dB)

//0Dh Mixing Control      Reserved P2_DEM1  P2_DEM0  P2ATAPI4 P2ATAPI3  P2ATAPI2 P2ATAPI1  P2ATAPI0
//   Pair 2 (AOUTx1)
//               default     0        0        0        0        1         0        0          1
#define CS4385_REG_MIX2 0x0D
#define CS4385_SET_MIX2 0b11001001 // 32kHz Deemphasis, Stereo

//0Eh Vol. Control A2    A2_VOL7  A2_VOL6  A2_VOL5  A2_VOL4  A2_VOL3   A2_VOL2  A2_VOL1   A2_VOL0
//               default     0        0        0        0        0         0        0          0
#define CS4385_REG_VOLA2 0x0E
#define CS4385_SET_VOLA2 0   // 0dB (0=0 ... 255=-127.5 dB)

//0Fh Vol. Control B2    B2_VOL7  B2_VOL6  B2_VOL5  B2_VOL4  B2_VOL3   B2_VOL2  B2_VOL1   B2_VOL0
//               default     0        0        0        0        0         0        0          0
#define CS4385_REG_VOLB2 0x0F
#define CS4385_SET_VOLB2 0   // 0dB (0=0 ... 255=-127.5 dB)

//10h Mixing Control     Reserved P3_DEM1  P3_DEM0  P3ATAPI4 P3ATAPI3  P3ATAPI2 P3ATAPI1  P3ATAPI0
//    Pair 3 (AOUTx1)
//               default     0        0        0        0        1         0        0          1
#define CS4385_REG_MIX3 0x10
#define CS4385_SET_MIX3 0b11001001 // 32kHz Deemphasis, Stereo

//11h Vol. Control A3    A3_VOL7  A3_VOL6  A3_VOL5  A3_VOL4  A3_VOL3   A3_VOL2  A3_VOL1   A3_VOL0
//               default     0        0        0        0        0         0        0          0
#define CS4385_REG_VOLA3 0x
#define CS4385_SET_VOLA3 0   // 0dB (0=0 ... 255=-127.5 dB)

//12h Vol. Control B3    B3_VOL7  B3_VOL6  B3_VOL5  B3_VOL4  B3_VOL3   B3_VOL2  B3_VOL1   B3_VOL0
//               default     0        0        0        0        0         0        0          0
#define CS4385_REG_VOLB3 0x12
#define CS4385_SET_VOLB3 0   // 0dB (0=0 ... 255=-127.5 dB)

//13h Mixing Control     Reserved P4_DEM1  P4_DEM0  P4ATAPI4 P4ATAPI3  P4ATAPI2 P4ATAPI1  P4ATAPI0
//    Pair 4 (AOUTx1)
//               default     0        0        0        0        1         0        0          1
#define CS4385_REG_MIX4 0x13
#define CS4385_SET_MIX4 0b11001001 // 32kHz Deemphasis, Stereo

//14h Vol. Control A4   A4_VOL7 A4_VOL6  A4_VOL5 A4_VOL4  A4_VOL3  A4_VOL2  A4_VOL1   A4_VOL0
//              default    0       0        0       0        0        0        0         0
#define CS4385_REG_VOLA4 0x14
#define CS4385_SET_VOLA4 0   // 0dB (0=0 ... 255=-127.5 dB)

//15h Vol. Control B4   B4_VOL7 B4_VOL6  B4_VOL5 B4_VOL4  B4_VOL3  B4_VOL2  B4_VOL1   B4_VOL0
//              default    0       0        0       0        0        0        0         0
#define CS4385_REG_VOLB4 0x15
#define CS4385_SET_VOLB4 0   // 0dB (0=0 ... 255=-127.5 dB)

//16h PCM clock mode Reserved   Reserved MCLKDIV Reserved Reserved Reserved Reserved  Reserved
//              default    0       0        0       0        0        0        0         0
#define CS4385_REG_CLOCK 0x16
#define CS4385_SET_CLOCK 0b00000000 // no division

typedef struct _escher_cs4386_config {
    unsigned char reg[CS4385_REGISTER_MAX];
    // Note omit 0, and start with 0x01, but 0x1 is read only !!!
} ESCHER_CS4385_REGISTER;

void escher_cs4385_i2c_init(void); // opens the I2C Interface
int escher_cs4385_init(void); //  looks for valid Revision and set initial settings

#define escher_cs4385_i2c_exit()  CloseI2C1() // if opened
//void escher_cs4385_i2c_exit(void); // close I2C
#define escher_cs4385_exit() // escher_cs4385_reset()  // mutes and unpowers chip
//void escher_cs4385_exit(void); // mutes and unpowers chip

int escher_cs4385_write(unsigned char reg, unsigned char *data, unsigned char len);
int escher_cs4385_write_byte(unsigned char reg, unsigned char data);

unsigned char escher_cs4385_read(unsigned char *data, unsigned char len);
void escher_cs4385_readall(void);
// helpers

//int escher_cs4385_revision(void); // get revision of chip
// read from ram not from chip
#define escher_cs4385_revision() (cs4385_config.reg[CS4385_REG_REVISION]&CS4385_REG_REVISION_REV_MASK)

// Commands done with functions or Macros
//void escher_cs4385_pdown(void); //
#define escher_cs4385_pdown(void) escher_cs4385_write_byte(CS4385_REG_MOD_CONTROL1,CS4385_SET_MOD_CONTROL1_PDOWN)

// Volumes in 0.5dB steps: 0=0dB, 1=-0.5dB, 2=-1dB, ..., 255=-127.5dB
// set individual volumes of each channel
//unsigned char escher_cs4385_getvolume(unsigned char nr);
//unsigned char escher_cs4385_setvolume(unsigned char nr,unsigned char value);
//
//// set only one master volume, which is channel volume 1
//unsigned char escher_cs4385_getmaster(void);
//unsigned char escher_cs4385_setmaster(unsigned char value);
#endif // __ESCHER_CS4385_H
