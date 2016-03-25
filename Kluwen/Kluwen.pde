float f = 1, o = 0;

void setup() {
  size(600, 600);
  stroke(0, 128, 0);
  background(255);
  translate(width/2, height/2);
  PVector v = new PVector(1, 0);
  PVector p = new PVector(0, 0);
  for (float i=1; i<=width/2; i+=f) {
    p.set(v);
    v.rotate(PI/50).setMag(i + random(-o, o));
    line(v.x, v.y, p.x, p.y);
  }
}

void draw() {
}

void mousePressed() {
  if (mouseButton == LEFT) {
    f *= 2;
  } else if (mouseButton == RIGHT) {
    f *= 0.5;
  }
  setup();
}

void keyPressed() {
  if (key == CODED && keyCode == UP) {
    ++o;
  } else if (key == CODED && keyCode == DOWN && o > 0) {
    --o;
  }
  setup();
}