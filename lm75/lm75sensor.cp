#line 1 "C:/Users/ARGE/Desktop/MicroC_Folder2/lm75/lm75sensor.c"
#line 1 "c:/users/arge/desktop/microc_folder2/lm75/lm75sensor.h"
#line 1 "c:/users/public/documents/mikroelektronika/mikroc pro for pic/include/stdint.h"




typedef signed char int8_t;
typedef signed int int16_t;
typedef signed long int int32_t;


typedef unsigned char uint8_t;
typedef unsigned int uint16_t;
typedef unsigned long int uint32_t;


typedef signed char int_least8_t;
typedef signed int int_least16_t;
typedef signed long int int_least32_t;


typedef unsigned char uint_least8_t;
typedef unsigned int uint_least16_t;
typedef unsigned long int uint_least32_t;



typedef signed char int_fast8_t;
typedef signed int int_fast16_t;
typedef signed long int int_fast32_t;


typedef unsigned char uint_fast8_t;
typedef unsigned int uint_fast16_t;
typedef unsigned long int uint_fast32_t;


typedef signed int intptr_t;
typedef unsigned int uintptr_t;


typedef signed long int intmax_t;
typedef unsigned long int uintmax_t;
#line 3 "c:/users/arge/desktop/microc_folder2/lm75/lm75sensor.h"
extern void oku();
extern void adding();

extern uint8_t aa = 0x00;
extern uint8_t bb = 0x00;
extern float cc = 0x00;
extern char buffer[15];
#line 3 "C:/Users/ARGE/Desktop/MicroC_Folder2/lm75/lm75sensor.c"
void oku(){
 I2C1_Start();
 I2C1_Wr(0x9E);
 I2C1_Wr(0x00);
 I2C1_Repeated_Start();
 I2C1_Wr(0x9f);
 aa = I2C1_Rd(1);
 bb = I2C1_Rd(0);
 I2C1_Stop();
}

void adding(){
 aa <<= 1;
 bb &= 0x80;
 bb >>= 7;
 cc = aa | bb;
 cc *= 0.5f;
}
