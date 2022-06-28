
_oku:

;lm75sensor.c,3 :: 		void oku(){
;lm75sensor.c,4 :: 		I2C1_Start();
	CALL        _I2C1_Start+0, 0
;lm75sensor.c,5 :: 		I2C1_Wr(0x9E); // address of slave
	MOVLW       158
	MOVWF       FARG_I2C1_Wr_data_+0 
	CALL        _I2C1_Wr+0, 0
;lm75sensor.c,6 :: 		I2C1_Wr(0x00); // temperature register
	CLRF        FARG_I2C1_Wr_data_+0 
	CALL        _I2C1_Wr+0, 0
;lm75sensor.c,7 :: 		I2C1_Repeated_Start();
	CALL        _I2C1_Repeated_Start+0, 0
;lm75sensor.c,8 :: 		I2C1_Wr(0x9f); // reading
	MOVLW       159
	MOVWF       FARG_I2C1_Wr_data_+0 
	CALL        _I2C1_Wr+0, 0
;lm75sensor.c,9 :: 		aa = I2C1_Rd(1); //
	MOVLW       1
	MOVWF       FARG_I2C1_Rd_ack+0 
	CALL        _I2C1_Rd+0, 0
	MOVF        R0, 0 
	MOVWF       _aa+0 
;lm75sensor.c,10 :: 		bb = I2C1_Rd(0); //
	CLRF        FARG_I2C1_Rd_ack+0 
	CALL        _I2C1_Rd+0, 0
	MOVF        R0, 0 
	MOVWF       _bb+0 
;lm75sensor.c,11 :: 		I2C1_Stop();
	CALL        _I2C1_Stop+0, 0
;lm75sensor.c,12 :: 		}
L_end_oku:
	RETURN      0
; end of _oku

_adding:

;lm75sensor.c,14 :: 		void adding(){
;lm75sensor.c,15 :: 		aa <<= 1;
	MOVF        _aa+0, 0 
	MOVWF       R3 
	RLCF        R3, 1 
	BCF         R3, 0 
	MOVF        R3, 0 
	MOVWF       _aa+0 
;lm75sensor.c,16 :: 		bb &= 0x80;
	MOVLW       128
	ANDWF       _bb+0, 0 
	MOVWF       R2 
	MOVF        R2, 0 
	MOVWF       _bb+0 
;lm75sensor.c,17 :: 		bb >>= 7;
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
;lm75sensor.c,18 :: 		cc = aa | bb;
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
;lm75sensor.c,19 :: 		cc *= 0.5f;
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
;lm75sensor.c,20 :: 		}
L_end_adding:
	RETURN      0
; end of _adding
