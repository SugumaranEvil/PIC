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
  
  ;place instructions here
PSECT code,abs,ovrld   ; code segment has to start from 0005h using ORG directive
START:
    ORG 0000H
    GOTO 0005H
    ORG 0005H
   
    BSF STATUS,5
    CLRF TRISA
    BCF STATUS,5
    MOVLW 011H
    MOVWF PORTA
    
    BSF STATUS,5 ;Setting bit 1 on RP0 then it moved to Bank 1
    CLRF TRISB   ; setting TRISB ALL PINS ARE OUTPUT PINS
    BCF STATUS,5 ;after set we need to clear then it moved to Bank 0 
    MOVLW 0ABH ; 1010 1011 => one having pins are giving +5V
    MOVWF PORTB ;PORTB=0XAB
    
    BSF STATUS,5
    CLRF TRISC  ; make it has a output port
    BCF STATUS,5
    MOVLW 012h ; 0001 0010 make these one bits pins give 5v+ to blink an led
    MOVWF PORTC
    
  
    
    NOP
    NOP
    
LOOP1:
    GOTO LOOP1
    
END