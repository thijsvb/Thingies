PImage i;

void setup(){
  size(600,600);
  background(0);
  fill(0,225,0,64);
  stroke(255);
  rectMode(CORNERS);
}

void draw(){
  rect(mouseX,mouseY,pmouseX,pmouseY);
  
}