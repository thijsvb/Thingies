int n = int(random(7, 36));
PVector[] v = new PVector[n];
PVector[] c = new PVector[n];

void setup() {
  size(600, 600);
  noStroke();
  setV();
}

void draw() {
  background(0);


  fill(128, 255, 0);
  for (int i=0; i!=n; ++i) {
    c[i].add(v[i]);
    ellipse(c[i].x, c[i].y, 5, 5);
  }


  fill(#FFCC99);
  triangle(0, 0, 0, 200, 100, 200);
}

void setV() {
  n = int(random(7, 36));
  println(n);
  v = new PVector[n];
  c = new PVector[n];

  for (int i=0; i!=n; ++i) {
    v[i] = new PVector(random(0, width), height);
    v[i].setMag(random(5, 10));
    c[i] = new PVector(0, random(100, 200));
  }
}

void mousePressed() {
  setV();
}