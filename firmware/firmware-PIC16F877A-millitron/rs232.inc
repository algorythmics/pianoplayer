;   RC7 - Serial Receive Pin
;   RC6 - Serial Transmit Pin
;
; Baudrate angeblich SBRG= Fosc/(Rate*16*[4**(1-BRGH)])-1

; Baurate = 20*10^6/(115200 * 16 [4^0]) - 1 = 9,80 -> gewaehlt 10
#define BAUD_RATE 10

; baudrate = 20*10^6/(57600 * 16 [4^0]) - 1 = 20,7 -> gewaehlt 21
;#define BAUD_RATE 21

;mit BRGH = 1 (High Speed)

rs_init 
	bsf    STATUS, RP0            ;  Enable the Serial Port
   	movlw  (1 << TXEN) |(1<<BRGH) ;  Enable Serial Transmission
   	movwf  TXSTA ^ 0x080          ;  0x26
   	movlw  BAUD_RATE              ;  Baudrate
   	movwf  SPBRG ^ 0x080
   	bcf    STATUS, RP0
   	movlw  (1 << SPEN) | (1 << CREN) ; 0x90
   	movwf  RCSTA                  ;  Enable Serial I/O

    ; IRQ ENABLEN
	MOVLW	PIE1	; get adress for periphial irq's
	MOVWF	FSR	; setup fsr
	BSF	INDF,RCIE ; enable reciever irq
	BSF	INTCON,PEIE ; and periphial irq must also be enabled

	return

;rs_read   ; not used direcxt in code
;    	btfss   PIR1, RCIF          ;  Wait for Received Character Set
;     	goto    rs_read             ;   - Nothing There
;    	movf    RCREG, w            ;  Get the Received Character
;    	bcf     PIR1, RCIF          ;  Clear the Character Present Flag
;	return

;rs_write
;    	movwf  TXREG                  ;  Send the Character
;	return

; -------------------- Seriell in
clear_rs                      ; empty seriell buffer in chip
   	btfss   PIR1, RCIF        ;  Wait for Received Character Set
    return                    ;   - Nothing There

    movfw   RCREG             ;  Get the Received Character
    bcf     PIR1, RCIF        ;  Clear the Character Present Flag
	goto    clear_rs   
