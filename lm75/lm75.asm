
_oku:

;lm75.c,3 :: 		void oku(){
;lm75.c,5 :: 		I2C1_Start();
	CALL        _I2C1_Start+0, 0
;lm75.c,6 :: 		I2C1_Wr(0x9E); // address of slave
	MOVLW       158
	MOVWF       FARG_I2C1_Wr_data_+0 
	CALL        _I2C1_Wr+0, 0
;lm75.c,7 :: 		I2C1_Wr(0x00); // temperature register
	CLRF        FARG_I2C1_Wr_data_+0 
	CALL        _I2C1_Wr+0, 0
;lm75.c,8 :: 		I2C1_Repeated_Start();
	CALL        _I2C1_Repeated_Start+0, 0
;lm75.c,9 :: 		I2C1_Wr(0x9f); // reading
	MOVLW       159
	MOVWF       FARG_I2C1_Wr_data_+0 
	CALL        _I2C1_Wr+0, 0
;lm75.c,10 :: 		aa = I2C1_Rd(0); // ack gonderdim Most Significant
	CLRF        FARG_I2C1_Rd_ack+0 
	CALL        _I2C1_Rd+0, 0
	MOVF        R0, 0 
	MOVWF       _aa+0 
;lm75.c,11 :: 		bb = I2C1_Rd(0); // ack gondermedim
	CLRF        FARG_I2C1_Rd_ack+0 
	CALL        _I2C1_Rd+0, 0
	MOVF        R0, 0 
	MOVWF       _bb+0 
;lm75.c,12 :: 		I2C1_Stop();
	CALL        _I2C1_Stop+0, 0
;lm75.c,13 :: 		}
L_end_oku:
	RETURN      0
; end of _oku

_adding:

;lm75.c,15 :: 		void adding(){
;lm75.c,16 :: 		aa <<= 1;
	MOVF        _aa+0, 0 
	MOVWF       R3 
	RLCF        R3, 1 
	BCF         R3, 0 
	MOVF        R3, 0 
	MOVWF       _aa+0 
;lm75.c,17 :: 		bb &= 0x80;
	MOVLW       128
	ANDWF       _bb+0, 0 
	MOVWF       R2 
	MOVF        R2, 0 
	MOVWF       _bb+0 
;lm75.c,18 :: 		bb >>= 7;
	MOVLW       7
	MOVWF       R1 
	MOVF        R2, 0 
	MOVWF       R0 
	MOVF        R1, 0 
L__adding2:
	BZ          L__adding3
	RRCF        R0, 1 
	BCF         R0, 7 
	ADDLW       255
	GOTO        L__adding2
L__adding3:
	MOVF        R0, 0 
	MOVWF       _bb+0 
;lm75.c,19 :: 		cc = aa | bb;
	MOVF        R3, 0 
	IORWF       R0, 1 
	CALL        _byte2double+0, 0
	MOVF        R0, 0 
	MOVWF       _cc+0 
	MOVF        R1, 0 
	MOVWF       _cc+1 
	MOVF        R2, 0 
	MOVWF       _cc+2 
	MOVF        R3, 0 
	MOVWF       _cc+3 
;lm75.c,20 :: 		cc *= 0.5f;
	MOVLW       0
	MOVWF       R4 
	MOVLW       0
	MOVWF       R5 
	MOVLW       0
	MOVWF       R6 
	MOVLW       126
	MOVWF       R7 
	CALL        _Mul_32x32_FP+0, 0
	MOVF        R0, 0 
	MOVWF       _cc+0 
	MOVF        R1, 0 
	MOVWF       _cc+1 
	MOVF        R2, 0 
	MOVWF       _cc+2 
	MOVF        R3, 0 
	MOVWF       _cc+3 
;lm75.c,21 :: 		}
L_end_adding:
	RETURN      0
; end of _adding
