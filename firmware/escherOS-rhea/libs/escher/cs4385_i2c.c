/*********************************************************************
 *
 *	Escher AMP8 board CS4385 Configuration Header
 *
 *********************************************************************
 * FileName:        cs4386_i2c.c
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
 * Communication over I2C with DA Converter CS4385 as slave.
 * Uses peripheral library of i2s from C30
 *
 * TODO: Make it configurable to use also the I2C2 !!! with a define.
 *
 ********************************************************************/
#include "HardwareProfile.h"

//#define USE_AND_OR /* To enable AND_OR mask setting but we dont !!! */
#include <i2c.h>
#include <string.h>

//#include "io_defs.h"

#include "cs4385_i2c.h"
extern unsigned int loop;
#define BUS_FRQ 100000 // 100kHz transmission
static void escher_cs4385_cmd_write(BYTE reg);
static void escher_cs4385_init_config(void);

// Initial configuration settings of the config Pins
// Note REVISION is read only !
static const ESCHER_CS4385_REGISTER init_config = {
    0, // count start at 0 CS4385_REG_MAP
    CS4385_SET_REVISION,
    CS4385_SET_MOD_CONTROL1,
    CS4385_SET_PCM_CONTROL,
    CS4385_SET_DSD,
    CS4385_SET_FILTER,
    CS4385_SET_INVERT,
    CS4385_SET_GROUP,
    CS4385_SET_RAMPMUTE,
    CS4385_SET_RAMP,
    CS4385_SET_MIX1,
    CS4385_SET_VOLA1,
    CS4385_SET_VOLB1,
    CS4385_SET_MIX2,
    CS4385_SET_VOLA2,
    CS4385_SET_VOLB2,
    CS4385_SET_MIX3,
    CS4385_SET_VOLA3,
    CS4385_SET_VOLB3,
    CS4385_SET_MIX4,
    CS4385_SET_VOLA4,
    CS4385_SET_VOLB4,
    CS4385_SET_CLOCK
};

// local copy of register to update without read from chip
static ESCHER_CS4385_REGISTER config;

/* ******* open an INIT I2C for chip *****************************
 *
 * precondition: none
 *
 * should be done at hardware initialization, to define the I2C PINS
 * on the processor, before the TDM Interface is starting to clock
 *
 * Note: Maby have to be changed to I2C2 !!!!!!
 *
 */

void escher_cs4385_i2c_init(void) {
    unsigned int config1, config2;

    CloseI2C1(); // if opened from somewhere else

    config1 = (I2C1_ON & I2C1_IDLE_CON & I2C1_CLK_HLD &
            I2C1_IPMI_DIS & I2C1_7BIT_ADD &
            I2C1_SLW_DIS & I2C1_SM_DIS &
            I2C1_GCALL_DIS & I2C1_STR_EN &
            I2C1_NACK & I2C1_ACK_EN & I2C1_RCV_DIS &
            I2C1_STOP_EN & I2C1_RESTART_EN &
            I2C1_START_DIS);
    config2 = I2C_BRG; // see io_defs.h

    OpenI2C1(config1, config2);
    IdleI2C1();
}

/* --------------- Init CS chip setting default config and variables -------  
 * 
 * Function: escher_cs4385_init
 * Precondition: opened i2c !
 *
 * Initializes the chip to default state: Note power up is done also !!!!
 * This should happen within 512L/R cycles of the TDM interface to avoid clicks
 *
 */

int escher_cs4385_init(void) {

    unsigned char byte;

// read revision from default MAP which is 0x1
//    byte = 0;
//    escher_cs4385_read(&byte, 1);
//    Nop();
//    Nop();
//    config.reg[CS4385_REG_REVISION] = byte;


    // first write CPEn in Control1 Register
    // to slip into software mode of CS4385 in between 512 L/R cycles
    // and freeze parameter changes  so they can be done in one

    escher_cs4385_write_byte(CS4385_REG_MOD_CONTROL1, CS4385_SET_MOD_CONTROL1_FREEZE);
    // write S 0011 0000 A 0000 0010 A 1100 0000 A s

    // Now Write all Control settings from Chip to verify settings afterwards
    escher_cs4385_init_config();

    // doesnt work properly
//    escher_cs4385_readall();

    // Unfreeze
    escher_cs4385_write_byte(CS4385_REG_MOD_CONTROL1, CS4385_SET_MOD_CONTROL1);

    return TRUE;
}

