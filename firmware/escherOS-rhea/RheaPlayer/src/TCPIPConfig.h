/*********************************************************************
 *
 *	Microchip TCP/IP Stack Rhea Application Configuration Header 
 *  for Escher Board adapted from Demo TCP/IP Stack Ref: AN833 
 *
 *********************************************************************
 * FileName:        TCPIPConfig.h
 * Dependencies:    Microchip TCP/IP Stack
 * Processor:       dsPIC33F, PIC32
 * Company:         Algorythmics
 *
 * Software License Agreement
 *
 * see License of Microchip TCP/IP Stack 
 * for use only with Escher Board with dsPIC33FJ128MC708
 *
 * Author               Date        Comment
 *~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
 * Howard Schlunder		10/04/2006	Original
 * Winfried Ritsch      23/02/2010  Modified for Escher
 * further logs in svn or gits
 ********************************************************************/
#ifndef __TCPIPCONFIG_H
#define __TCPIPCONFIG_H

//#include "TCPIP Stack/TCPIP.h"

// =======================================================================
//   Application Options
// =======================================================================

/* Application Level Module Selection
 *   Uncomment or comment the following lines to enable or
 *   disabled the following high-level application modules.
 */
//#define STACK_USE_UART				// Application demo using UART for IP address display and stack configuration
//#define STACK_USE_UART2TCP_BRIDGE		// UART to TCP Bridge application example
//#define STACK_USE_IP_GLEANING
//#define STACK_USE_ICMP_SERVER
#define STACK_USE_ICMP_CLIENT
//#define STACK_USE_HTTP_SERVER			// Old HTTP server
//#define STACK_USE_HTTP2_SERVER			// New HTTP server with POST, Cookies, Authentication, etc.
//#define STACK_USE_SSL_SERVER			// SSL server socket support (Requires SW300052)
//#define STACK_USE_SSL_CLIENT			// SSL client socket support (Requires SW300052)

//#define STACK_USE_DHCP_CLIENT

//#define STACK_USE_DHCP_SERVER
//#define STACK_USE_FTP_SERVER
//#define STACK_USE_SMTP_CLIENT
//#define STACK_USE_SNMP_SERVER
//#define STACK_USE_TFTP_CLIENT
//#define STACK_USE_GENERIC_TCP_CLIENT_EXAMPLE	// HTTP Client example in GenericTCPClient.c
//#define STACK_USE_GENERIC_TCP_SERVER_EXAMPLE	// ToUpper server example in GenericTCPServer.c
//#define STACK_USE_TELNET_SERVER			// Telnet server
// #define STACK_USE_ANNOUNCE				// Microchip Embedded Ethernet Device Discoverer server/client
//#define STACK_USE_DNS					// Domain Name Service Client
//#define STACK_USE_NBNS					// NetBIOS Name Service Server
//#define STACK_USE_REBOOT_SERVER			// Module for resetting this PIC remotely.  Primarily useful for a Bootloader.
//#define STACK_USE_SNTP_CLIENT			// Simple Network Time Protocol for obtaining current date/time from Internet
//#define STACK_USE_UDP_PERFORMANCE_TEST	// Module for testing UDP TX performance characteristics.  NOTE: Enabling this will cause a huge amount of UDP broadcast packets to flood your network on various ports.  Use care when enabling this on production networks, especially with VPNs (could tunnel broadcast traffic across a limited bandwidth connection).
//#define STACK_USE_TCP_PERFORMANCE_TEST	// Module for testing TCP TX performance characteristics
//#define STACK_USE_DYNAMICDNS_CLIENT		// Dynamic DNS client module
//#define STACK_USE_BERKELEY_API			// Berekely Sockets APIs are used


// =======================================================================
//   Data Storage Options
// =======================================================================

/* MPFS Configuration
 *   MPFS is automatically included when required for other 
 *   applications.  If your custom application requires it 
 *   otherwise, uncomment the appropriate selection.
 */
//#define STACK_USE_MPFS
//#define STACK_USE_MPFS2

