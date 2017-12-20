; Autoklavierspieler für relais
;  MACROS

; ------------ in interrupt haltepuls spielen ---------

halte_note macro note, index2
  movlw  index2
  btfss  note, n_haltebit
  goto   $+6     ; nicht haltemode next
  btfsc  haltepuls0,haltebit  ; 2+ Befehle
  goto   $+3
  call   ClearPort2           ; 4 befehle
  goto   $+2
  call   SetPort2             ; 4 Befehle
 endm                         ; = 6

; ---------- Noten spielen ---------
play_note macro note, puls, index

	movlw	index            ; 1 relais 1
   
	btfss	note, n_onbit	 ; 2 note ein ?
	goto	$+8              ; 3 pnoteneu -> nein weiter

    decfsz  puls, f          ; 4 decrement anschlag
    goto    $+11             ; 5 pnoteend   

    bcf    note, n_onbit     ; 6

    call    SetPort2         ; 7 Haltebuz on
	addlw   2                ; 8 next relais
    call    ClearPort2       ; 9 Attack off
    
    ; set note +1

    goto   $+7 ; pnoteend    ; 10

;pnoteneu
    btfss  note, n_neubit    ; 11
    goto   $+5 ; pnoteend    ; 12

    bsf    note, n_onbit     ; 13
    bcf    note, n_neubit    ; 14

	addlw   2                ; 15 next relais

    call   SetPort2          ; 16
; pnoteend
    endm                     ; min 3 max 9

; ------------- tasten indizierung

tastenr_to_fsr macro Var
	movfw   tastennr
    movwf   FSR
	decf	FSR, f          ; 1-24 -> 0-23
    bcf     STATUS,C        ; * 2
    rlf     FSR, f
    movlw   LOW Var         ; Puls0 adresse 
 	addwf	FSR, f          ; hinzuaddieren
    endm

w_to_fsr macro Var
    movwf   FSR
;	decf	FSR, f          ; 0-23
    bcf     STATUS,C        ; * 2
    rlf     FSR, f
    movlw   LOW Var         ; Puls0 adresse 
 	addwf	FSR, f          ; hinzuaddieren
    endm


; ------------- Interrupt helps

;	DISABLE_IRQ disable global irq 

disable_irq MACRO
	LOCAL	stop_int
stop_int	BCF	INTCON,GIE	    ; disable global interrupt
			BTFSC	INTCON,GIE	; check if disabled 
			GOTO	stop_int	; nope, try again
	ENDM
	

;	ENABLE_IRQ enable global irq 

enable_irq MACRO
	BSF	INTCON,GIE	; enable global interrupt
	ENDM
