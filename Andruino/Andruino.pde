import com.yourinventit.processing.android.serial.*;
//import processing.serial.*;
Serial port;

void setup(){
  orientation(PORTRAIT);
  //port = new Serial(this, Serial.list(this)[0], 9600);
  println(Serial.list(this));
  //text(Serial.list(this).length, width/2, height/2);
  noLoop();
}

void draw(){
  
  /*if(port.available() > 0){
    int m = port.read();
    background(0);
    text(m, width/2, height/2);
  }*/
}