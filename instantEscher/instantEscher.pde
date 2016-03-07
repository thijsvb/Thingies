void setup() {
  size(600, 600);
  noStroke();
  fill(0);
}

void draw() {
}

void mousePressed() {
  background(255);
  int r = int(random(3, 15));
  PShape s = createShape();
  s.beginShape();
  for (int i=0; i!=r; ++i) {
    s.vertex(random(100), random(100));
  }
  s.endShape();
  translate(-shapeMin(s).x, -shapeMin(s).y);
  int mx = 0;
  int my = 0;
  for (int x=0; x<width; x+=shapeWidth(s)) {
    for (int y=0; y<height; y+=shapeHeight(s)) {
      if (mx%2 == 0 && my%2 == 0) {
        shape(s, x, y);
      } else if (my%2 == 0) {
        shape(xMirror(s), x, y);
      } else if (mx%2 == 0) {
        shape(yMirror(s), x, y);
      } else {
        shape(xMirror(yMirror(s)), x, y);
      }
      ++my;
    }
    ++mx;
  }
}

PShape xMirror(PShape s) {
  PShape r = createShape();
  r.beginShape();
  for (int i=0; i!=s.getVertexCount(); ++i) {
    r.vertex(shapeWidth(s)-s.getVertex(i).x, s.getVertex(i).y);
  }
  r.endShape();
  return r;
}

PShape yMirror(PShape s) {
  PShape r = createShape();
  r.beginShape();
  for (int i=0; i!=s.getVertexCount(); ++i) {
    r.vertex(s.getVertex(i).x, shapeHeight(s)-s.getVertex(i).y);
  }
  r.endShape();
  return r;
}

float shapeWidth(PShape s) {
  float min = s.getVertex(0).x;
  float max = min;
  for (int i=0; i!=s.getVertexCount(); ++i) {
    if (s.getVertex(i).x < min) {
      min = s.getVertex(i).x;
    }
    if (s.getVertex(i).x > max) {
      max = s.getVertex(i).x;
    }
  }
  return max - min;
}

float shapeHeight(PShape s) {
  float min = s.getVertex(0).y;
  float max = min;
  for (int i=0; i!=s.getVertexCount(); ++i) {
    if (s.getVertex(i).y < min) {
      min = s.getVertex(i).y;
    }
    if (s.getVertex(i).y > max) {
      max = s.getVertex(i).y;
    }
  }
  return max - min;
}

PVector shapeMin(PShape s) {
  PVector min = s.getVertex(0);
  for (int i=0; i!=s.getVertexCount(); ++i) {
    if (s.getVertex(i).y < min.y) {
      min.y = s.getVertex(i).y;
    }
  }
  for (int i=0; i!=s.getVertexCount(); ++i) {
    if (s.getVertex(i).x < min.x) {
      min.x = s.getVertex(i).x;
    }
  }
  return min;
}