
#define DEBUG 1

#include <SPI.h>
#include <Wire.h>

#ifdef DEBUG
#include <Adafruit_MotorShield.h>
#endif

#define SSIZEAZ 100
#define SSIZEEL 5
#define SSIZEZM
#define AZMIN -547
#define AZMAX 547
#define ELMIN -15
#define ELMAX 15

char buf [100];
volatile byte pos;
volatile bool process_it;
volatile bool automatic_mode;
byte c;

int azPos;
int elPos;
volatile int auto_index;

#ifdef DEBUG
Adafruit_MotorShield AFMS = Adafruit_MotorShield(0x61);
Adafruit_MotorShield AFMS2 = Adafruit_MotorShield();

Adafruit_StepperMotor *AZMotor = AFMS.getStepper(200, 1);
Adafruit_StepperMotor *ELMotor = AFMS.getStepper(200, 2);

Adafruit_DCMotor *ZoomMotor = AFMS.getMotor(1);
#endif


void setup (void)
{
  Serial.begin(115200);// debugging

  #ifdef DEBUG
  AFMS.begin();
  AFMS2.begin();

  AZMotor->setSpeed(40);
  ELMotor->setSpeed(.001);
  ZoomMotor->setSpeed(10);
  #endif

  // turn on SPI in slave mode
  SPCR |= bit (SPE);

  // have to send on master in, *slave out*
  pinMode (MISO, OUTPUT);

  // get ready for an interrupt
  pos = 0;   // buffer empty
  process_it = false;
  automatic_mode = false;

  azPos = 0;
  elPos = 0;
  auto_index = 0;

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

  if(c == 'H')
  {
    automatic_mode = !automatic_mode;

    if(automatic_mode)
    {
      auto_index = 0;
      Serial.println("Switching to Automatic Mode");
    }
    else
    {
      Serial.println("Switching to Manual Mode");
    }
  }
}  // end of interrupt routine SPI_STC_vect

// main loop - wait for flag set in interrupt routine
void loop (void)
{
  
  if(automatic_mode)
  {
      //Auto stuff
      switch(auto_index)
      {
        case 0:
          delay(1000);
          break;
        case 1:
          posReset();
          break;
        case 2:
          panLeft(AZMAX-10);
          break;
        case 3:
          delay(1000);
          break;
        case 4:
          posReset();
          break;
        case 5:
          panRight(-AZMIN-10);
          break;
      }

      auto_index++;
      if(auto_index >= 6)
        auto_index = 0;
  }
  else
  {
      if (process_it)
        {
       // buf [pos] = 0;
        Serial.println (c);
    
        switch(c)
        {
          case 'A':
            //Pan Left
            panLeft(SSIZEAZ);
            break;
          case 'B':
            //Pan Right
            panRight(SSIZEAZ);
            break;
          case 'C':
            //Tilt Up
            tiltUp(SSIZEEL);
            break;
          case 'D':
            //Tilt Down
            tiltDown(SSIZEEL);
            break;
          case 'E':
            //Zoom In
            zoomIn(SSIZEZM);
            break;
          case 'F':
            //Zoom Out
            zoomOut(SSIZEZM);
            break;
          case 'G':
            //Reset
            posReset();
            break;
          
        }
    
        //  pos = 0;
        process_it = false;
      }  // end of flag set
  }
}  // end of loop 

void panLeft(int STEPSIZE)
{
    if(azPos + STEPSIZE < AZMAX)
    {
        Serial.println("Pan Left");
        #ifdef DEBUG
        AZMotor->step(STEPSIZE, FORWARD, SINGLE);
        #endif
        
    
        azPos += STEPSIZE;
    }
    else
    {
        Serial.println("TOO FAR LEFT");
    }

    Serial.println("Azimuth Position:");
    Serial.println(azPos);
}

void panRight(int STEPSIZE)
{
    if(azPos - STEPSIZE > AZMIN)
    {
        Serial.println("Pan Right");
        #ifdef DEBUG
        AZMotor->step(STEPSIZE, BACKWARD, SINGLE);
        #endif
    
        azPos -= STEPSIZE;
    }
    else
    {
        Serial.println("TOO FAR RIGHT");
    }

    Serial.println("Azimuth Position:");
    Serial.println(azPos);
}

void tiltUp(int STEPSIZE)
{
    if(elPos + STEPSIZE < ELMAX)
    {
        Serial.println("Tilt Up");
        #ifdef DEBUG
        ELMotor->step(STEPSIZE, FORWARD, SINGLE);
        #endif
    
        elPos += STEPSIZE;
    }
    else
    {
        Serial.println("TOO FAR UP");
    }

    Serial.println("Elevation Position:");
    Serial.println(elPos);
}

void tiltDown(int STEPSIZE)
{
    if(elPos - STEPSIZE > ELMIN)
    {
        Serial.println("Tilt Down");
        #ifdef DEBUG
        ELMotor->step(STEPSIZE, BACKWARD, SINGLE);
        #endif
    
        elPos -= STEPSIZE;
    }
    else
    {
        Serial.println("TOO FAR DOWN");
    }

    Serial.println("Elevation Position:");
    Serial.println(elPos);
}

void posReset()
{
    Serial.println("Reset Position");
    #ifdef DEBUG
    if(azPos >= 0)
        AZMotor->step(azPos, BACKWARD, SINGLE);
    else
        AZMotor->step(-azPos, FORWARD, SINGLE);
    #endif
    azPos = 0;

    Serial.println("Azimuth Position:");
    Serial.println(azPos);

    #ifdef DEBUG
    if(elPos >= 0)
        ELMotor->step(elPos, BACKWARD, SINGLE);
    else
        ELMotor->step(-elPos, FORWARD, SINGLE);
    #endif
    elPos = 0;

    Serial.println("Elevation Position:");
    Serial.println(elPos);
}

void zoomIn()
{
  Serial.println("Zoom In");
  #ifdef DEBUG
  ZoomMotor->run(FORWARD);
  delay(100);
  ZoomMotor->run(RELEASE);
  #endif
}

void zoomOut()
{
  Serial.println("Zoom Out");
  #ifdef DEBUG
  ZoomMotor->run(BACKWARD);
  delay(100);
  ZoomMotor->run(RELEASE);
  #endif
}
