#ifndef F_CPU
#define F_CPU 16000000UL
#endif

#include <avr/io.h>
#include <util/delay.h>

int main(void)
{
  DDRB |= (1<<PB5);
  DDRD &= ~(1<<PD2);

  int stat=0;

  while(1){
    if((stat = (PIND & (1<<PD2)))){
      for(int cont=0;cont<=5;cont++){
        PORTB |= (1<<PB5);
        _delay_ms(100);
        PORTB &= ~(1<<PB5);
      }

    }
  }
}