/* MPFS Storage Location
 *   If html pages are stored in internal program memory,
 *   comment both MPFS_USE_EEPROM and MPFS_USE_SPI_FLASH, then
 *   include an MPFS image (.c or .s file) in the project.  
 *   If html pages are stored in external memory, uncomment the 
 *   appropriate definition.
 *
 *   Supported serial flash parts include the SST25VFxxxB series.
 */
//#define MPFS_USE_EEPROM
//#define MPFS_USE_SPI_FLASH

/* EEPROM Addressing Selection
 *   If using the 1Mbit EEPROM, uncomment this line
 */
//#define USE_EEPROM_25LC1024

/* EEPROM Reserved Area
 *   Number of EEPROM bytes to be reserved before MPFS storage starts.
 *   These bytes host application configurations such as IP Address,
 *   MAC Address, and any other required variables.
 *
 *   For MPFS Classic, this setting must match the Reserved setting
 *	 on the Advanced Settings page of the MPFS2 Utility.
 */
#define MPFS_RESERVE_BLOCK              (64ul)

/* MPFS File Handles
 *   Maximum number of simultaneously open MPFS2 files.
 *   For MPFS Classic, this has no effect.
 */
#define MAX_MPFS_HANDLES				(7ul)


// =======================================================================
//   Network Addressing Options
// =======================================================================

/* Default Network Configuration
 *   These settings are only used if data is not found in EEPROM.
 *   To clear EEPROM, hold BUTTON0, reset the board, and continue
 *   holding until the LEDs flash.  Release, and reset again.
 */

/* board ID is (hand-)written on the escher board 
   so this should a unique should be used */

#ifndef MY_BOARD_ID 
 #warning "No Board ID are set for TCP/IP in project, using default 0x01 ESCHER001"
 #define MY_BOARD_ID						(0x01)
 #define MY_DEFAULT_HOST_NAME			"ESCHER001"
#endif

#define MY_DEFAULT_MAC_BYTE1            (0x02)
#define MY_DEFAULT_MAC_BYTE2            (0x00)
#define MY_DEFAULT_MAC_BYTE3            (0x00)
#define MY_DEFAULT_MAC_BYTE4            (0x01)
#define MY_DEFAULT_MAC_BYTE5            (0x00)
#define MY_DEFAULT_MAC_BYTE6            MY_BOARD_ID

/* Hardcoded IP Address since no need to have DHCP or so,... meanwhile
   and can be overwritten when DHCP is used */

#define MY_DEFAULT_IP_ADDR_BYTE1        (192ul)
#define MY_DEFAULT_IP_ADDR_BYTE2        (168ul)
#define MY_DEFAULT_IP_ADDR_BYTE3        (10ul)
#define MY_DEFAULT_IP_ADDR_BYTE4        (128ul+MY_BOARD_ID)

#define MY_DEFAULT_MASK_BYTE1           (255ul)
#define MY_DEFAULT_MASK_BYTE2           (255ul)
#define MY_DEFAULT_MASK_BYTE3           (255ul)
#define MY_DEFAULT_MASK_BYTE4           (0ul)

#define MY_DEFAULT_GATE_BYTE1           (192ul)
#define MY_DEFAULT_GATE_BYTE2           (168ul)
#define MY_DEFAULT_GATE_BYTE3           (10ul)
#define MY_DEFAULT_GATE_BYTE4           (10ul)

#define MY_DEFAULT_PRIMARY_DNS_BYTE1	(192ul)
#define MY_DEFAULT_PRIMARY_DNS_BYTE2	(168ul)
#define MY_DEFAULT_PRIMARY_DNS_BYTE3	(10ul)
#define MY_DEFAULT_PRIMARY_DNS_BYTE4	(10ul)

#define MY_DEFAULT_SECONDARY_DNS_BYTE1	(192ul)
#define MY_DEFAULT_SECONDARY_DNS_BYTE2	(168ul)
#define MY_DEFAULT_SECONDARY_DNS_BYTE3	(10ul)
#define MY_DEFAULT_SECONDARY_DNS_BYTE4	(11ul)


// =======================================================================
//   Transport Layer Options
// =======================================================================

