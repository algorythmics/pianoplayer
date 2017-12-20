;
; (c) ALGO 2003
; 
; Variablendefinition Autoklavier

; Statusbits für programm
  #define STEST schalter,0  ; Bit 0 Schalter TEST
  #define SNEXT schalter,1  ; Bit 1 Schalter NEXT

  #define DAUERTEST schalter,4 ; relais dauertest
  #define haltebit 0

      CBLOCK 0x20

  ; 4  interrupt saving register
	_w, _status       
	_fsr, _pclath

  ; 8 ---- tasteninterface 
    tastennr    ; Nr der aktuellen Taste
    schalter    ; Test Taste bitfeld
    poti        ; potiwert
    
  ; 9 ----  Helpers 
    relaisnr    ; Index fuer set/clear port
    nindex      ; wo noten gezaehlt werden...              
 ;  12 timer vars

    precount
    timecount0  ; count timer interrupts
	timecount1	; 16Bit high 

; 16 haltepuls
;    hindex       ; index haltepuls
;    haltepuls0   ; haltpulshifter 
;    haltepuls1   ; 16 Bit
;    haltepuls2   ; 24 Bit

; 17 systemstatus

    systemstatus  ; livebit, datavalid
    addresse      ; Adresse

; 19 rs232
   
  inbyte ; empfangenes datum
  notenr ; aktuelle  notenr
  velo   ; velocity der note

; + 48 = 56 noten

    puls0         ; anschlag 
    note0         ; status für note siehe defines for bits
    puls1         ; anschlag 
    note1         ; status für note siehe defines for bits
    puls2         ; anschlag 
    note2         ; status für note siehe defines for bits
    puls3         ; anschlag 
    note3         ; status für note siehe defines for bits
    puls4         ; anschlag 
    note4         ; status für note siehe defines for bits
    puls5         ; anschlag 
    note5         ; status für note siehe defines for bits
    puls6        ; anschlag 
    note6         ; status für note siehe defines for bits
    puls7         ; anschlag 
    note7         ; status für note siehe defines for bits
    puls8         ; anschlag 
    note8         ; status für note siehe defines for bits
    puls9         ; anschlag 
    note9         ; status für note siehe defines for bits
    puls10         ; anschlag 
    note10         ; status für note siehe defines for bits
    puls11         ; anschlag 
    note11         ; status für note siehe defines for bits
;    puls12         ; anschlag 
;    note12         ; status für note siehe defines for bits
;    puls13         ; anschlag 
;    note13         ; status für note siehe defines for bits
;    puls14         ; anschlag 
;    note14         ; status für note siehe defines for bits
;    puls15         ; anschlag 
;    note15         ; status für note siehe defines for bits
;    puls16        ; anschlag 
;    note16         ; status für note siehe defines for bits
;    puls17         ; anschlag 
;    note17         ; status für note siehe defines for bits
;    puls18         ; anschlag 
;    note18         ; status für note siehe defines for bits
;    puls19         ; anschlag 
;    note19         ; status für note siehe defines for bits
;    puls20         ; anschlag 
;    note20         ; status für note siehe defines for bits
;    puls21         ; anschlag 
;    note21         ; status für note siehe defines for bits
;    puls22         ; anschlag 
;    note22         ; status für note siehe defines for bits
;    puls23         ; anschlag 
;    note23         ; status für note siehe defines for bits

	endc


