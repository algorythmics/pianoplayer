Readme for the Rhea EscherOS Development
========================================

Idea is to control the Autopianoplayer Rhea and maybe its
further descents with one or more Escher connected to EscherFetBoards.

:Author: Winfried Ritsch
:Date: 22.2.2010+
:Revision: see rhea.h

26.2.2010: Updated to Version 5.20b of TCP/IP Stack
7.7.2016: added doubling of escher boards for individual holds

Overview
--------

Based on Microchips TCP/IP Stack, control is done over UDP using
the Ethernet stack.

Dependency:  

  escher lib: library handling basics of escher.

As a first approach just a kind of Stateless Binary data is used and should be replaced by OSC
in future.

Structure
  Using TCP/IP Stack from Microchip
  - Timer1 for internal Tick of TCP/IP Stack and internal timing
  - Timer2 used for OC-Output
  - Timer2 runs at 100kHz so 10ns is resolution for noteplay
  - Timer3
  - Timer4
  
Testing:

 #define TEST_PINS in rhea.h
 TEST_PIN1 will output a puls between interrupt start and end
 routine, to see how much load it does

 TEST_PIN2 is assignable for debugging, 
   e.g. main loop can be toggled

Network definitions:

  The IP Address can be compiled fixed or for DHCP
  Normally fixed ones are used on autopianoplayer
  This should change in future

  The Protocol for receiving is fixed in escherUDP.h:

    PLAY: 32 Bit Tick, number note, velo 16 Bit

  For now a UDP Socket on 6001 is opened and it sends
  a discovery Message with MAC Address and IP as a broadcast
  until a message is received. Then this destination address 
  is used for reports and UPDouts.

  Discovery Message is repeated every 10 sec if no 
  data is received.
  
  
configuration options
---------------------


Logic of configuration:

local in project Rheaplayer:
 HarwareProfile.h includes "escherBoard.h"
 escher_config.h  defines all the board specific data 
 rhea.h is included in all local files after escher_config.h
 
 TCPIPConfig.h includes, nothing but HardwareProfile.h is included in Stack modules before

for all escher boards_
 escherBoard.h    includes "escher_config.h", "HWP_escher1Board.h"
 HWP_escher1Board.h includes all the PIN definition of escher1 board
