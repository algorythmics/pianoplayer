 title "main.asm   - Autoklavier Main Test"
#define _version "2.1"

; Update History: 
; 1.12.2003 initial build (V 0.01a)
; 10.12.2003 first release (V 0.01)
; 10.1.2004  added serial interrupt, debuuged timer int (V1.0)
; 18.10.2004 neue hardware (V2.0)
; 31.7.2005 neue relais (V2.1)

; Autoklavierspieler für relais
;
; Author: Winfried Ritsch
; (c) ALGO 2003 
;   
; Hardware Notes:
; build for PIC-Controller 16LF877A - 20Mhz
; special made for Autoklavier

; Hints:
; Clock 20 MHz -> 5.000.000 Instruction /sec 
; State Machine Programm
; Main loop sollte nie auf wait gehen und 
; 
; Code immer im Bank0 Status halten

; 1.) assembler Directives

;	list p=16f877A   ; von MPLAP aus spezifiert
	list R=DEC       ; Basis der Zahlen ist default 10

; 2.) Header Includes                                                                                                                                                                                                    

	include "p16F877A.inc"    ; Prozessor defs (mplab)
	include "hardware.inc"	  ; my hardware defs

; 3.)  Variablen and #defines

    include defines.inc
    include macros.inc
    include variable.inc
   

; 4) RESET und Interrupt Code

	org 0x000
RESET		 	; start at reset vector
	NOP		    ; for debugger
    clrf STATUS ; ensure to be bank 0
    clrf PCLATH ; ensure no page bits set (before goto)
	goto Start

	org 0x004		; --- Interrupt service routine
	goto Int

    include "relaytab.inc" ; muss innerhalb einer org 0xFF sein

; v2 not needed  include "haltetab.inc" ; muss innerhalb einer org 0xFF sein

    include "intimer.inc"
	include "parser.inc"
    include "rs232.inc"

; 5.) Main Code

Start
 	call ports_init
    call init_adresse
	call rs_init
    call clear_rs

; --------  MAIN LOOP if testmode ------
Loop

;---  call SerialIn   ; Seriellen Eingang abfragen
;---  now a s interrupt
    
	btfsc TESTVALID
  	goto Loop

    call TestTaste  ; Testtaste, Nexttaste abfragen
    goto Loop

; ---------  serint called from interrupt handler
SerialIn

	btfss   PIR1, RCIF         ;  Wait for Received Character Set
    return                     ;   - Nothing There

    movfw   RCREG              ;  Get the Received Character
    bcf     PIR1, RCIF         ;  Clear the Character Present Flag

    btfss RCSTA, OERR          ; overrun ??? 
	goto  ser_err_end          ; no -> Process Data
    
    bcf  RCSTA, CREN
    bsf  RCSTA, CREN

	goto SerialIn				; if overrun data not valid

ser_err_end

    call parse_input
	goto SerialIn               ; run until all processed

; -------------------- TestTaste
TestTaste
	btfss 	TTEST  	      ; Testtaste ?
	goto	TasteTest     ; bedienen

                          ; Testtaste nicht gedrueckt
    call    TasteTestOff  ; zuerst ausschalten
	goto    NextTaste     ; dann NextTaste bearbeiten

TasteTest
    btfsc   STEST
    return

    tastenr_to_fsr note0
    btfsc   INDF, n_onbit    ; note nicht on ?
    return       ; nein -> return ohne STEST setzen damit timeout

    ; ---------- Wert von poti ---------
    ; spiele Note
	bsf		ADCON0, GO     ; start adc
	btfsc	ADCON0, GO     ; wait for value
 	goto    $ - 1
    movfw   ADRESH         ; read value
    movwf   poti
    bcf     STATUS, C
    rrf     poti, f
    incf    poti, f
    
; ------- note spielen 
    tastenr_to_fsr puls0

 	movfw   poti            ; potiwert
    movwf   INDF            ; in den puls

    incf    FSR, f            ; note = puls+1
    bsf     INDF, n_neubit ; spielen

    bsf     STEST
	return

TasteTestOff
    btfss   STEST
    return

    bcf     STEST
	; noteoff
    tastenr_to_fsr 0
    movfw   FSR

    bcf     STATUS,C       ; Index = nr * 2 (gesamt * 4)
    rlf     notenr, f      ; fuer vars und SetPort2, ClearPort2
    call    ClearPort2
    incf    notenr, f      ; und haltemoment
    incf    notenr, f
    call    ClearPort2     ; Port zturuecksetzen

    tastenr_to_fsr note0
    clrf    INDF           ; clrf note

	return

; -------------------- nexttaste
NextTaste
	btfss 	TNEXT  	  
	goto	TasteNext
    goto    NTasteNext

TasteNext

    btfsc SNEXT
    return
 
    bsf     SNEXT        ; Taste gedrueckt

    decfsz  tastennr,f   ; decrement Tastennr
    return                ; wenn nicht null return
                       
    movlw   12           ; sonst beginne bei 12
    movwf   tastennr
	return

NTasteNext

    btfss   SNEXT        ; taste schon losgelassen ?
    return               ; -> dann passts
  
    bcf     SNEXT        ; merke zustand
	return

       ; --------------------  INITs -----------------

