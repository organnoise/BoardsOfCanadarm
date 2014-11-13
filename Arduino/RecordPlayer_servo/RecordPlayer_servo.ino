#include <Servo.h>
#define LEDR     9
#define LEDG     8
#define LEDB     5
Servo myservo;
int r, g, b, s;

void setup()
{
  //bitSet(TCCR1B, WGM12);
  pinMode(LEDR, OUTPUT);
  pinMode(LEDG, OUTPUT);
  pinMode(LEDB, OUTPUT);
  myservo.attach(3);
  r = g = b = s = 0;
  
  Serial.begin(9600);
  }

void loop()
{
   
  
  if(Serial.available() >= 4)
  {
    r = Serial.read();
    g = Serial.read();
    b = Serial.read();
    s = Serial.read();
  }
 
 if(r == 1){
    
  analogWrite(LEDR, 255);
  delay(1);
  analogWrite(LEDR,0);
  delay(.005);
  r = 0;
  Serial.write(r);
 }
  digitalWrite(LEDG, g);
  digitalWrite(LEDB, b);
  myservo.write(s);
  
}
