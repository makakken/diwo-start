import themidibus.*; //Import the library
MidiBus myBus; // The MidiBus

// Configuration
int spacing = 20;
int size = 40;
int amount_x = 1;
int amount_y = 1;

void setup() {
  // Setup MidiBus
  // MidiBus.list();
  // myBus = new MidiBus(this, 0, "LPD8");
  
  //Setup Fullscreen, P2D
  fullScreen(P2D);
}

void draw() {
  background(0);
  noFill();
  stroke(255,255,255,128);
  translate(
    width/2-(size+spacing)*((amount_x-1)/2),
    height/2-(size+spacing)*((amount_y-1)/2)
  );
  
  for(int i = 0; i < amount_x; i++) {
    for(int j = 0; j < amount_y; j++) {
      rect(
        (size+spacing) * i - 1,
        (size+spacing) * j - 1,
        size,
        size
      );
    }
  }
}


// Test Functions for Midi-Controller Knobs and Buttons
void noteOn(int channel, int pitch, int velocity) {
  // Receive a noteOn
  println();
  println("Note On:");
  println("--------");
  println("Channel:"+channel);
  println("Pitch:"+pitch);
  println("Velocity:"+velocity);
}

void controllerChange(int channel, int number, int value) {
  // Receive a controllerChange
  println();
  println("Controller Change:");
  println("--------");
  println("Channel:"+channel);
  println("Number:"+number);
  println("Value:"+value);
}


// Implementation Knob-Change

//void controllerChange (int channel, int number, int value) {
// if(channel == 0) {
//    switch(number){
//       case 1: amount = map(value,0,127,0,75); break;
//       case 2: num_per_row = int(map(value,0,127,0,50)); break;
//    }
//  } 
//}

void delay(int time) {
  int current = millis();
  while (millis () < current+time) Thread.yield();
}
