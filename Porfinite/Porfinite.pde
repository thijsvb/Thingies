
void setup() {
  //size(1920, 1080);
  fullScreen();
}
float o = 0;
void draw() {
  //scale(0.5);
  background(255);
  for (float f=0; f<3.6; f+=1.2) {
    float s = (o + f) % 3.6;
    porfo(s);
  }
  //o = (o+0.01)%1.2;
  o+=0.01;
  if(o >= 1.2){
    exit();
  }
  saveFrame("frames/###.png");
}

void porfo(float scl) {
  pushMatrix();
  translate(width/2, height/2);
  noFill();
  stroke(0);
  strokeWeight(scl*4);
  ellipse(0, 0, 540*scl, 360*scl*scl);
  fill(255);
  arc(-270*scl - 140*scl, 0, 360*scl, 360*scl, -PI/4, PI/4);
  arc(270*scl + 140*scl, 0, 360*scl, 360*scl, PI*3/4, PI+PI/4);
  fill(0);
  ellipse(-230*scl, -300*scl, 20*scl, 20*scl);
  ellipse(230*scl, -300*scl, 20*scl, 20*scl);
  popMatrix();
}