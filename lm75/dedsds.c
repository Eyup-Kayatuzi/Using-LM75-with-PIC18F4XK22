#include "lm75sensor.h"

uint8_t aa = 0x00;
uint8_t bb = 0x00;
float cc = 0x00;
char buffer[15];

void main() {
      OSCCON = 0x62;
      ANSELC = 0;
      I2C1_Init(100000);// I2C is running at 100khz
      UART1_Init(115200);
      Delay_ms(100);

      while(1){
               oku();
               adding();
               FloatToStr(cc,buffer);
               UART1_Write_Text(buffer);
               UART1_Write_Text("c degree\r\n");
               Delay_ms(1000);
      }
}