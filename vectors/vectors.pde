PVector v = new PVector(0, 0);
PVector bl = new PVector(0, 0);
PVector bv = new PVector(6, 4);
color ca, cb;

void setup() {
  size(500, 500);
  colorMode(HSB);
}

void draw() {
  translate(width/2, height/2);
  v.set(mouseX-width/2, mouseY-height/2).normalize().mult(200);
  ca = color(map(v.heading(), -PI, PI, 0, 256), 255, 255);

  background(0);

  if (bl.x > width/2 || bl.x < -width/2) {
    bv.x = bv.x * -1;
  }
  if (bl.y > height/2 || bl.y < -height/2) {
    bv.y = bv.y * -1;
  }
  bl.add(bv);
  cb = color(map(bl.heading(), PI, -PI, 0, 256), 255, 255);
  fill(cb);
  ellipse(bl.x, bl.y, 50, 50);

  stroke(ca);
  fill(ca, 128);
  rotate(v.heading());
  rect(-10, -10, v.mag(), 20, 10);
}