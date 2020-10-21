TARGET=clique_botao.c
RESULT=clique_botao
OBJS=clique_botao.o
CC=avr-gcc -Wall -g -Os
DUMP=avr-objcopy
CC_FLAGS=-Wall -g -Os -mmcu=atmega328p
DUMP_FLAGS= -O ihex -R .eeprom 
DUDE=avrdude 
DUDE_FLAGS=-pm328p -carduino -P/dev/ttyACM0 -Uflash:w:$(RESULT).hex:a 

all: $(OBJS)

clique_botao.o: clique_botao.c
	$(CC) $(CC_FLAGS) $(TARGET) -c -o $(RESULT).o
	$(CC) $(CC_FLAGS) clique_botao.o -o $(RESULT)
	$(DUMP) $(DUMP_FLAGS) $(RESULT) $(RESULT).hex
	
clear:
	rm *.o
	rm *.hex

upload:
	$(DUDE) $(DUDE_FLAGS)
