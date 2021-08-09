#include <xc.inc>
;CONFIG1
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

NUM1	EQU 20H
NUM2	EQU 21H
MY_SUB	EQU 22H
BORROW	EQU 23H
	
;place instructions here
PSECT code,abs,ovrld   ; code segment has to start from 0005h using ORG directive
START:
    ORG 0000h
    GOTO 0005h
    ORG 0005h
    CLRF BORROW
    MOVLW 35H ;0X35 1ST NUMBER
    MOVWF NUM1
    MOVLW 11H ;0X11H 2ND NUMBER
    MOVWF NUM2
    SUBWF NUM1,0 ;0X35 - 0X11H
    MOVWF MY_SUB ; SUBTRACTED STORING IN MY_SUB ADDRESS
    BTFSC STATUS,0 ; IF BORROW BIT IS CLEAR IT WONT INCREMET THE VALUE
    INCF  BORROW ; ADD ONE TO THIS ADDRESS WHEN WE GET BORROW BY THIS WE CAN IDENTIFY THAT SUBTRACT HAS CARRY OR BORROW
    
    NOP ; NO OPERATION
    NOP
LOOP1:
    GOTO LOOP1
    
END