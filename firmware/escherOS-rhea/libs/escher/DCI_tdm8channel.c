/**********************************************************************
 *
 * FileName:        DCI_tdm8channel.c
 * Dependencies:    DCI_tdm8channel.h
 * Processor:       dsPIC33Fxxxx/PIC24Hxxxx
 * Compiler:        MPLAB C30 v3.00 or higher
 *
 * Copyright  2012 winfried ritsch
 *
 * derived from DCII2S example CE113 (microchip)
 * Veena K.          03/23/06
 *
 * REVISION HISTORY:
 *~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
 * Author            Date      Comments on this revision
 *~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
 * Winfried Ritsch   02/10/12  adapted
 *
 *~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
 * ADDITIONAL NOTES:
 * Test TDM 8 channel on dspic33FJ256GP710 + Explorer 16
 **********************************************************************/
#include "HardwareProfile.h"

//#include "io_defs.h"
#include "DCI_tdm8channel.h"
#include "escher_osc.h"

__eds__ DCI_SAMPLE dci1RxBuffA[BUFFER_SIZE_HALF] __attribute__((eds,space(dma)));
__eds__ DCI_SAMPLE dci1RxBuffB[BUFFER_SIZE_HALF] __attribute__((eds,space(dma)));
__eds__ DCI_SAMPLE dci1TxBuffA[BUFFER_SIZE_HALF] __attribute__((eds,space(dma)));
__eds__ DCI_SAMPLE dci1TxBuffB[BUFFER_SIZE_HALF] __attribute__((eds,space(dma)));

void dma0Init(void);
void dma0enable(void);
void dma1Init(void); // dummy read for performance test
void dma1enable(void);

unsigned int dma_counter;

/*=============================================================================
dciStartOsc(): Initialise OSCILATOR for use with DCI
=============================================================================*/
void dciStartOsc(void){

    //            Crystal Frequency  * (DIVISOR+2)
    // Fcy =     ----------------------------------
    //              PLLPOST * ((PRESCLR+2)= 4
    //
    // Fcy = 8Mhz*(DIV+2) / PLLPOST * ((PRESCLR+2)
    //
    // M = (PLLFBD+2) = (PLLPOST*(PLLPRE+2)*Fosc/Fin
    //
    // Configure Oscillator to operate the device at 60Mhz
    // Fosc= Fin*M/(N1*N2), Fcy=Fosc/2
    // Fosc= 7.37*33/(2*2)=60Mhz for 7.37 input clock

#if defined(USE_DCI_TDM_CLOCK_AND_CLOCKCONFIGS)
    PLLFBD = OSC_PLLFDB;
    CLKDIVbits.PLLPOST = OSC_PLLPOST;
    CLKDIVbits.PLLPRE = OSC_PLLPRE;
    OSCTUN = OSC_TUNE; // Tune FRC oscillator, if FRC is used

    // Disable Watch Dog Timer
    RCONbits.SWDTEN = 0;

    __builtin_write_OSCCONH(0x01); // Initiate Clock Switch to FRC with PLL (NOSC=0x01)
    __builtin_write_OSCCONL(OSCCON || 0x01); // Start clock switching
    while (OSCCONbits.COSC != 0x01); // Wait for Clock switch to occur
    while (OSCCONbits.LOCK != 1); // Wait for PLL to lock
#endif
}


/*=============================================================================
dciInit(): Initialise DCI peripheral for I2S Interface
=============================================================================*/
// be sure PINs defined in the HWP

void dciInit(void) {
    // Init DCI for I2C interface

        // first map IOs to PIN (see io_def.h)
    PPSUnLock();
    // Inputs
    IN_FN_PPS_CSDI = PIN_CSDI;

    // Outputs
    PIN_CSDO = OUT_FN_PPS_CSDO;
    PIN_CSCK = OUT_FN_PPS_CSCKOUT;
    PIN_COFS = OUT_FN_PPS_COFSOUT;

    PPSLock();

    Nop();



    //DCI Control Register DCICON1 Initialization
    DCICON1bits.CSCKD = 0; // Serial Bit Clock (CSCK pin) is output
    DCICON1bits.CSCKE = 1; // Data changes on rising edge sampled on rising edge of CSCK
    DCICON1bits.COFSD = 0; // Frame Sync Signal is output
    DCICON1bits.UNFM = 0;  // Transmit "0"s on a transmit underflow
    DCICON1bits.CSDOM = 0; // CSDO pin drives "0"s during disabled transmit time slots
    DCICON1bits.DJST = 0;  // Data TX/RX is begun one serial clock cycle after frame sync pulse
    DCICON1bits.COFSM = 0; // Multichannel Frame Sync Mode

#if defined(LOOPBACKMODE)
    DCICON1bits.DLOOP = LOOPBACKMODE;
#else
    DCICON1bits.DLOOP = 0;
#endif

    // DCI Control Register DCICON2 Initialization
    DCICON2bits.BLEN = 0;   // One data word will be buffered between interrupts since DMA
    DCICON2bits.COFSG = 15; // Data frame has 16 words of 16Bits = 8 words 32bit
    DCICON2bits.WS = 15;    // Data word size is 16 bits

    // Select frequency for Samplerate on DSI !

    // DCI Control Register DCICON3 Initialization
    DCICON3 = BCG_VAL; // Set up CSCK Bit Clock Frequency

    // Transmit Slot Control Register Initialization
    TSCON = 0xFFFF; // Transmit on 16 Time Slots

    //Receiver Slot Control Register Initialization
    RSCON = 0xFFFF; // Receive on 16 Time Slots
        // Clear DMA RAM
    // dmaClearBuf(); // Clear DMA RAM
    dma0Init();  // Transmit DMA
    dma1Init();  // Receive DMA
    
    dciInitBuffer();
    // Force First two words to fill-in buffer/shift register
    DMA0REQbits.FORCE = 1;
    while (DMA0REQbits.FORCE == 1);
    DMA0REQbits.FORCE = 1;
    while (DMA0REQbits.FORCE == 1);


    // reset counter init debug pin and Enable DCI module
    dma_counter = 0;
    dma0enable();
    dma1enable();

    // enable DCI
    // Disable DCI Interrupt use DMA Interrupt
    IFS3bits.DCIIF = 0;
    IEC3bits.DCIIE = 0;
    //DCICON1bits.DCIEN = 0;
    DCICON1bits.DCIEN = 1;
}

