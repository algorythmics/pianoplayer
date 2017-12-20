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

	movlw	index             ; 1 relais 1
   
	btfss	note, n_onbit	  ; 2 note ein ?
	goto	$+11              ; 3 pnoteneu -> nein weiter

    decfsz  puls, f           ; 3 decrement anschlag
    goto    $+16               ; 4 pnoteend   

    ; bsf    note,n_haltebit    ; 4 haltemodus
    ; in den haltemodus

    bcf    note, n_onbit    ; 5

    ;bcf     STATUS,C       ; Index = nr * 2
    ;rlf     notenr, f      ; fuer vars und SetPort2, ClearPort2
    call ClearPort2
    
    movwf    relaisnr    
    decf     relaisnr, f
    decf     relaisnr, f
    movfw    relaisnr
    call    SetPort2
    
    ; set note +1

    goto   $+8 ; pnoteend     ; 5

;pnoteneu
    btfss  note, n_neubit    ; 4
    goto   $+6 ; pnoteend    ; 5

    bsf    note, n_onbit    ; 5
    bcf    note, n_neubit   ; 6

    bcf     STATUS,C       ; Index = nr * 2
    rlf     notenr, f      ; fuer vars und SetPort2, ClearPort2

    call   SetPort2         ; 9
; pnoteend
    endm                    ; min 3 max 9

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
stop_int	BCF	INTCON,GIE	; disable global interrupt
			BTFSC	INTCON,GIE	; check if disabled 
			GOTO	stop_int	; nope, try again
	ENDM
	

;	ENABLE_IRQ enable global irq 

enable_irq MACRO
	BSF	INTCON,GIE	; enable global interrupt
	ENDM
