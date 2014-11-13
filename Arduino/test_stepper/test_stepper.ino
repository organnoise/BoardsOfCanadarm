int m, d;

void setup() {                
  pinMode(8, OUTPUT);     
  pinMode(9, OUTPUT);
  digitalWrite(8, HIGH);
  digitalWrite(9, LOW);

}

void loop() {
  if(Serial.available() == 1)
  {
    m = Serial.read();
  //  d = Serial.read();
    Serial.write('1'); // Sync
  }
  
  if(m == 1){
  digitalWrite(9, HIGH);
  delay(1);          
  digitalWrite(9, LOW); 
  delay(.0005);
    
  }
  
  /*if(d == 1){
    digitalWrite(8,HIGH);
  }
  else{
    digitalWrite(8,LOW);
  }
*/
}

