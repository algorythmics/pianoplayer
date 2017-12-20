/*********************************************************************
 *
 *   RheaPlayer
 *
 *   Application for using Escher and EscherFET16 Boards 
 *   for Autoklavierspieler Rhea
 *
 *	 -Used Libraries Microchip Reference: AN833
 *
 * Note: derived from Demo App of TCP/IP Stack
 *
 *********************************************************************
 * FileName:        rhea.c
 * Processor:       dsPIC33F
 * Company:         Algorythmics
 *
 * Author       Date         Comment
 *~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
 * W.Ritsch	5.7.2008
 *                          for Escher and 2 EscherFet16 Boards,
 *                          use only SNTP, UDP, telnet and DHCPClient
 * W.Ritsch	22.2.2010       adapted for Rhea Player 1 FET Board
 * W.Ritsch     17.8.2011   adaption for MPLAB-X
 * further logs in git and svns
 * 
 ********************************************************************/
#define THIS_IS_MAIN
#include "HardwareProfile.h"
// Include all headers for any enabled TCPIP Stack functions

#define THIS_IS_STACK_APPLICATION /* only in main */
#include <TCPIP Stack/TCPIP.h>
#include "TCPIP Stack/DHCP.h"

/* --- rhea specific settings ---- */
#include "rhea.h"
#include "rhea_timer4.h"
#include "fet16/fet16.h"
#include "escherPWM.h"
#include "escherUART.h"
#include "escherSerial.h"
#include "play_pulses.h"
// Include functions specific to this stack application
#include "escherUDP.h"

// master or slave on boot then hold the state even cable is not present
static int ethernet_mode = FALSE;

// Declare AppConfig structure and some other supporting stack variables
APP_CONFIG AppConfig;
BYTE AN0String[8];

BYTE myDHCPBindCount = 0xFF;
#if !defined(STACK_USE_DHCP_CLIENT)
#define DHCPBindCount	(1)
#endif
#if defined (CLOCK32KHZ)
void enSecOsc(void);
#endif

// Private helper functions.
static void InitAppConfig(void);

/* catch Error Interrupts if they accur with nops */
#if defined(__C30__)

void _ISR __attribute__((__no_auto_psv__)) _AddressError(void) {
    Nop();
    Nop();
}

void _ISR __attribute__((__no_auto_psv__)) _StackError(void) {
    Nop();
    Nop();
}

#elif defined(__C32__)
void _general_exception_handler(unsigned cause, unsigned status) {
    Nop();
    Nop();
}
#endif

//
// Main application entry point. ---------------------------------
//
DT_STATISTIC dtstat;
//RHEA_TICK actual_time; //clocktest
RHEA_TICK volatile logical_time, loop_time; /* ticktime for timeouts */

