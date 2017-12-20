/**********************************************************************
*
* FileName:        enSecOsc.s
* Dependencies:    
* Processor:       dsPIC33Fxxxx/PIC24Hxxxx
* Adapted from Microchip Demo App
*
* REVISION HISTORY:
*~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
* Author            Date      Comments on this revision
*~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
* Settu D 	    03/15/06  First release of source file
* Winfried Ritsch   02/23/10  to use with TCP/IP stack
* further logs in git, svns
*~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
*
* ADDITIONAL NOTES:
*
**********************************************************************/
.ifdef __dsPIC33F
/* .include "p33Fxxxx.inc" */
.include "p33FJ128MC708A.inc"
.endif

.ifdef __PIC24H
.include "p24hxxxx.inc"
.endif
	
.global 	_enSecOsc
.section .text
/******************************************************************************
  Enable Secondary Osc
*******************************************************************************/
_enSecOsc:
		;OSCCONL(Low byte) Unlock Sequence
		mov 	#OSCCONL, w1
		mov.b 	#0x02, w0
		mov 	#0x46, w2
		mov 	#0x57, w3
		mov.b 	w2, [w1]
		mov.b 	w3, [w1]

		; Enable Sec Osc
		mov.b 	w0, [w1]
       	return
.end
	