/* -------------------- Write Configs to CS4385 --------------------
 *
 * Function:  write command to write from a specific register incremental
 *
 * Params: reg ... Register Number (see header definitions)
 *         pdata ... pointer to data
 *         len ... number of bytes written
 *
 *
 * Precondition: Initialized I2C
 *
 * Return: return 0 on error else number of bytes written
 * 
 * Note: No check if register doesnt exist see CS4385_REGISTER_MAX
 *
 */

int escher_cs4385_write(BYTE reg, BYTE *data, BYTE len) {

    int i = len;
    BYTE *pdata = data;

    // 1. address CS4385 with a write command
    // try send command and repeat until ACK is received
    int attempts = CS4385_WRITE_MAX_ATTEMPTS;

    while (1) {
        StartI2C1();
        IdleI2C1();
        // send command and address msb(3)
        MasterWriteI2C1(CS4385_ADDR_WRITE);
        if (I2C1STATbits.ACKSTAT == 0)
            break;
        StopI2C1();
        IdleI2C1();
        // Note a timeout should be done here or max tries ?
        if (attempts-- < 0)
            return 0;
    } // while waiting for ACK
    IdleI2C1();

    // 2. send address with increment bit set
    MasterWriteI2C1(cs4385_map_incr(reg));
    IdleI2C1();

    // 3. stream data out
    while (i--) {
        MasterWriteI2C1(*pdata++);
        IdleI2C1();
    }
    // 4. terminate the command sequence
    StopI2C1();
    IdleI2C1();
    return len;
}

/* -------------------- Write Configs to CS4385 --------------------
 *
 * Function:  write command to one specific register
 *
 * Params: reg ... Register Number (see header definitions)
 *         data ... pointer to data
 *
 * Precondition: Initialized I2C
 *
 * Return: return 0 on error else 1
 *
 * Note: No check if register doesnt exist see CS4385_REGISTER_MAX
 *
 */

int escher_cs4385_write_byte(BYTE reg, BYTE data) {

    int attempts = CS4385_WRITE_MAX_ATTEMPTS;

    while (1) {
        StartI2C1();
        IdleI2C1();
        // send command and address msb(3)
        MasterWriteI2C1(CS4385_ADDR_WRITE);
        if (I2C1STATbits.ACKSTAT == 0)
            break;
        StopI2C1();
        IdleI2C1();
        // Note a timeout should be done here or max tries ?
        if (attempts-- < 0)
            return -1;
    } // while waiting for ACK
    // 2. send address with increment bit set
    MasterWriteI2C1(cs4385_map(reg));
    IdleI2C1();
    // 3. stream data out
    MasterWriteI2C1(data);
    IdleI2C1();
    // 4. terminate the command sequence
    StopI2C1();
    IdleI2C1();
    return 1;
}

/* -------------------- READ Configs from CS4385 --------------------
 *
 * Function:  read config bytes from actuel register pointed by MAP incremental
 *
 * Params: pdata ... pointer to read data
 *         len ... number of bytes read from cs4385
 *
 * Precondition: Initialized I2C
 *
 * Return: return config bytes in pdata
 *
 * Note: No check if register doesnt exist see CS4385_REGISTER_MAX
 *
 * Note: doesnt work until now except the initial readout of all
 *       I don't know how to set the MAP
 *
 */
