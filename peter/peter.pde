PShape peter;
PShape deksel;
float rx, ry;

void setup() {
  size(500, 500, P3D);
  strokeWeight(2);

  deksel = createShape();
  deksel.setFill(color(0,0,255));
  deksel.setStroke(color(255,0,0));
  deksel.beginShape(TRIANGLE_STRIP);
  for (float i=0; i!=6; ++i) {
    float a = i*TWO_PI/5;
    deksel.vertex(0,-100,0);
    deksel.vertex(cos(a)*100, -100, sin(a)*100);
  }
  deksel.endShape();
  
  peter = createShape();
  peter.setFill(color(255,128,0));
  peter.setStroke(color(0,128,0));
  peter.beginShape(TRIANGLE_STRIP);
  for (float i=0; i!=6; ++i) {
    float a = i*TWO_PI/5;
    peter.vertex(cos(a)*100, -100, sin(a)*100);
    peter.vertex(cos(a)*100, 100, sin(a)*100);
  }
  peter.endShape();
}

void draw() {
  translate(width/2, height/2);
  rotateX(rx);
  rotateY(ry);
  background(0);
  shape(peter);
  shape(deksel);

  if (keyPressed) {
    if (key == CODED) {
      if (keyCode == UP) {
        rx+=PI/64;
      } else if (keyCode == DOWN) {
        rx-=PI/64;
      } else if (keyCode == LEFT) {
        ry-=PI/64;
      } else if (keyCode == RIGHT) {
        ry+=PI/64;
      }
    }
  }
}