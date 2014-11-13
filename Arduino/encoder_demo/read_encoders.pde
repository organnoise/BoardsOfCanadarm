//--------------------
// for encoder 0
//--------------------
void doEncoder0A(){  // interrupt 0 function
  if (digitalRead(encoder0PinA) == HIGH) {  // look for a low-to-high on channel A
    if (digitalRead(encoder0PinB) == LOW) { // check channel B to see which way encoder is turning
      encoder0Count = encoder0Count + 1;
    } 
    else {
      encoder0Count = encoder0Count - 1;
    }
  }
  else {                                     // must be a high-to-low edge on channel A
    if (digitalRead(encoder0PinB) == HIGH) { // check channel B to see which way encoder is turning  
      encoder0Count = encoder0Count + 1;
    } 
    else {
      encoder0Count = encoder0Count - 1;
    }
  }
  angle0 = 0.00105*encoder0Count;  // unit: radian
}

void doEncoder0B(){  // interrupt 1 function
  if (digitalRead(encoder0PinB) == HIGH) {   // look for a low-to-high on channel B
    if (digitalRead(encoder0PinA) == HIGH) { // check channel A to see which way encoder is turning
      encoder0Count = encoder0Count + 1;
    } 
    else {
      encoder0Count = encoder0Count - 1;
    }
  }
  else {                                    // must be a high-to-low edge on on channel B
    if (digitalRead(encoder0PinA) == LOW) { // check channel B to see which way encoder is turning
      encoder0Count = encoder0Count + 1;
    } 
    else {
      encoder0Count = encoder0Count - 1;
    }
  }
  angle0 = 0.00105*encoder0Count;  // unit: radian
}

//--------------------
// for encoder 1
//--------------------
void doEncoder1A(){  
  if (digitalRead(encoder1PinA) == HIGH) {  
    if (digitalRead(encoder1PinB) == LOW) { 
      encoder1Count = encoder1Count + 1;
    } 
    else {
      encoder1Count = encoder1Count - 1;
    }
  }
  else {                                     
    if (digitalRead(encoder1PinB) == HIGH) { 
      encoder1Count = encoder1Count + 1;
    } 
    else {
      encoder1Count = encoder1Count - 1;
    }
  }
  angle1 = 0.00126*encoder1Count;  
}

void doEncoder1B(){  
  if (digitalRead(encoder1PinB) == HIGH) {  
    if (digitalRead(encoder1PinA) == HIGH) { 
      encoder1Count = encoder1Count + 1;
    } 
    else {
      encoder1Count = encoder1Count - 1;
    }
  }
  else {                                   
    if (digitalRead(encoder1PinA) == LOW) { 
      encoder1Count = encoder1Count + 1;
    } 
    else {
      encoder1Count = encoder1Count - 1;
    }
  }
  angle1 = 0.00126*encoder1Count;  
}

//--------------------
// estimate velocity
//--------------------
ISR(TIMER2_OVF_vect) {  
  TCNT2 = tcnt2;  // reload the timer
  t++;
  if (t == 1){
    angle0_previous = angle0;
    angle1_previous = angle1;
  }
  else if (t == 20){
    angle0_post = angle0;  
    angle1_post = angle1;
  }
  else if (t == 21){
    velocity0 = (angle0_post - angle0_previous)*50;  // unit: rad/s
    velocity1 = (angle1_post - angle1_previous)*50;
    t = 0;
  }
}
