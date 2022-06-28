
_main:

;dedsds.c,8 :: 		void main() {
;dedsds.c,9 :: 		OSCCON = 0x62;
	MOVLW       98
	MOVWF       OSCCON+0 
;dedsds.c,10 :: 		ANSELC = 0;
	CLRF        ANSELC+0 
;dedsds.c,11 :: 		I2C1_Init(100000);// I2C is running at 100khz
	MOVLW       20
	MOVWF       SSP1ADD+0 
	CALL        _I2C1_Init+0, 0
;dedsds.c,12 :: 		UART1_Init(115200);
	BSF         BAUDCON+0, 3, 0
	CLRF        SPBRGH+0 
	MOVLW       16
	MOVWF       SPBRG+0 
	BSF         TXSTA+0, 2, 0
	CALL        _UART1_Init+0, 0
;dedsds.c,13 :: 		Delay_ms(100);
	MOVLW       2
	MOVWF       R11, 0
	MOVLW       4
	MOVWF       R12, 0
	MOVLW       186
	MOVWF       R13, 0
L_main0:
	DECFSZ      R13, 1, 1
	BRA         L_main0
	DECFSZ      R12, 1, 1
	BRA         L_main0
	DECFSZ      R11, 1, 1
	BRA         L_main0
	NOP
;dedsds.c,15 :: 		while(1){
L_main1:
;dedsds.c,16 :: 		oku();
	CALL        _oku+0, 0
;dedsds.c,17 :: 		adding();
	CALL        _adding+0, 0
;dedsds.c,18 :: 		FloatToStr(cc,buffer);
	MOVF        _cc+0, 0 
	MOVWF       FARG_FloatToStr_fnum+0 
	MOVF        _cc+1, 0 
	MOVWF       FARG_FloatToStr_fnum+1 
	MOVF        _cc+2, 0 
	MOVWF       FARG_FloatToStr_fnum+2 
	MOVF        _cc+3, 0 
	MOVWF       FARG_FloatToStr_fnum+3 
	MOVLW       _buffer+0
	MOVWF       FARG_FloatToStr_str+0 
	MOVLW       hi_addr(_buffer+0)
	MOVWF       FARG_FloatToStr_str+1 
	CALL        _FloatToStr+0, 0
;dedsds.c,19 :: 		UART1_Write_Text(buffer);
	MOVLW       _buffer+0
	MOVWF       FARG_UART1_Write_Text_uart_text+0 
	MOVLW       hi_addr(_buffer+0)
	MOVWF       FARG_UART1_Write_Text_uart_text+1 
	CALL        _UART1_Write_Text+0, 0
;dedsds.c,20 :: 		UART1_Write_Text("c degree\r\n");
	MOVLW       ?lstr1_dedsds+0
	MOVWF       FARG_UART1_Write_Text_uart_text+0 
	MOVLW       hi_addr(?lstr1_dedsds+0)
	MOVWF       FARG_UART1_Write_Text_uart_text+1 
	CALL        _UART1_Write_Text+0, 0
;dedsds.c,21 :: 		Delay_ms(1000);
	MOVLW       11
	MOVWF       R11, 0
	MOVLW       38
	MOVWF       R12, 0
	MOVLW       93
	MOVWF       R13, 0
L_main3:
	DECFSZ      R13, 1, 1
	BRA         L_main3
	DECFSZ      R12, 1, 1
	BRA         L_main3
	DECFSZ      R11, 1, 1
	BRA         L_main3
	NOP
	NOP
;dedsds.c,22 :: 		}
	GOTO        L_main1
;dedsds.c,23 :: 		}
L_end_main:
	GOTO        $+0
; end of _main
