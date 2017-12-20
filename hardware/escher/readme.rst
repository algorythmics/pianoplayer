escher 1.0 - Microchip dsPIC33F and 10MBit Ethernet based board
===============================================================

algorythmics 6.5.2008, winfried ritsch (see changelog in svn for more)

:board development, design and first production:  Michael Klamminger

:Version: $Revision: 1.0. 1.1

For more info see at [algo_escher]_ 

main features
-------------

- Ethernet Interface with microchip Ethernet controller [ENC28J60]_ 

- 80 Pin [dsPIC33]_ , 16-bit (data) modified Harvard RISC machine
  or [PIC32]_ with MIPS32® M4K® [MIPS32]_ core (PIN-compatible) 

- first implementation with motor control dsPIC33F128MC708 [MC708]_ 

- optional 3.3V and 5V power-supply with on board or external regulators

- 2x18 I/Os on flexible 40Pin Connectors for external addon boards + 
  12 i/Os for communication on 16PIN connector

- In Circuit Programming/Debugging (ICSP)

- Crystal and realtime RC-oscillator

- 1 Power LED+ 4 I/O LEDs + LEDs on Ethernet for status and debugging

- SD-Card Connector on SPI

Contents:
---------

board
	eagle board data
	
doc
	collection of documentation on some features
	
figures
	figures, schematics, as images
	
production
	some documentation on production

.. [algo_escher] homepage: http://algo.mur.at/projects/microcontroller/escher/

.. [ENC28J60] http://www.microchip.com/wwwproducts/Devices.aspx?dDocName=en022889

.. [dsPIC33] http://www.microchip.com/en_US/family/16bit/architecture/dsPIC33F.html

.. [PIC32] http://www.microchip.com/en_US/family/32bit/

.. [MC708] http://www.microchip.com/wwwproducts/Devices.aspx?dDocName=en541863

.. [MIPS32] http://mips.com/products/cores/32-64-bit-cores/mips32-m4k/
