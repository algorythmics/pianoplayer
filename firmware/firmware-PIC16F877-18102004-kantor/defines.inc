; algo 2003
; DEFINITIONS and PARAMETER

;minimale Velocity
#define MINIMUM_VEL 5

; -- Timer setup ---

; delaycycles = (t*f/4)/2 = t * 20 * 10^6Hz/8 = t* 2,5 * 10^6 Hz
; delaycyles = (1/20 10^3Hz)* 2500 * 10^3 = 2500/20 = 125
; Prescaler 2 -> 125/0 = 125
; Load 256 - 125 = 100 (real 109 ???)
; 5MHz/(4*10) = ca. 100 kHz

; ----------- 100 microseconds interrupt
;#define USE_NPSA     (1 << PSA)  ; 20Khz
#define USE_NPSA     (0) 
#define PRE_SCALE    B'000'      ; 
#define TMR0_LOAD    (256 - 241) ; experimentell festgestellt.
#define PRE_COUNT  (4) ; erste decrement

; ---------- 50 microseconds  interrupt ----------
;#define USE_NPSA     (1 << PSA)  ; 20Khz
;;#define USE_NPSA     (0) 
;#define PRE_SCALE    B'000'      ; 
;#define TMR0_LOAD    (256 - 235) ; experimentell festgestellt.
;#define PRE_COUNT  (4) ; erste decrement

; ---------- NOTEN --------------

;notenstatus 
n_onbit    equ 0    
n_pulsbit  equ 1 ; whärend des anschlags (sonst haltephase)
                 ; nicht mehr verwendet da nicht notwendig
n_neubit   equ 2 ; neuer anschlag
n_haltebit equ 3 ; gesetzt wenn on und halte (fast interrupt)
n_syncbit  equ 4 ; im synchronmodus synchronspiel

; Livestatus

livebit equ 0
#define  LIVEBIT systemstatus,livebit

; ---------- Serial in
status_bit equ 7
#define STATUS_BIT addresse,status_bit

addr1_bit equ 4
#define ADDR1_BIT addresse,addr1_bit
addr2_bit equ 5
#define ADDR2_BIT addresse,addr2_bit
addr3_bit equ 6
#define ADDR3_BIT addresse,addr3_bit

;#define ADDR_MASK B'01110000'
#define ADDR_MASK (1<<addr1_bit)|(1<<addr2_bit)|(1<<addr3_bit)
#define VALIDMASK (ADDR_MASK | (1 << status_bit))
#define NOTENNRMASK B'00001111'

datavalid equ 1
#define  DATAVALID systemstatus,datavalid
datawait  equ 2
#define  DATAWAIT  systemstatus,datawait

; --- Debug out on RA1, RA2 (jumper für adresse) 
    
debugpin EQU 1
#define  DEBUGPORT  PORTA
#define  DEBUGPIN  DEBUGPORT, debugpin

debugpin1 EQU 2
#define  DEBUGPORT1 PORTA
#define  DEBUGPIN1  DEBUGPORT1, debugpin1

;#define  DEBUGTRIS ~((1 << debugpin) | (1 << debugpin1))
;#define  DEBUGTRIS ~(1 << debugpin)
;#define  DEBUGTRIS ~(1 << debugpin1)
#define  DEBUGTRIS ~(0) ; DEBUG off

#define SDEBUGPIN
#define CDEBUGPIN
#define SDEBUGPIN1
#define CDEBUGPIN1

;#define SDEBUGPIN  bsf DEBUGPIN
;#define CDEBUGPIN  bcf DEBUGPIN
;#define SDEBUGPIN1 bsf DEBUGPIN1
;#define CDEBUGPIN1 bcf DEBUGPIN1