/* Transport Layer Configuration
 *   The following low level modules are automatically enabled
 *   based on module selections above.  If your custom module
 *   requires them otherwise, enable them here.
 */
/*#define STACK_USE_TCP */
#define STACK_USE_UDP

/* Client Mode Configuration
 *   Uncomment following line if this stack will be used in CLIENT
 *   mode.  In CLIENT mode, some functions specific to client operation
 *   are enabled.
 */
//#define STACK_CLIENT_MODE

/* TCP Socket Memory Allocation
 *   TCP needs memory to buffer incoming and outgoing data.  The 
 *   amount and medium of storage can be allocated on a per-socket
 *   basis using the example below as a guide.
 */
	// Allocate how much total RAM (in bytes) you want to allocate 
	// for use by your TCP TCBs, RX FIFOs, and TX FIFOs.  
	#define TCP_ETH_RAM_SIZE					(1110ul)
	#define TCP_PIC_RAM_SIZE					(0ul)
	#define TCP_SPI_RAM_SIZE					(0ul)
	#define TCP_SPI_RAM_BASE_ADDRESS			(0x00)
	
	// Define names of socket types
	#define TCP_SOCKET_TYPES
		#define TCP_PURPOSE_GENERIC_TCP_CLIENT 0
		#define TCP_PURPOSE_GENERIC_TCP_SERVER 1
		#define TCP_PURPOSE_TELNET 2
		#define TCP_PURPOSE_FTP_COMMAND 3
		#define TCP_PURPOSE_FTP_DATA 4
		#define TCP_PURPOSE_TCP_PERFORMANCE_TX 5
		#define TCP_PURPOSE_TCP_PERFORMANCE_RX 6
		#define TCP_PURPOSE_UART_2_TCP_BRIDGE 7
		#define TCP_PURPOSE_HTTP_SERVER 8
		#define TCP_PURPOSE_DEFAULT 9
		#define TCP_PURPOSE_BERKELEY_SERVER 10
		#define TCP_PURPOSE_BERKELEY_CLIENT 11
	#define END_OF_TCP_SOCKET_TYPES
	
	#if defined(__TCP_C)
		// Define what types of sockets are needed, how many of 
		// each to include, where their TCB, TX FIFO, and RX FIFO
		// should be stored, and how big the RX and TX FIFOs should 
		// be.  Making this initializer bigger or smaller defines 
		// how many total TCP sockets are available.
		//
		// Each socket requires up to 48 bytes of PIC RAM and 
		// 40+(TX FIFO size)+(RX FIFO size) bytes bytes of 
		// TCP_*_RAM each.
		// Note: The RX FIFO must be at least 1 byte in order to 
		// receive SYN and FIN messages required by TCP.  The TX 
		// FIFO can be zero if desired.
		#define TCP_CONFIGURATION
		ROM struct
		{
			BYTE vSocketPurpose;
			BYTE vMemoryMedium;
			WORD wTXBufferSize;
			WORD wRXBufferSize;
		} TCPSocketInitializer[] = 
		{
			//{TCP_PURPOSE_GENERIC_TCP_CLIENT, TCP_ETH_RAM, 125, 100},
			//{TCP_PURPOSE_GENERIC_TCP_SERVER, TCP_ETH_RAM, 20, 20},
			{TCP_PURPOSE_TELNET, TCP_ETH_RAM, 150, 20},
			//{TCP_PURPOSE_FTP_COMMAND, TCP_ETH_RAM, 100, 40},
			//{TCP_PURPOSE_FTP_DATA, TCP_ETH_RAM, 0, 128},
			//{TCP_PURPOSE_TCP_PERFORMANCE_TX, TCP_ETH_RAM, 256, 1},
			//{TCP_PURPOSE_TCP_PERFORMANCE_RX, TCP_ETH_RAM, 40, 360},
			//{TCP_PURPOSE_UART_2_TCP_BRIDGE, TCP_ETH_RAM, 256, 256},
			//{TCP_PURPOSE_HTTP_SERVER, TCP_ETH_RAM, 200, 200},
			{TCP_PURPOSE_DEFAULT, TCP_ETH_RAM, 200, 200},
			{TCP_PURPOSE_BERKELEY_SERVER, TCP_ETH_RAM, 25, 20},
			//{TCP_PURPOSE_BERKELEY_CLIENT, TCP_ETH_RAM, 125, 100},
		};
		#define END_OF_TCP_CONFIGURATION
	#endif