//void __attribute__((__interrupt__)) _DCIInterrupt(void); //not used

/*=============================================================================
_DMA0Init(): Initialise DMA0 for DCI Data Transmission 
=============================================================================*/
// DMA0 configuration
// Direction: Read from DMA RAM and write to peripheral address 0x298 (TXBUF0 register)
// AMODE: Register Indirect with Post-Increment mode
// MODE: Continuous, Ping-Pong Enabled
// IRQ: DCI

void dma0Init(void) {

    DMA0CON = 0x2002; //ping pong, continuous, RAM->DCI
    DMA0CNT = (2*BUFFER_SIZE_HALF)-1;  // N+1 words=2*samples in DMA Buffer (double of samples)
    DMA0REQ = 0x003C; // DCI is interrupt source for DMA-Request

    DMA0PAD = (volatile unsigned int) &TXBUF0;  // DMA Sink Periperhal
    DMA0STAL = __builtin_dmaoffset(dci1TxBuffA); // DMA Buffer HALF A
    DMA0STAH = 0x0000; // if DMA outside the 64k
    DMA0STBL = __builtin_dmaoffset(dci1TxBuffB); // DMA Buffer HALF B
    DMA0STBH = 0x0000; // if DMA outside the 64k
}

void dma0enable(void) {
    IFS0bits.DMA0IF = 0; // Clear DMA interrupt
    IEC0bits.DMA0IE = 1; // Enable DMA interrupt
    DMA0CONbits.CHEN = 1; // Enable DMA Channel
}

/*=============================================================================
DMA1Init(): Initialise DMA1 to receive DCI data
==============================================================================*/
// DMA1 configuration
// Direction: Read from peripheral address 0-x290 (RXBUF0) and write to DMA RAM 
// AMODE: Register Indirect with Post-Increment mode
// MODE: Continuous, Ping-Pong Enabled
// IRQ: DCI Reception

void dma1Init(void) {

    DMA1CON = 0x0002; //ping pong, continuous, DCI->RAM
    DMA1CNT = (2*BUFFER_SIZE_HALF)-1; // N+1 words=2*DCI_SAMPLEs
    DMA1REQ = 0x003C; // DCI is interrupt source for DMA-Request

    DMA1PAD = (volatile unsigned int) &RXBUF0;  // Peripheral source address
    DMA1STAL = __builtin_dmaoffset(dci1RxBuffA); // DMA Buffer HALF  A
    DMA1STAH = 0x0000;
    DMA1STBL = __builtin_dmaoffset(dci1RxBuffB); // DMA Buffer HALF B
    DMA1STBH = 0x0000;
}

void dma1enable(void) {
    IFS0bits.DMA1IF = 0; // Clear DMA interrupt
    IEC0bits.DMA1IE = 1; // Enable DMA interrupt
    DMA1CONbits.CHEN = 1; // Enable DMA Channel
}

/*=============================================================================
_DMA0Interrupt(): DCI Transmit Interrupt Handler
=============================================================================*/
unsigned int readbuf_index = 0;
unsigned int bufhalf = 0;

