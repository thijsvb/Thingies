

void setup() {
  size(600, 600, P3D);
  stroke(0);
  fill(160,160,0);
}

void draw() {
  background(128);
  translate(width/2, height/2, -300);
  rotateY(map(mouseX,-width,width,-PI,PI));
  shape(korrel(200, 100, 15));
}

PShape korrel(float r, int res, int k) {
  PShape s = createShape();
  s.beginShape();
  for (float b=0; b<TWO_PI; b+=TWO_PI/res) {
    for (float a=0; a<TWO_PI; a+=TWO_PI/res) {
      s.vertex(cos(a)*sin(b)*(r+random(-k, k)), cos(b)*(r+random(-k, k)), sin(a)*sin(b)*(r+random(-k, k)));
    }
  }
  s.endShape(CLOSE);
  return s;
}