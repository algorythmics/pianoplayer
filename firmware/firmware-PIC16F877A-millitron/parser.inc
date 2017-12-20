; play notes aufgerufen von main oder interrupt:

; --- Parse input which is in w
parse_input   

    movwf inbyte   ; merken in inbyte

    bsf   LIVEBIT  ; mark serial input as alive 
                   ; (nach 26sec marked dead und weitern 26sec 
                   ; 'all notes off' in interrupt)

    btfss inbyte,status_bit ; Status Byte
	goto  data_received     ; no -> data_in

    bcf   DATAVALID         ; Data input not valid any more
 
	andlw ADDR_MASK         ; compare address of board
	subwf addresse,w
	btfss STATUS,Z
	goto parse_end          ; -> not us -> end  
	
    movfw inbyte           ; our note ,
	andlw NOTENNRMASK      ; mask nummer 
    movwf notenr           ; and remember
	sublw  11              ; im notenbereich ?
    btfss STATUS,C         ; (if Carry clear result negative !!!)
    goto  parse_end        ; negativ -> not a note

    bcf     STATUS,C       ; Index = nr * 2
    rlf     notenr, f      ; fuer vars und SetPort2, ClearPort2
    
	bsf  DATAVALID         ; naechstes Datum velocity fuer diese note
    goto parse_end         ; das wars 

data_received             ; ------ DATA
    btfss DATAVALID       ; wir warten auf keine daten
    goto parse_end        ; not valid warte auf neues Datum

    bcf   DATAVALID       ; verarbeite datum
                          
    btfsc  STATUS,Z       ; Velocity nicht null 
	goto  note_off        ; -> nein note aus

note_on
    addlw  MINIMUM_VEL   ; Minimum velocity eg.5
    movwf  velo          ; merke velocity
    movlw  LOW puls0     ; Puls0 adresse 
 	movwf  FSR           ; laden
    movfw  notenr        ; addiere notenindex  
    addwf  FSR,f         ; index 
 	movfw  velo          ; velo holen
    movwf  INDF          ; in den puls = spielen

    incf    FSR, f        ; notenstatus = puls+1
    bsf     INDF, n_neubit ; spielen

    goto parse_end        ; warte auf neuen status


note_off                    ; ---------- Note aus

    movlw   LOW note0       ; note0 = variablenblock start bei note
 	movwf	FSR             ; hinzuaddieren
    movfw   notenr          ; notenindex (2*nr)
    addwf   FSR, f

; bei start mit puls, jedoch unoetig
;    clrf    INDF            ; clrf puls    
;    incf    FSR, f        ; notenstatus = puls+1

    clrf    INDF            ; clrf note    

    bcf     STATUS,C       ; Index = nr * 2 (gesamt * 4)
    rlf     notenr, f      ; fuer vars und SetPort2, ClearPort2

    movfw   notenr          ; notennr (= 2*index)
   
    call    ClearPort2      ; Port zturuecksetzen

    addlw   2      ; und haltemoment
    call    ClearPort2      ; Port zturuecksetzen
         
                            ; falls in high phase 
    ;;goto parse_end

parse_end
	return