void __attribute__((interrupt, no_auto_psv)) _DMA0Interrupt(void) {
    //    tglPin(); // Toggle PORTA, BIT0
    DCI_SAMPLE *audiobufptr;
    int n = BUFFER_SAMPLES_HALF;
    int m = readbuf_index;
    
    dma_counter++;
    audiobufptr = (DCI_SAMPLE *) &audiobuf[readbuf_index];

    // NOTE: to be verified if not vice versa ?
//    if (DMAPPSbits.PPST0){ // if 1 DMA processes DMASTBx, swo we use DMASTBAx
   
    if (bufhalf == 0){ // if 1 DMA processes DMASTBx, swo we use DMASTBAx
    //    sampleptr = (DCI_SAMPLE *) dci1TxBuffA;
        while(n--)
//            dci1TxBuffA[n].sample = 0l;
            dci1TxBuffA[n].sample = audiobufptr[n].sample;
        
        bufhalf = 1;

    } else {
//        sampleptr = (DCI_SAMPLE *) dci1TxBuffB;
      while(n--)
            dci1TxBuffB[n].sample = audiobufptr[n].sample;
//            dci1TxBuffB[n].sample = 0l;
        bufhalf = 0;
    }
    readbuf_index = (readbuf_index + BUFFER_SAMPLES_HALF ) & OSC_AUDIOBUF_SIZE_MASK;
    
    // memcpy(sampleptr,samplebuf,BUFFER_SAMPLES_HALF*sizeof(DCI_SAMPLE));

    IFS0bits.DMA0IF = 0; //Clear the DMA0 Interrupt Flag
}

/*=============================================================================
DMA1Interrupt(): DCI Receive Interrupt Handler
==============================================================================*/
void __attribute__((interrupt, no_auto_psv)) _DMA1Interrupt(void) {

//    if (DMAPPSbits.PPST0)
//        ProcessDciRxSamples(&dci1RxBuffA[0]);
//
//    else
//        ProcessDciRxSamples(&dci1RxBuffB[0]);

    IFS0bits.DMA1IF = 0; // Clear the DMA0 Interrupt Flag
}

/*============================================================================
initI2sBuff(): Initialise I2S Transmit and Receive Buffer
==============================================================================*/

// first test make samples in Buffer index numbers and first half negative
// with loopback it should afterwards be in receiver
//#define MAX_SAMPLE_INT 8388608l
#include <math.h>
#define MAX_SAMPLE_INT ((signed long) 0x7FFFFFFFl)
#define MAX_AMPLITUDE  0.1f // for saving the speaker or ears.

#if !defined(PI)
#define PI 3.14159265359f
#endif

void dciInitBuffer(void) {
    signed long i;
    DCI_SAMPLE v;
    unsigned int n;

//  v.sample = 0b10000000101000001010100010101010l; // test byte order on stream

    for (i = 0; i < BUFFER_SAMPLES_HALF; i++) {

        v.sample = (signed long) ((float) MAX_SAMPLE_INT * 0.1f *
                sinf(2.0 * PI * (float) i/(float) BUFFER_SAMPLES));
//        v.sample = (signed long) 1l * MAX_SAMPLE_INT/10l;

//          v.sample = (i * (MAX_SAMPLE_INT/(BUFFER_SAMPLES_HALF)))/4l;
//        v.sample = MAX_SAMPLE_INT/4l;
        
        for (n = 0; n < CHANNELS; n++){
//            dci1TxBuffA[i * CHANNELS + n].sample = v.sample;
            dci1TxBuffA[i * CHANNELS + n].word[0] = v.word[1];
            dci1TxBuffA[i * CHANNELS + n].word[1] = v.word[0];
        }
    }

    for (i = 0; i < BUFFER_SAMPLES_HALF; i++) {

       v.sample = (signed long)((float) MAX_SAMPLE_INT * 0.1f *
               sinf(2.0f * PI * (float) (i+BUFFER_SAMPLES_HALF)/(float) BUFFER_SAMPLES));
//        v.sample = (-1l * MAX_SAMPLE_INT + i * (MAX_SAMPLE_INT/(BUFFER_SAMPLES_HALF)))/4l;
//        v.sample = -1l * MAX_SAMPLE_INT/4l;

        for (n = 0; n < CHANNELS; n++) {
//            dci1TxBuffB[i * CHANNELS + n].sample = v.sample;
            dci1TxBuffB[i * CHANNELS + n].word[0] = v.word[1];
            dci1TxBuffB[i * CHANNELS + n].word[1] = v.word[0];
        }
    }
    // erase RX Buf
    for(i=0; i < BUFFER_SIZE_HALF;i++)
            dci1RxBuffA[i].sample = 0l;
    for(i=0; i < BUFFER_SIZE_HALF;i++)
            dci1RxBuffB[i].sample = 0l;
}

/* not needed anymore since we inizialzed buffer
// Buffer clear with 0x0F0F to debug unwritten aereas
#define DEFAULT_DMA_VALUE 0x0F0F
extern unsigned int *_DMA_BASE;
extern unsigned int *_DMA_BASE;

static void dmaClearBuf(void) {
    unsigned int *dmaBuf = (unsigned int *) & _DMA_BASE;
    int i = 0;
    int count = 2048;
    
    for (i = 0; i < count; i++) {
        dmaBuf[i] = DEFAULT_DMA_VALUE;
    }
}
*/
