; Reset und Interrupt Routinen
; (c) IEM 2002


; ---- RESET --------- 

	org 0x000
RESET		 	; start at reset vector
	NOP		; for debugger
	goto Start

; ----- INTERRUPT ---------
	org 0x004		; --- Interrupt service routine

Int
	movwf  _w                ; -- Save the Context Registers
	movf   STATUS, w
	bcf    STATUS, RP0       ;  Change to Bank 0
	bcf    STATUS, RP1
	movwf  _status
	movf   FSR, w
	movwf  _fsr
;	movf   PCLATH, w	; only need if code > 1 Page
;	movwf  _pclath		
;	clrf   PCLATH

				; -- Service here
;	btfsc	INTCON, RBIF 	; do we have no Tim Interrupt
;	goto	IntTim    	; no -> IntTim

	btfss	INTCON, T0IF 	; do we have a Timer Interrupt
	goto	IntEnd    	; no -> EndofInt

	bcf	INTCON,	T0IF 	; Timer-Int register clear
	movlw	TMR0_LOAD	; start timer again
	movwf	TMR0


;--- timer

time_tick 	;-> 0.1ms
	decfsz	timecount0, f  	; count timer
	goto time_end		; notreached -> end
	
time_unit	; 0.1x256ms=25,6ms

	bcf	REL0	; DEBUG

time_ton1
	movfw	pulswidth1 	; attackwidth
	movwf	puls1		; lade puls

	btfss	ton1, ON_BIT	; wenn not on
	goto	time_ton2       ; -> weiter

	decfsz	toncount1, f	; tondauer nicht erreicht
	goto	time_ton2	; -> nowtime
	bcf	ton1,ON_BIT

time_ton2

;---------- tone ready


	decfsz	timecount1,f 	; notenneuanschlag
	goto	time_end	

time_notes	; 25,6msx80 ~ 2sec

	incf	pulswidth1, f	; pulswidth erhöhen um eins !
	incf	pulswidth1, f	; pulswidth erhöhen um eins !
	incf	pulswidth1, f	; pulswidth erhöhen um eins !
	incf	pulswidth1, f	; pulswidth erhöhen um eins !

	movlw	80	
	movwf	timecount1

	movlw	60		; ton 1sec
	movwf	toncount1

	bsf	ton1, ON_BIT	; ton plus anschlag einschalten
	bsf	ton1,PULS_BIT
	bsf	REL1

	bsf	REL0 ; debug


time_end
	; debug out ---
;	movlw	1		; toggle RC0
;	xorwf	PORTC, f
;	bcf	REL0
;	btfsc	HALTEBIT
;	bsf	REL0

	; ---

playton1
	btfss	ton1,ON_BIT	;if to
	goto	ton1_off

	btfss	ton1,PULS_BIT  ; if not puls1 on
	goto	puls1_halte
	decfsz	puls1,f	 ; count if zero
	goto	playton2 ; clear to null
puls1_off
	bcf	REL1
	bcf	ton1, PULS_BIT	

puls1_halte	
	bcf	REL1
	btfsc	HALTEBIT
	bsf	REL1
	goto    playton2

ton1_off
	bcf	REL1

playton2

;	btfsc 	INTCON, INTF	; kein Button Interrupt ?
;	goto 	IntSwitch	; -> nein service button

IntEnd				; -- Restore the Context Registers

	decfsz	haltepuls, f
	goto	haltebit_low

	bcf	HALTEBIT
	
	movlw	haltedauer
	movwf	haltepuls

halte_end
;	movf   _pclath, w	; only need if code > 1 Page
;	movwf  PCLATH
	movf   _fsr, w
	movwf  FSR
	movf   _status, w
	movwf  STATUS
	swapf	_w, f
	swapf   _w, w
	retfie


;----------------------- for later use 

IntSwitch			; -- debounce and write in var

	bcf	INTCON,	INTF 		; RB0/Int register clear

	btfsc 	BUT_PIN		; RB0 is low (button down)
	goto	ButUp		; -> nein button up

	movlw 	0x01
	xorwf	button,f

;	btfsc	LED1
;	goto 	LED1Off
;	bsf	LED1

ButUp
	goto	IntEnd

LED1Off	bcf	LED1
	goto	IntEnd


IntTim
	movfw	PORTB
	bcf	INTCON,	RBIF	; RB4:7/Int register clear

;	btfsc 	TIM_PIN		; RB5 is low (button down)
;	goto	TimUp		; -> nein timer up

;	bcf	LED0
	goto	IntEnd

TimUp
	bsf	LED0
	goto	IntEnd

;-------------- puls_offs

haltebit_low
	bsf	HALTEBIT
	goto halte_end
