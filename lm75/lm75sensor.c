#include "lm75sensor.h"

void oku(){
     I2C1_Start();
     I2C1_Wr(0x9E); // address of slave
     I2C1_Wr(0x00); // temperature register
     I2C1_Repeated_Start();
     I2C1_Wr(0x9f); // reading
     aa = I2C1_Rd(1); //
     bb = I2C1_Rd(0); //
     I2C1_Stop();
}

void adding(){
     aa <<= 1;
     bb &= 0x80;
     bb >>= 7;
     cc = aa | bb;
     cc *= 0.5f;
}