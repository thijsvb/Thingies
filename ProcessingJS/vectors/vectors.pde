PVector v = new PVector(300,300);

void setup(){
  size(600, 600);
  noStroke();
  fill(0,128,0,128);
}

void draw(){
  background(0);
 // translate(width/2,height/2);
  v.set(mouseX,mouseY);
  ellipse(v.x,v.y,50,50);
  
}