
#include <SPI.h>
#include <Wire.h>
#include <Adafruit_MotorShield.h>

char buf [100];
volatile byte pos;
volatile bool process_it;
byte c;

Adafruit_MotorShield AFMS = Adafruit_MotorShield();
Adafruit_MotorShield AFMS2 = Adafruit_MotorShield();

Adafruit_StepperMotor *AZMotor = AFMS.getStepper(200, 1);
Adafruit_StepperMotor *ELMotor = AFMS.getStepper(200, 2);

void setup (void)
{
  Serial.begin (115200);// debugging

  AFMS.begin();
  AFMS2.begin();

  AZMotor->setSpeed(15);
  ELMotor->setSpeed(15);

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
        AZMotor->step(100, FORWARD, SINGLE);
        Serial.println("Pan Left");
        break;
      case 'B':
        //Pan Right
        AZMotor->step(100, BACKWARD, SINGLE);
        Serial.println("Pan Right");
        break;
      case 'C':
        //Tilt Up
        ELMotor->step(100, FORWARD, SINGLE);
        Serial.println("Tilt Up");
        break;
      case 'D':
        //Tilt Down
        ELMotor->step(100, BACKWARD, SINGLE);
        Serial.println("Tilt Down");
        break;
      case 'E':
        //Zoom In
        Serial.println("Zoom In");
        break;
      case 'F':
        //Zoom Out
        Serial.println("Zoom Out");
        break;
    }
    
  //  pos = 0;
    process_it = false;
    }  // end of flag set

}  // end of loop 