int main(void) {
    RHEA_TICK last_playfettime;
    RHEA_TICK old_loop_time;
    RHEA_TICK dt;
    BYTE second_phase;

    // Initialize application specific hardware
    TickInit(); // for TCP/IP Stack internal RHEA_TICK timer used Timer1
    escher_init(); // set Oszilator and IOs on board

    // Used in master and slave as time base and also TCP/IP Stack.
#if defined (CLOCK32KHZ)
    enSecOsc(); // Enable Secondary Osc
#endif

    // 2.) ------ variables init ---------------

    // Init statistics for reports
    dtstat.min = TICKS_PER_SECOND;
    dtstat.max = 0ul;
    dtstat.count = 0ul;
    dtstat.time = 0ul;
    dtstat.tps = TICKS_PER_SECOND;

    init_pulses(); // set up state machine for playing pulses
    // 3.) Init Hardware

#if defined (TEST_PINS)
    TEST_PIN1_TRIS = 0;
    TEST_PIN2_TRIS = 0;
    TEST_PIN3_TRIS = 0;
    TEST_PIN4_TRIS = 0;
#endif

    if (rhea_is_master()) {
        ethernet_mode = TRUE;
    }

    init_fets(); /* INIT Ports as Outputs and clear them */
    InitPWM(); /* init PWMs instead of raw I/Os, overwrites FET_OUTS */
    clearPWMs(); // should be done in Init, but to get sure
    activate_fets(); /* Activate also SoftPWMS  outputs */
    Init_Timer4(); // for I/O pocessing ?

    /* First step done -> light first LED */
    ACTIVE_LED = OB_LED_ON;

    // Initialize The UARTs for master and slave the same
    escher_UART1_init();
    escher_UART2_init();
    escherSerialInit();

    if (ethernet_mode) {
        // Initialize Stack and application related NV variables into AppConfig.
        InitAppConfig();

        // Initialize core stack layers (MAC, ARP, TCP, UDP) and
        // application modules (HTTP, SNMP, etc.)

        //DHCPDisable();
        StackInit();
        ESCHERUDPReset();
        // NETWORK_LED = OB_LED_ON; // LED2 Stack init (could hang in DHCP)
    }

    // Now that all items are initialized, begin the co-operative
    // multitasking loop.

    // Note that this is a "co-operative mult-tasking" mechanism
    // where every task performs its tasks (whether all in one shot
    // or part of it) and returns so that other tasks can do their
    // job.
    // If a task needs very long time to do its job, it must be broken
    // down into smaller pieces so that other tasks can have CPU time.

    // init loop timer, counter
    logical_time = old_loop_time = TickGet();
    dt = last_playfettime = logical_time;
    dt = (RHEA_TICK) 0;
    second_phase = 0;

    ////  ---- TEST Clock --------
    //	while(1)
    //	{
    //		loop_time = TickGet(); // lowest 32bit of time for time outs and statistic
    //		if(loop_time < logical_time){
    //			logical_time = 0;     // lazy wrap, since until RHEA_TICK is unsigned
    //			Nop();
    //			Nop();
    //		}
    //
    //   		while((loop_time - logical_time) >= TICKS_PER_SECOND)
    //        {
    //			// LED1 ... Tick is running in 1 sec
    //			Nop();
    //			Nop();
    //            logical_time += TICKS_PER_SECOND;
    //			Nop();
    //			Nop();
    //
    //			//Loop running
    //			ACTIVE_LED ^= 0b1;
    //		}
    //	}
    //


    while (1) {
        TEST_PIN2_SET(); // measure loop unset before UDP Task

        loop_time = TickGet(); // lowest 32bit of time for time outs and statistic
        // WRAP ARROUND ?
        if (loop_time < logical_time) {
            logical_time = (RHEA_TICK) 0; // lazy wrap, since until RHEA_TICK is unsigned
            old_loop_time = (RHEA_TICK) 0;
        }

        // ----  Statistics --------
        // doing timing for tests in main loop
        // dt is time elepased in mainloop
        dt = loop_time - old_loop_time;
        old_loop_time = loop_time;

        // max and min detection within report intervalls
        if (dt > dtstat.max)dtstat.max = dt;
        if (dt < dtstat.min)dtstat.min = dt;
        dtstat.count++;
        dtstat.time = loop_time;

        // ---- HouseKeeping ----
        // Do status work every second.
        // for hardware debugging do this first.
        // Houskeeping Task splitted second task

        while ((loop_time - logical_time) >= TICKS_PER_SECOND) {
            // LED1 ... Tick is running in 1 sec
            logical_time += TICKS_PER_SECOND;

            //Loop running
            ACTIVE_LED ^= 0b1;

            switch (second_phase) {

                case 1:

                    // NETWORK_LED networkstatus
                    if (ethernet_mode) {
                        if (MACIsLinked()) {
#if defined(STACK_USE_DHCP_CLIENT)
                            if (!DHCPIsBound())
                                NETWORK_LED = OB_LED_OFF; // off
                            else
                                NETWORK_LED = OB_LED_ON; // on
#else
                            NETWORK_LED = OB_LED_ON; // Network active
#endif
                        }
                    }
                    break;

                case 2: // emergency off after EMERGENCY_OFFTIME seconds no data send
                    if (lastPlayedFet) {
                        last_playfettime = loop_time;
                        lastPlayedFet = 0;
                    }
                    if (loop_time < last_playfettime) // dirty warp arround
                        last_playfettime = (RHEA_TICK) 0;

                    if (loop_time - last_playfettime > EMERGENCY_OFFTIME * TICKS_PER_SECOND) {
                        ERROR_LED = OB_LED_ON;
                        clearPWMs();
                        last_playfettime = loop_time;
                    }
                    break;

                case 3:
                    // clean up work
                    ERROR_LED = OB_LED_OFF;
                    //ESCHERUDPSend(ESCHERUDP_DISCOVER_MESSAGE,NULL,0ul);
                    break;

                default: // start from 0
                    second_phase = 0;
                    break;
            } // switch second_phase

            second_phase++;
        } // every second status work

        // This task performs normal stack task including checking
        // for incoming packet, type of packet and calling
        // appropriate stack entity to process it.
        if (ethernet_mode)
            StackTask();

        TEST_PIN2_UNSET(); /* measure loop off before UDP */

        // This tasks invokes each of the core stack application tasks
        //StackApplications(); // we have only UDP below

        // process application tasks
        if (ethernet_mode)
            ESCHERUDPTask();

        // look for received data
        escherSerialTask();

        //		play_fetsTask(); //now in timer4 interrupt

        // If the DHCP lease has changed recently, send the new
        // IP address

#if defined(STACK_USE_DHCP_CLIENT)
        if (ethernet_mode) {
            if (DHCPBindCount != myDHCPBindCount) {
                myDHCPBindCount = DHCPBindCount;
                // announce here
            }
        }
#endif
    }
}