ports_init
	bcf	 STATUS, RP1 	; Bank 0
	bcf	 STATUS, RP0 	; am Start
    clrf INTCON         ; sicher dass kein interrupt
	CLRF	PIR1	    ; clear periphial irq's
	CLRF	PIR2	    ; ditto
	
	; make sure all individual irq's are disabled
	MOVLW	PIE1	; get adress for periphial irq enable
	MOVWF	FSR	; setup fsr
	CLRF	INDF	; and clear irq enable flags

	MOVLW	PIE2	; get adress for second periphial irq enable
	MOVWF	FSR	; setup fsr
	CLRF	INDF	; and clear irq enable flags

	; --- Initial state before tristating outs ??? ---

	call ClearRelais

	; --- Init Button + timer ----
    movlw   1           ; beginne bei 1
    movwf   tastennr
    bcf     STEST
    bcf     SNEXT
    clrf    poti

	clrf	addresse

    movlw   PRE_COUNT
    movwf   precount
    clrf    timecount0
    clrf    timecount1

    call all_notes_off

;    movlw   0
;    movwf   hindex
;    call    SetHaltepuls
;     call    hpuls4

	; ------------- TRISTATE and IO-Pins Settings -------------
	bcf	STATUS, RP0 		; Bank0

    ; 10 FSC/64, 000 ADchannel0, 0 noconv, -, AD off 
    #define ADCON0_OFF B'10000000'
    #define ADCON0_ON  (ADCON0_OFF | 0x1)

;	movlw	ADCON0_OFF	; NO AD
	movlw	ADCON0_ON	; AD
	movwf	ADCON0

    ; ---------- PORT A and associated Pins ---------
	bsf	STATUS, RP0 		; Bank1	

    ; Init Analogconverter    
    ; leftalgined 0, 1 FSC/64, -, -, MODE only AN0 analog
	movlw	B'00001110'	; 
	movwf	ADCON1^0x080

    ; CMCON C2OUT, C1OUT, C2INV, C1INV, CM
    ; CRVCON: CVRON, CVROE

	; Port A -,-, 000 Outputs, 11111 Inputs 
	movlw	B'00011111' & DEBUGTRIS
	movwf	TRISA^0x080

    ; ---------- PORT B and associated Pins ---------

    ; OPTIONREG  RBPU, INETDG (for rb6,7 pgm)

	; Port B 	000000 6 Outputs,  2-Inputs (ICD)
	movlw	B'00000000'
	movwf	TRISB^0x080


    ; ---------- PORT C and associated REGs ---------    

	; PORTC 10 (USART), 000000 6-outputs
	movlw	B'10000000'
	movwf	TRISC^0x080
	
	; PORTD all Outputs
	movlw	B'00000000'
	movwf	TRISD^0x080

	; PORTE all 3 Outputs
	bcf	TRISE^0x080,0
	bcf	TRISE^0x080,1
	bcf	TRISE^0x080,2


; ------ Setup timer --------------
	; Option =  Prescale
	; + RBPU   - no pullups on PortB 
	; + /PSA   - Prescaler to Timer0 (not WDT)
	; + /TOSE  - Timer src edge not used
	; + /T0CS  - Timer Clk source intern (CLK/4) 
	; + /INTEDG sets button int to falling edge

	movlw	PRE_SCALE | (1 << NOT_RBPU) | USE_NPSA
    ;movlw   (1 << NOT_RBPU) | (1 << PSA) 
	movwf	OPTION_REG^0x080

	bcf	STATUS, RP0 		; Bank 0
	movlw	TMR0_LOAD	; load timer
	movwf	TMR0

	call ClearRelais

	; --- Interrupts enable (gie)+Timer0+RB0+RB4:7 ---
;	movlw  (1<<GIE)|(1<<T0IE)|(1<<INTE)|(1<<RBIE)
;	movlw  (1<<GIE)|(1<<INTE)|(1<<RBIE) ; no timer
	movlw  (1<<GIE)|(1<<T0IE) ; only timer
;	movlw   0x00 
	movwf	INTCON

	return

             ; Adresse Einlesen
init_adresse
             ; Adressbits fuer decodierung festlegen !!!
    clrf     addresse
    btfsc    TADDR1
    bsf      ADDR1_BIT
    btfsc    TADDR2
    bsf      ADDR2_BIT
    btfsc    TADDR3
    bsf      ADDR3_BIT
    return

; 6) Helpers


ClearRelais

    movlw 23
    movwf relaisnr
	call     ClearPort     ; wenn nicht null dann ausfuehren    
	decfsz   relaisnr, f   ; decr nummer 
    goto     $-2           ; loop 
	call     ClearPort     ; auch null ausfuehren   
    return                 ; fertig

SetRelais

    movlw 23
    movwf relaisnr
	call     ClearPort     ; wenn nicht null dann ausfuehren    
	decfsz   relaisnr, f   ; decr nummer 
    goto     $-2           ; loop 
	call     ClearPort     ; auch null ausfuehren   
    return                 ; fertig

all_notes_off

    movlw   LOW puls0
    movwf   FSR
    movlw   12
    movwf   nindex
   
clear_notes
    clrf    INDF  ; puls++
    incf    FSR, f
    clrf    INDF  ; note++
    incf    FSR, f
    decfsz  nindex, f
    goto    clear_notes

    call    ClearRelais
	return

 ; ------------- end --------------------
	end
