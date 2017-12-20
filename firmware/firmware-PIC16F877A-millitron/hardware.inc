; My hardware definitions
; (c) ALGO 2003

; -------- Tasten in --------------
tpoti  EQU 0
#define TPOTI PORTA,tpoti

; ---  RA1 == 1 -> addressmode ---
addrvalid EQU 1
#define ADDRVALID PORTA,addrvalid

taddr1 EQU 2
#define TADDR1 PORTA,taddr1

taddr2 EQU 3
#define TADDR2 PORTA,taddr2

taddr3 EQU 4
#define TADDR3 PORTA,taddr3

; ---  RA1 == 0 -> testmode ---
testvalid EQU 1
#define TESTVALID PORTA,testvalid

ttest equ 3
#define TTEST PORTA,ttest

tnext equ 4
#define TNEXT PORTA,tnext

; ------------ Relaisouts ------------
;----
rel0 EQU 5
#define REL0 PORTA,rel0

rel1 EQU 0
#define REL1 PORTE,rel1

rel2 EQU 1
#define REL2 PORTE,rel2

rel3 EQU 2
#define REL3 PORTE,rel3

rel4 EQU 0
#define REL4 PORTC,rel4

rel5 EQU 1
#define REL5 PORTC,rel5

rel6 EQU 1
#define REL6 PORTD,rel6

rel7 EQU 0
#define REL7 PORTD,rel7

rel8 EQU 3
#define REL8 PORTC,rel8

rel9 EQU 2
#define REL9 PORTC,rel9

rel10 EQU 2
#define REL10 PORTD,rel10

rel11 EQU 3
#define REL11 PORTD,rel11

rel12 EQU 4
#define REL12 PORTC,rel12

rel13 EQU 5
#define REL13 PORTC,rel13

rel14 EQU 4
#define REL14 PORTD,rel14

rel15 EQU 5
#define REL15 PORTD,rel15

rel16 EQU 6
#define REL16 PORTD,rel16

rel17 EQU 7
#define REL17 PORTD,rel17

rel18 EQU 0
#define REL18 PORTB,rel18

rel19 EQU 1
#define REL19 PORTB,rel19

rel20 EQU 2
#define REL20 PORTB,rel20

rel21 EQU 3
#define REL21 PORTB,rel21

rel22 EQU 4
#define REL22 PORTB,rel22

rel23 EQU 5
#define REL23 PORTB,rel23