void sendStatistics(void) {
    if (ethernet_mode)
        ESCHERUDPSend(ESCHERUDP_STATISTICS, (BYTE *) & dtstat, sizeof (DT_STATISTIC));
    //				else
    //					SerialSend(...)

    // reset statistic				
    dtstat.count = 0;
    dtstat.max = 0;
    dtstat.min = 0x7FFFFFFF;
}

// Process IO controls here
//static void ProcessIO(void)
//{
// Convert potentiometer result into ASCII string
// Processes A/D data from the potentiometer
//    uitoa((WORD)ADC1BUF0, AN0String);
//}

/*********************************************************************
 * Function:        void ProcessTickInterrupt
 *
 * PreCondition:    Enable Timer 2 Interrupt and define TIMER_INTERRUPT_ESCHER
 *
 * Input:           Timer 2 counter
 *
 * Output:          None
 *
 * Side Effects:    If too long could block mainloop
 *
 * Overview:        realtime control of attacks, holds and releases
 *
 * Note:            to be done or superceeded by PWMs
 ********************************************************************/

#if defined(TIMER_INTERRUPT_ESCHER)

void ProcessIOInterrupt(DWORD t2) {

    // playfettask now direct in TIMER4 functions since subroutines calls are bad performance
    // operates on Timer4 Interrupt, which is
    // DO NOT USE Stackfunctions with time here

    // should be avoided since function calls in interrupt
    // waste lot of cpu time...
}
#endif

/*********************************************************************
 * Function:        void InitAppConfig(void)
 *
 * PreCondition:    MPFSInit() is already called.
 *
 * Input:           None
 *
 * Output:          Write/Read non-volatile config variables.
 *
 * Side Effects:    None
 *
 * Overview:        None
 *
 * Note:            ONLY for Ethernetmode, not called as slave
 ********************************************************************/

static ROM BYTE SerializedMACAddress[6] ={MY_DEFAULT_MAC_BYTE1, MY_DEFAULT_MAC_BYTE2, MY_DEFAULT_MAC_BYTE3,
    MY_DEFAULT_MAC_BYTE4, MY_DEFAULT_MAC_BYTE5, MY_DEFAULT_MAC_BYTE6};

