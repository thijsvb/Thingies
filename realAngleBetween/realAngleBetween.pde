PVector v = new PVector(200,0);

void setup(){
  size(500,500);
}

void draw(){
  background(255);
  translate(250,250);
  line(0,0,v.x,v.y);
  PVector m = new PVector(mouseX-250,mouseY-250).setMag(200);
  line(0,0,m.x,m.y);
  println(realAngleBetween(m,v));
}

float realAngleBetween(PVector a, PVector b){
  float aAngle = atan(a.y/a.x);
  if(a.x<0 && a.y>0){
    aAngle=abs(aAngle+PI);
  }
  if(a.x<0 && a.y<0){
    aAngle+=PI;
  }
  if(a.x>0 && a.y<0){
    aAngle=abs(aAngle+TWO_PI);
  }
  
  float bAngle = atan(b.y/b.x);
  if(b.x<0 && b.y>0){
    bAngle=abs(bAngle+PI);
  }
  if(b.x<0 && b.y<0){
    bAngle+=PI;
  }
  if(b.x>0 && b.y<0){
    bAngle=abs(bAngle+TWO_PI);
  }
  
  return (aAngle-bAngle+TWO_PI)%TWO_PI;
}

void mousePressed(){
  v = new PVector(mouseX-250, mouseY-250).setMag(200);
}