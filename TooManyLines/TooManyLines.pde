float z = -200;
float a;
boolean pulse = true;

void setup() {
  size(600, 600, P3D);
  stroke(0, 255, 0);
  noFill();
  rectMode(CENTER);
}

void draw() {
  background(30, 50, 30);
  translate(width/2, height/2);
  rotate(a);
  for (int i=0; i!=20; ++i) {
    rotate(PI/10);
    line(0, -200, z, z, 0, 0);
    line(-z, 0, 0, 0, -200, -z);
    curve(-z,-100,-200, 50,z,0, 50,-z,0, -z,100,200);
    curve(z,100,200, 50,-z,0, 50,z,0, z,-100,-200);
    ellipse(0,0,z,200-z);
    rect(0,0,z,z);
    line(z,-height/2,width/2,z);
    line(width/2,z,-z,height/2);
    line(-z,height/2,-width/2,-z);
    line(-width/2,-z,z,-height/2);
    bezier(200, z, width/2, -height/2, -width/2, height/2, -200, -z);
  }
    
  if(pulse){
    ++z;
    if(z == 200){
      pulse = false;
    }
  }
  else{
    --z;
    if(z == -200){
      pulse = true;
    }
  }
  a = (a+PI/200)%TWO_PI;
}