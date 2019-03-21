/*
#include "pins_arduino.h"

char buf [100];
volatile byte pos;
volatile boolean process_it;

void setup (void)
{
 Serial.begin (9600);   // debugging

 // have to send on master in, *slave out*
 pinMode(MISO, OUTPUT);
 
 
 // turn on SPI in slave mode
 SPCR |= _BV(SPE);
 
 // turn on interrupts
 SPCR |= _BV(SPIE);
 
 pos = 0;
 process_it = false;
}  // end of setup


// SPI interrupt routine
ISR (SPI_STC_vect)
{
byte c = SPDR;
 
 // add to buffer if room
 if (pos < sizeof buf)
   {
   buf [pos++] = c;
   
   // example: newline means time to process buffer
   if (c == '\n')
     process_it = true;
     
   }  // end of room available

  

  if(c == 'A' || c == 'B' || c == 'C' || c == 0x41 || c == 0x42 || c == 0x43)
   {
     Serial.println("Way to go!\nWe received: ");
   }
   else
   {
     Serial.println("Nope!\nWe received: ");
   }

}

// main loop - wait for flag set in interrupt routine
void loop (void)
{
 if (process_it)
   {
   buf [pos] = 0;

   
   
   Serial.println (buf);
   pos = 0;
   process_it = false;
   }  // end of flag set
   
}  // end of loop  
*/



#include <SPI.h>

char buf [100];
volatile byte pos;
volatile bool process_it;
byte c;

void setup (void)
{
  Serial.begin (115200);// debugging

  // turn on SPI in slave mode
  SPCR |= bit (SPE);

  // have to send on master in, *slave out*
  pinMode (MISO, OUTPUT);

  // get ready for an interrupt
  pos = 0;   // buffer empty
  process_it = false;

  // now turn on interrupts
  SPI.attachInterrupt();

}  // end of setup


// SPI interrupt routine
ISR (SPI_STC_vect)
{
c = SPDR;  // grab byte from SPI Data Register
Serial.println("Received byte: ");
//Serial.println(c);
  // add to buffer if room
  process_it = true;
/*  if (pos < sizeof buf)
    {
    buf [pos++] = c;

    // example: newline means time to process buffer
    if (c == '\n')
      process_it = true;

    }  // end of room available */
}  // end of interrupt routine SPI_STC_vect

// main loop - wait for flag set in interrupt routine
void loop (void)
{
  if (process_it)
    {
   // buf [pos] = 0;
    Serial.println (c);

    switch(c)
    {
      case 'A':
        //Pan Left
        break;
      case 'B':
        //Pan Right
        break;
      case 'C':
        //Tilt Up
        break;
      case 'D':
        //Tilt Down
        break;
      case 'E':
        //Zoom In
        break;
      case 'F':
        //Zoom Out
        break;
    }
    
  //  pos = 0;
    process_it = false;
    }  // end of flag set

}  // end of loop 
