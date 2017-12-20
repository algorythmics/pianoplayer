/* *******************************************************************
 *
 * ESCHER dsPIC-Board Hardware Plugins helper code
 *
 *********************************************************************
 * FileName     :    escherBoardPlugins.c
 * Dependencies :    escherBoard.h
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

/* --------------------- CONFIGURATIONS (doc) --------------------------- */
/* Defines to configure this module before including this header          */
/* should be done individually for each project (no concept now)          */
//#define ESCHER_POTI // plugin POTI board, with buttons (historic, default no)


/*********************************************************************
 * Function:        void escher_init_poti
 *                  int escher_read_poti()
 *
 * PreCondition:    Init Escher board
 * Side Effects:    AN0 Input is used cannot be used for others
 *
 * Overview:        inits the poti, which is an historic board plugin
 *
 * Note:            not used any more.
 ********************************************************************/

void escher_init_poti(void)
{
    // For Testing ADC Input is used, not implemneted now
#if defined (ESCHER_POTI)
    AD1CHS0 = 0; // Input to AN0 (potentiometer)
    AD1PCFGLbits.PCFG5 = 0; // Disable digital input on AN5 (potentiometer)
    AD1PCFGLbits.PCFG4 = 0; // Disable digital input on AN4 (TC1047A temp sensor)

    // ADC
    AD1CON1 = 0x84E4; // Turn on, auto sample start, auto-convert, 12 bit mode (on parts with a 12bit A/D)
    AD1CON2 = 0x0404; // AVdd, AVss, int every 2 conversions, MUXA only, scan
    AD1CON3 = 0x1003; // 16 Tad auto-sample, Tad = 3*Tcy
    AD1CSSL = 1 << 5; // Scan pot
#endif
}
