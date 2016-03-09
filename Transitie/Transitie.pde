PShape s;
PShape e;

void setup() {
  size(600, 300);
  background(255);
  noStroke();
  s = createShape();
  e = createShape();
  s.disableStyle();
  s.beginShape();
  for (int i=0; i!=8; ++i) {
    s.vertex(random(100), random(100));
  }
  s.endShape();
  e.disableStyle();
  e.beginShape();
  for (int i=0; i!=8; ++i) {
    e.vertex(random(100), random(100));
  }
  e.endShape();

  fill(64);
  shape(s, 0, 100);
  for (int i=1; i!=5; ++i) {
    fill(map(i, 0, 5, 64, 192));
    shape(shift(s, e, float(i)/5), i*100, 100);
  }
  fill(192);
  shape(e, 500, 100);
}

void draw() {
}

void mousePressed(){
  setup();
}

PShape shift(PShape s, PShape e, float f) {
  PShape r = createShape();
  if (s.getVertexCount() != e.getVertexCount()) {
    return r;
  }
  r.beginShape();
  for (int i=0; i!=s.getVertexCount(); ++i) {
    r.vertex(0, 0);
  }
  r.endShape();

  for (int i=0; i!=e.getVertexCount(); ++i) {
    r.setVertex(i, map(f, 0, 1, s.getVertex(i).x, e.getVertex(i).x), map(f, 0, 1, s.getVertex(i).y, e.getVertex(i).y));
  }
  return r;
}