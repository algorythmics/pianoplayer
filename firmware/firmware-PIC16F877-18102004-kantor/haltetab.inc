; Autoklavierspieler für relais
; achtung diese code muss innerhalb einer page sein.
; nort needed any mor 2004


SetHaltepuls
    bcf   STATUS,C
    rlf   hindex, f  ; *2 als index nach w
    rlf   hindex, f  ; *4 als index nach w
    rlf   hindex, w  ; *8 als index nach w
SetHaltepuls2          ; wenn index schon * 2 ist dann nur 3 befehle
    addwf PCL, f

hpuls1
    movlw   B'00000001' ; 1
	movwf   haltepuls0  ; 2
    movlw   B'00000001' ; 3
	movwf   haltepuls1  ; 4
    movlw   B'00000001' ; 5
	movwf   haltepuls2  ; 6
	return              ; 7
    nop                 ; 8


hpuls2
    movlw   B'01010101' ; 1
	movwf   haltepuls0  ; 2
    movlw   B'01010101' ; 3
	movwf   haltepuls1  ; 4
    movlw   B'01010101' ; 5
	movwf   haltepuls2  ; 6
	return              ; 7
    nop                 ; 8

hpuls3
    movlw   B'00010001' ; 1
	movwf   haltepuls0  ; 2
    movlw   B'00010001' ; 3
	movwf   haltepuls1  ; 4
    movlw   B'00010001' ; 5
	movwf   haltepuls2  ; 6
	return              ; 7
    nop                 ; 8

hpuls4
    movlw   B'00100100' ; 1
	movwf   haltepuls0  ; 2
    movlw   B'10010010' ; 3
	movwf   haltepuls1  ; 4
    movlw   B'01001000' ; 5
	movwf   haltepuls2  ; 6
	return              ; 7
    nop                 ; 8