/* UDP Socket Configuration
 *   Define the maximum number of available UDP Sockets, and whether
 *   or not to include a checksum on packets being transmitted.
 */
#define MAX_UDP_SOCKETS     (10u)
//#define UDP_USE_TX_CHECKSUM		// This slows UDP TX performance by nearly 50%


/* Berkeley API Sockets Configuration
 *   Note that each Berkeley socket internally uses one TCP or UDP socket 
 *   defined by MAX_UDP_SOCKETS and the TCPSocketInitializer[] array.  
 *   Therefore, this number MUST be less than or equal to MAX_UDP_SOCKETS + the 
 *   number of TCP sockets defined by the TCPSocketInitializer[] array 
 *   (i.e. sizeof(TCPSocketInitializer)/sizeof(TCPSocketInitializer[0])).
 *   This define has no effect if STACK_USE_BERKELEY_API is not defined and 
 *   Berkeley Sockets are disabled.  Set this value as low as your application 
 *   requires to avoid waisting RAM.
 */
#define BSD_SOCKET_COUNT (0u)


// =======================================================================
//   Application-Specific Options
// =======================================================================

// -- HTTP2 Server options -----------------------------------------------

	// Maximum numbers of simultaneous HTTP connections allowed.
	// Each connection consumes 2 bytes of RAM and a TCP socket
	#define MAX_HTTP_CONNECTIONS	(2u)
	
	// Indicate what file to serve when no specific one is requested
	#define HTTP_DEFAULT_FILE		"index.htm"
	#define HTTPS_DEFAULT_FILE		"index.htm"
	#define HTTP_DEFAULT_LEN		(10u)			// For buffer overrun protection.
												// Set to longest length of above two strings.
	
	// Configure MPFS over HTTP updating
	// Comment this line to disable updating via HTTP
	#define HTTP_MPFS_UPLOAD		"mpfsupload"
	//#define HTTP_MPFS_UPLOAD_REQUIRES_AUTH	// Require password for MPFS uploads
		// Certain firewall and router combinations cause the MPFS2 Utility to fail 
		// when uploading.  If this happens, comment out this definition.
	
	// Define which HTTP modules to use
	// If not using a specific module, comment it to save resources
	#define HTTP_USE_POST					// Enable POST support
	#define HTTP_USE_COOKIES				// Enable cookie support
	#define HTTP_USE_AUTHENTICATION			// Enable basic authentication support
	
	//#define HTTP_NO_AUTH_WITHOUT_SSL		// Uncomment to require SSL before requesting a password
	#define HTTP_SSL_ONLY_CHAR		(0xFF)	// Files beginning with this character will only be served over HTTPS
											// Set to 0x00 to require for all files
											// Set to 0xff to require for no files

	#define STACK_USE_HTTP_APP_RECONFIG		// Use the AppConfig web page in the Demo App (~2.5kb ROM, ~0b RAM)
	#define STACK_USE_HTTP_MD5_DEMO			// Use the MD5 Demo web page (~5kb ROM, ~160b RAM)
	//#define STACK_USE_HTTP_EMAIL_DEMO		// Use the e-mail demo web page

// -- SSL Options --------------------------------------------------------

	#define MAX_SSL_CONNECTIONS		(2ul)	// Maximum connections via SSL
	#define MAX_SSL_SESSIONS		(2ul)	// Max # of cached SSL sessions
	#define MAX_SSL_BUFFERS			(4ul)	// Max # of SSL buffers (2 per socket)
	#define MAX_SSL_HASHES			(5ul)	// Max # of SSL hashes  (2 per, plus 1 to avoid deadlock)
	
	#define SSL_RSA_KEY_SIZE		(512ul)	// bits in SSL RSA key


// -- SNMP Options -------------------------------------------------------

	// Comment following line if SNMP TRAP support is needed
	//#define SNMP_TRAP_DISABLED
#endif