BYTE escher_cs4385_read(BYTE *data, BYTE len) {

    BYTE *pdata = data;
    int i = len;


    // 1. read command
    StartI2C1();
    IdleI2C1();
    MasterWriteI2C1(CS4385_ADDR_READ);
    IdleI2C1();
    // 2. read incremental date
    while (i--) {
        *pdata++ = MasterReadI2C1();
        AckI2C1();
        IdleI2C1();
    }
    // 3. terminate read sequence (send NACK then STOP)
    NotAckI2C1();
    IdleI2C1();
    StopI2C1();
    IdleI2C1();
    return i;
}

/* -------------------- READ Config byte from CS4385 --------------------
 *
 * Function:  read config bytes from actuel register pointed by MAP incremental
 *
 * Params: pdata ... pointer to read data
 *         len ... number of bytes read from cs4385
 *
 * Precondition: Initialized I2C
 *
 * Return: return config bytes in pdata
 *
 * Note: No check if register doesnt exist see CS4385_REGISTER_MAX
 *
 * Note: doesnt work until now except the initial readout of all
 *       I don't know how to set the MAP
 *
 */

BYTE escher_cs4385_read_byte(BYTE reg) {

    BYTE byte;

    // 1. start with write cmd
    StartI2C1();
    IdleI2C1();
    MasterWriteI2C1(CS4385_ADDR_WRITE);
    IdleI2C1();
    // 2. write MAP address
    MasterWriteI2C1(cs4385_map(reg));
    IdleI2C1();
    // 3. Restart with a read
    RestartI2C1();
    MasterWriteI2C1(CS4385_ADDR_READ);
    IdleI2C1();
    // 4. Read byte
    byte = MasterReadI2C1();
    AckI2C1();
    IdleI2C1();

    // 5. terminate read sequence (send NACK then STOP)
    NotAckI2C1();
    IdleI2C1();
    StopI2C1();
    IdleI2C1();
    return byte;
}

/* ---------- READ all Config byte from CS4385 in static config storage ---
 *
 * Function:  read config bytes into static Config register incremental
 *
 * Precondition: Initialized I2C
 *
 */

void escher_cs4385_readall(void) {
    // start read at Register 0x01, since no 0x00 on chip
    escher_cs4385_read(&config.reg[CS4385_REG_REVISION],
            sizeof(ESCHER_CS4385_REGISTER) - CS4385_REG_REVISION);
//    escher_cs4385_read(&config.reg[CS4385_REG_MOD_CONTROL1],
//            sizeof(ESCHER_CS4385_REGISTER) - CS4385_REG_MOD_CONTROL1);
    //    config.reg[CS4385_REG_MAP]++; // update read count
}

/* ------ Initialize CS4385 with default config without Control 1 ----
 *
 * Function: Write configs from initial configuration needed
 *
 * Precondition: Initialized I2C
 *
 * Notes:
 * - To be done after setting CONTROL1 into freeze.
 * -  To mirror the static config register into the cs4385,
 *    also the static config is modified
 */
static void escher_cs4385_init_config(void) {
    memcpy(&config.reg[0], &init_config.reg[0], sizeof (ESCHER_CS4385_REGISTER));
    escher_cs4385_write(CS4385_REG_PCM_CONTROL, &config.reg[CS4385_REG_PCM_CONTROL],
            sizeof (ESCHER_CS4385_REGISTER) - CS4385_REG_PCM_CONTROL);
    config.reg[CS4385_REG_MAP] = 0; // update read count
}

/* =========================== Helper Functions ================================
 *
 *  * Funtion: escher_cs4385_{name}
 *
 * Precondition: cs4385 has to be initialized
 *               and powerd up exept on writing control1, which has powerup flag
 *
 *
 */

// To be done:
//unsigned char escher_cs4385_getvolume(unsigned char nr);
//unsigned char escher_cs4385_setvolume(unsigned char nr,unsigned char value);
//
//// set only one master volume, which is channel volume 1
//unsigned char escher_cs4385_getmaster(void);
//unsigned char escher_cs4385_setmaster(unsigned char value);
