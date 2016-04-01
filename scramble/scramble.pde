PVector[] v = new PVector[0];

void setup() {
  size(600, 600);
  setPoints(1, 0);
  stroke(255);
}

void draw() {
  drawPoints();
}

void mousePressed() {
  setPoints(floor(mouseX), map(mouseY, 0, height, 0, 20));
}

void drawPoints() {
  background(0);
  for (int i=0; i!=v.length; ++i) {
    point(v[i].x, v[i].y);
  }
}

void setPoints( int n, float k) {
  v = new PVector[n];
  int w = floor(sqrt(v.length));
  float d = width/(w+1);
  for (int i=0; i!=v.length; ++i) {
    float x = (i%w + 1) * d;
    float y = floor(i/w + 1) * d;
    v[i] = new PVector(x + random(-k, k), y + random(-k, k));
  }
}