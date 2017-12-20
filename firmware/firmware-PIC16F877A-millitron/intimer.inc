; autoklavier
; algo 2003
; now adapted for 2004

; ----- INTERRUPT ---------
Int
	movwf  _w                ; -- Save the Context Registers
	movf   STATUS, w
	bcf    STATUS, RP0       ;  Change to Bank 0
	bcf    STATUS, RP1
	movwf  _status
	movf   FSR, w
	movwf  _fsr
;	movf   PCLATH, w	; only need if code > 1 Page (2048)
;	movwf  _pclath		
;	clrf   PCLATH



; --------- interrupt dispatcher ---------------
; --- first serial interrupt, because its more often

int_serial_rx
	btfss	PIR1,RCIF	; test if serial receive irq
    goto    int_timer   ; nope check next

; ----------- rx irq ------------------------------
	call SerialIn

; ----------- Timer Intterrupt --------------------

int_timer
	btfss	INTCON, T0IF ; do we have a Timer Interrupt
	goto	IntEnd    	 ; no -> EndofInt

	bcf	INTCON,	T0IF 	 ; Timer-Int register clear
	movlw	TMR0_LOAD	 ; start timer again
	movwf	TMR0

; ---- debug out on REL0 ist 20MHz takt ---
	SDEBUGPIN

; --------- Zeit --------------
;  bei 20Khz timer :
;  1000/4 = 256 Befehle max !!!!
;  main programm:  noch 10 befehle bei 20Khz + interrupt -> 240
;  10 pro note

; ------- do haltepuls - old now secon relais
;   bcf	  STATUS, C             ;  5-6
;   btfsc  haltepuls2, 7
;   bsf   STATUS, C
;   rlf    haltepuls0, f
;   rlf    haltepuls1, f
;   rlf    haltepuls2, f
;

; ---- debug ausgang
;   btfsc  puls0, n_onbit  ; 3 Befehle
;   goto   $+3
;   bcf    DEBUGPIN1
;   goto   $+2
;   bsf    DEBUGPIN1

; ------------ FAST LOOP ---------------
; -------------- noten halten ----------

;   halte_note note0, 0
;   halte_note note1, 2
;   halte_note note2, 4
;   halte_note note3, 6
;   halte_note note4, 8
;   halte_note note5, 10
;   halte_note note6, 12
;   halte_note note7, 14
;   halte_note note8, 16
;   halte_note note9, 18
;   halte_note note10, 20
;   halte_note note11, 22
;   halte_note note12, 24
;   halte_note note13, 26
;   halte_note note14, 28
;   halte_note note15, 30
;   halte_note note16, 32
;   halte_note note17, 34
;   halte_note note18, 36
;   halte_note note19, 38
;   halte_note note20, 40
;   halte_note note21, 42
;   halte_note note22, 44
;   halte_note note23, 46
; 
; ----------------- Prescale -----------------
pre_tick 	; / 8 => 0.4ms
  decfsz	precount, f  	; count timer
  goto time_end		; notreached -> end

  movlw   PRE_COUNT   
  movwf   precount  
; ----------------------------------------

; --------------- note spielen ------------------------
; ein -> setze pulswert und dann n_neubit
; aus -> loesche n_onbit
     play_note note0, puls0, 0
     play_note note1, puls1, 4
     play_note note2, puls2, 8
     play_note note3, puls3, 12
     play_note note4, puls4, 16
     play_note note5, puls5, 20
     play_note note6, puls6, 24
     play_note note7, puls7, 28
     play_note note8, puls8, 32
     play_note note9, puls9, 36
     play_note note10, puls10, 40
     play_note note11, puls11, 44
;     play_note note12, puls12, 48
;     play_note note13, puls13, 26
;     play_note note14, puls14, 28
;     play_note note15, puls15, 30
;     play_note note16, puls16, 32
;     play_note note17, puls17, 34
;     play_note note18, puls18, 36
;     play_note note19, puls19, 38
;     play_note note20, puls20, 40
;     play_note note21, puls21, 42
;     play_note note22, puls22, 44
;     play_note note23, puls23, 46

;--- timer
time_tick 	;  0.4ms *256 = 102,4ms
	decfsz	timecount0, f  	; count timer
	goto time_end		; notreached -> end
	
  
; -------------- DEBUG relais 4 dauertest ------------
;    btfss   timecount1,4
;    goto      $+2
;    bcf REL11    
;    btfsc   timecount1,1
;    goto $+2
;    bsf REL11 
; ------------------------------------------------------

; ---------- Save off wenn no life bit -----------------
time_unit	

	decfsz	timecount1, f ; count timer 102,4ms * 256 = 26,2144 sec
	goto time_end		  ; notreached -> end
    ; --- do some --- noteonoffs her
    btfss LIVEBIT
    call all_notes_off
    bcf  LIVEBIT
; ------------------------------------------------------

time_end


IntEnd				; -- Restore the Context Registers
; ---- debug out on REL0 ist 20MHz takt ---
	CDEBUGPIN1

;	movf   _pclath, w	; only need if code > 1 Page
;	movwf  PCLATH
	movf   _fsr, w
	movwf  FSR
	movf   _status, w
	movwf  STATUS
	swapf	_w, f
	swapf   _w, w

	retfie
;	return

