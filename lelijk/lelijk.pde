float rot;

void setup() {
  size(600, 600, P3D);
  stroke(128);
  fill(255, 255, 0);
  sphereDetail(15);
}

void draw() {
  background(0, 128, 128);
  for (int x=25; x<width; x+=50) {
    for (int y=25; y<height; y+=50) {
      pushMatrix();
      translate(x, y);
      rotateY(rot);
      scale(cos(rot), sin(rot), cos(rot));
      sphere(50);
      popMatrix();
    }
  }

  rot = (rot+PI/100)%TWO_PI;
}