static void InitAppConfig(void) {
#if (defined(MPFS_USE_EEPROM) || defined(MPFS_USE_SPI_FLASH)) && (defined(STACK_USE_MPFS) || defined(STACK_USE_MPFS2))
    BYTE c;
    BYTE *p;
#endif

    AppConfig.Flags.bIsDHCPEnabled = TRUE;
    AppConfig.Flags.bInConfigMode = TRUE;
    memcpypgm2ram((void*) &AppConfig.MyMACAddr, (ROM void*) SerializedMACAddress, sizeof (AppConfig.MyMACAddr));
    //	{
    //		_prog_addressT MACAddressAddress;
    //		MACAddressAddress.next = 0x157F8;
    //		_memcpy_p2d24((char*)&AppConfig.MyMACAddr, MACAddressAddress, sizeof(AppConfig.MyMACAddr));
    //	}
    AppConfig.MyIPAddr.Val = MY_DEFAULT_IP_ADDR_BYTE1 | MY_DEFAULT_IP_ADDR_BYTE2 << 8ul | MY_DEFAULT_IP_ADDR_BYTE3 << 16ul | MY_DEFAULT_IP_ADDR_BYTE4 << 24ul;
    AppConfig.DefaultIPAddr.Val = AppConfig.MyIPAddr.Val;
    AppConfig.MyMask.Val = MY_DEFAULT_MASK_BYTE1 | MY_DEFAULT_MASK_BYTE2 << 8ul | MY_DEFAULT_MASK_BYTE3 << 16ul | MY_DEFAULT_MASK_BYTE4 << 24ul;
    AppConfig.DefaultMask.Val = AppConfig.MyMask.Val;
    AppConfig.MyGateway.Val = MY_DEFAULT_GATE_BYTE1 | MY_DEFAULT_GATE_BYTE2 << 8ul | MY_DEFAULT_GATE_BYTE3 << 16ul | MY_DEFAULT_GATE_BYTE4 << 24ul;
    AppConfig.PrimaryDNSServer.Val = MY_DEFAULT_PRIMARY_DNS_BYTE1 | MY_DEFAULT_PRIMARY_DNS_BYTE2 << 8ul | MY_DEFAULT_PRIMARY_DNS_BYTE3 << 16ul | MY_DEFAULT_PRIMARY_DNS_BYTE4 << 24ul;
    AppConfig.SecondaryDNSServer.Val = MY_DEFAULT_SECONDARY_DNS_BYTE1 | MY_DEFAULT_SECONDARY_DNS_BYTE2 << 8ul | MY_DEFAULT_SECONDARY_DNS_BYTE3 << 16ul | MY_DEFAULT_SECONDARY_DNS_BYTE4 << 24ul;

    // Load the default NetBIOS Host Name
    memcpypgm2ram(AppConfig.NetBIOSName, (ROM void*) MY_DEFAULT_HOST_NAME, 16);
    FormatNetBIOSName(AppConfig.NetBIOSName);

#if defined(MPFS_USE_EEPROM) && (defined(STACK_USE_MPFS) || defined(STACK_USE_MPFS2))
    p = (BYTE*) & AppConfig;

    XEEBeginRead(0x0000);
    c = XEERead();
    XEEEndRead();

    // When a record is saved, first byte is written as 0x60 to indicate
    // that a valid record was saved.  Note that older stack versions 
    // used 0x57.  This change has been made to so old EEPROM contents
    // will get overwritten.  The AppConfig() structure has been changed,
    // resulting in parameter misalignment if still using old EEPROM
    // contents.
    if (c == 0x60u) {
        XEEBeginRead(0x0001);
        for (c = 0; c < sizeof (AppConfig); c++)
            *p++ = XEERead();
        XEEEndRead();
    } else
        SaveAppConfig();

#elif defined(MPFS_USE_SPI_FLASH) && (defined(STACK_USE_MPFS) || defined(STACK_USE_MPFS2))
    SPIFlashReadArray(0x00, &c, 1);
    if (c == 0x60u)
        SPIFlashReadArray(0x01, (BYTE*) & AppConfig, sizeof (AppConfig));
    else
        SaveAppConfig();
#endif
}