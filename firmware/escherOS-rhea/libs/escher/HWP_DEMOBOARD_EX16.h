#if defined(DEMO_BOARD_XX)
#if defined(THIS_IS_STACK_APPLICATION)
	#if defined(__PIC24FJ256GB210__)
		// PIC24FJ256GB210 PIM
		_CONFIG3(ALTPMP_ALPMPDIS & SOSCSEL_EC); 										// PMP in default location, disable Timer1 oscillator so that RC13 can be used as a GPIO
		_CONFIG2(FNOSC_PRIPLL & POSCMOD_XT & IOL1WAY_OFF & PLL96MHZ_ON & PLLDIV_DIV2);	// Primary XT OSC with 96MHz PLL (8MHz crystal input), IOLOCK can be set and cleared
		_CONFIG1(FWDTEN_OFF & ICS_PGx2 & JTAGEN_OFF & ALTVREF_ALTVREDIS);				// Watchdog timer off, ICD debugging on PGEC2/PGED2 pins, JTAG off, AVREF and CVREF in default locations
	#elif defined(__PIC24FJ256GB110__)
		// PIC24FJ256GB110 PIM
		_CONFIG2(PLLDIV_DIV2 & PLL_96MHZ_ON & FNOSC_PRIPLL & IOL1WAY_OFF & POSCMOD_XT); // Primary XT OSC with 96MHz PLL (8MHz crystal input), IOLOCK can be set and cleared
		_CONFIG1(JTAGEN_OFF & ICS_PGx2 & FWDTEN_OFF);									// Watchdog timer off, ICD debugging on PGEC2/PGED2 pins, JTAG off
	#elif defined(__PIC24FJ256GA110__)
		// PIC24FJ256GA110 PIM
		_CONFIG2(FNOSC_PRIPLL & IOL1WAY_OFF & POSCMOD_XT);	// Primary XT OSC with PLL, IOLOCK can be set and cleared
		_CONFIG1(JTAGEN_OFF & ICS_PGx2 & FWDTEN_OFF);		// Watchdog timer off, ICD debugging on PGEC2/PGED2 pins, JTAG off
	#elif defined(__PIC24F__)
		// All other PIC24F PIMs
		_CONFIG2(FNOSC_PRIPLL & POSCMOD_XT)		// Primary XT OSC with 4x PLL
		_CONFIG1(JTAGEN_OFF & FWDTEN_OFF)		// JTAG off, watchdog timer off
	#elif defined(__dsPIC33F__) || defined(__PIC24H__) || defined(__dsPIC33E__)|| defined(__PIC24E__)
		// All dsPIC33F and PIC24H PIMs
		_FOSCSEL(FNOSC_PRIPLL)			// PLL enabled
		_FOSC(OSCIOFNC_OFF & POSCMD_XT)	// XT Osc
		_FWDT(FWDTEN_OFF)				// Disable Watchdog timer
		// JTAG should be disabled as well
	#endif
#endif
#endif

#if ! defined(GetSystemClock)
// Clock frequency values
// Create a PIC dependant macro for the maximum supported internal clock
#if defined(__PIC24F__) || defined(__PIC24FK__)
	#define MAXIMUM_PIC_FREQ		(32000000ul)
#else	// dsPIC33F, PIC24H
	#define MAXIMUM_PIC_FREQ		(80000000ul)
#endif

// These directly influence timed events using the Tick module.  They also are used for UART and SPI baud rate generation.
#define GetSystemClock()	(MAXIMUM_PIC_FREQ)			// Hz
#define GetInstructionClock()	(GetSystemClock()/2)	// Normally GetSystemClock()/4 for PIC18, GetSystemClock()/2 for PIC24/dsPIC, and GetSystemClock()/1 for PIC32.  Might need changing if using Doze modes.
#define GetPeripheralClock()	(GetSystemClock()/2)	// Normally GetSystemClock()/4 for PIC18, GetSystemClock()/2 for PIC24/dsPIC, and GetSystemClock()/1 for PIC32.  Divisor may be different if using a PIC32 since it's configurable.
#endif

// if not defined in escherBoard then define here for other EX16 boards
#if ! defined(ENC_CS_TRIS)
// ENC28J60 I/O pins
#if defined(__PIC24FJ256GA110__) || defined(__dsPIC33E__)|| defined(__PIC24E__)	// PIC24FJ256GA110 must place the ENC28J60 on SPI2 because PIC rev A3 SCK1 output pin is a PPS input only (fixed on A5, but demos use SPI2 for simplicity)
	#define ENC_CS_TRIS			(TRISFbits.TRISF12)	// Comment this line out if you are using the ENC424J600/624J600, MRF24WB0M, or other network controller.
	#define ENC_CS_IO			(LATFbits.LATF12)
	// SPI SCK, SDI, SDO pins are automatically controlled by the
	// PIC24/dsPIC SPI module
	#define ENC_SPI_IF			(IFS2bits.SPI2IF)
	#define ENC_SSPBUF			(SPI2BUF)
	#define ENC_SPISTAT			(SPI2STAT)
	#define ENC_SPISTATbits		(SPI2STATbits)
	#define ENC_SPICON1			(SPI2CON1)
	#define ENC_SPICON1bits		(SPI2CON1bits)
	#define ENC_SPICON2			(SPI2CON2)
#else	// SPI1 for all other processors
	#define ENC_CS_TRIS			(TRISDbits.TRISD14)	// Comment this line out if you are using the ENC424J600/624J600, MRF24WB0M, or other network controller.
	#define ENC_CS_IO			(LATDbits.LATD14)
	// SPI SCK, SDI, SDO pins are automatically controlled by the
	// PIC24/dsPIC SPI module
	#define ENC_SPI_IF			(IFS0bits.SPI1IF)
	#define ENC_SSPBUF			(SPI1BUF)
	#define ENC_SPISTAT			(SPI1STAT)
	#define ENC_SPISTATbits		(SPI1STATbits)
	#define ENC_SPICON1			(SPI1CON1)
	#define ENC_SPICON1bits		(SPI1CON1bits)
	#define ENC_SPICON2			(SPI1CON2)
#endif
#endif
