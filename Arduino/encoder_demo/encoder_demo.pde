// for encoder 0
#define encoder0PinA 2
#define encoder0PinB 3
volatile int encoder0Count = 0;
volatile float angle0 = 0;
volatile float velocity0 = 0;
volatile float angle0_previous = 0;
volatile float angle0_post = 0;

// for encoder 1
#define encoder1PinA 21
#define encoder1PinB 20
volatile int encoder1Count = 0;
volatile float angle1 = 0;
volatile float velocity1 = 0;
volatile float angle1_previous = 0;
volatile float angle1_post = 0;

// for Timer2
volatile int tcnt2 = 131;
volatile int t = 0;

void setup() {
  // for encoder 0
  pinMode(encoder0PinA, INPUT); 
  pinMode(encoder0PinB, INPUT); 
  attachInterrupt(0, doEncoder0A, CHANGE);  
  attachInterrupt(1, doEncoder0B, CHANGE);  
  
  // for encoder 1
  pinMode(encoder1PinA, INPUT); 
  pinMode(encoder1PinB, INPUT); 
  attachInterrupt(2, doEncoder1A, CHANGE);  
  attachInterrupt(3, doEncoder1B, CHANGE);    
  
  // setup for Timer2: interrupts every 1 ms
  TIMSK2 &= ~(1<<TOIE2);
  TCCR2A &= ~((1<<WGM21) | (1<<WGM20));
  TCCR2B &= ~(1<<WGM22);
  ASSR &= ~(1<<AS2);
  TIMSK2 &= ~(1<<OCIE2A);
  TCCR2B |= (1<<CS22)  | (1<<CS20);
  TCCR2B &= ~(1<<CS21);
  TCNT2 = tcnt2;
  TIMSK2 |= (1<<TOIE2);
  
  Serial.begin (9600); // for debugging
}

void loop() {
  // for encoder 0
  Serial.print("cnt0: ");
  Serial.print(encoder0Count, DEC); 
  Serial.print("; ");
  Serial.print("agl0: ");
  Serial.print(angle0, 4); 
  Serial.print("; ");
  Serial.print("vel0: ");
  Serial.print(velocity0, 4); 
  Serial.print("; "); 
  
  // for encoder 1
  Serial.print("cnt1: ");
  Serial.print(encoder1Count, DEC); 
  Serial.print("; ");
  Serial.print("agl1: ");
  Serial.print(angle1, 4); 
  Serial.print("; ");
  Serial.print("Vel1: ");
  Serial.print(velocity1, 4); 
  Serial.println("."); 
}
