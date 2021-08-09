#include <xc.inc>

  CONFIG  FOSC = HS             ; Oscillator Selection bits (HS oscillator: High-speed crystal/resonator on RA6/OSC2/CLKOUT and RA7/OSC1/CLKIN)
  CONFIG  WDTE = OFF            ; Watchdog Timer Enable bit (WDT disabled and can be enabled by SWDTEN bit of the WDTCON register)
  CONFIG  PWRTE = OFF           ; Power-up Timer Enable bit (PWRT disabled)
  CONFIG  MCLRE = ON            ; RE3/MCLR pin function select bit (RE3/MCLR pin function is MCLR)
  CONFIG  CP = OFF              ; Code Protection bit (Program memory code protection is disabled)
  CONFIG  CPD = OFF             ; Data Code Protection bit (Data memory code protection is disabled)
  CONFIG  BOREN = ON            ; Brown Out Reset Selection bits (BOR enabled)
  CONFIG  IESO = ON             ; Internal External Switchover bit (Internal/External Switchover mode is enabled)
  CONFIG  FCMEN = ON            ; Fail-Safe Clock Monitor Enabled bit (Fail-Safe Clock Monitor is enabled)
  CONFIG  LVP = ON              ; Low Voltage Programming Enable bit (RB3/PGM pin has PGM function, low voltage programming enabled)

; CONFIG2
  CONFIG  BOR4V = BOR40V        ; Brown-out Reset Selection bit (Brown-out Reset set to 4.0V)
  CONFIG  WRT = OFF             ; Flash Program Memory Self Write Enable bits (Write protection off)

NUM1	equ 20h
NUM2    equ 21h
SUM	equ 22h
CARRY_VAL   equ 23h
   
;PSECT code
;place instructions here
PSECT code,abs,ovrld   ; code segment has to start from 0005h using ORG directive
START:
    ORG 0000h
    GOTO 0005h
    ORG 0005h
    CLRF CARRY_VAL
    MOVlW 02h
    MOVWF NUM1
    MOVLW 83h
    MOVWF NUM2
    ADDWF NUM1,0
    MOVWF SUM
    BTFSC STATUS,0
    INCF CARRY_VAL
    
    NOP
    NOP
    
LOOP1:	
    GOTO LOOP1
   
    
END