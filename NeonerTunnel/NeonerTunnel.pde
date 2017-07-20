int sym = 6;
int rot = 0;
float angle = 0;
Snake snake;

void setup() {
  //size(600, 600);
  fullScreen();
  colorMode(HSB);
  strokeWeight(2);
}

void draw() {
  background(0);
  translate(width/2, height/2);
  if (rot == 1) rotate(angle+=PI/200);
  if (rot == 2) rotate(angle-=PI/200);
  if (snake != null) snake.show();
}

void mouseClicked() {
  float x = mouseX - width/2;
  float y = mouseY - height/2;
  if (snake == null) {
    snake = new Snake(x, y);
  } else {
    snake.add(x, y);
  }
}

void keyPressed() {
  switch(key) {
  case ' ':
    snake = null;
    break;

  case ',':
    if (sym != 1) --sym;
    break;

  case '.':
    ++sym;
    break;

  case '/':
    rot = (rot+1)%3;
    break;
  }
}

class Snake {
  ArrayList<Point> vertex;

  Snake(float x, float y) {
    vertex = new ArrayList<Point>();
    vertex.add(new Point(x, y));
  }

  void add(float x, float y) {
    vertex.add(new Point(x, y));
  }

  void show() {
    for (int i=0; i!=vertex.size()-1; ++i) {
      pushMatrix();
      for (int j=0; j!=sym; ++j) {
        rotate(TWO_PI/sym);
        stroke(i*32%255, 255, 255);
        Point v1 = vertex.get(i);
        Point v2 = vertex.get(i+1);
        line(v1.x, v1.y, v2.x, v2.y);
      }
      popMatrix();
    }

    for (Point p : vertex) {
      p.move();
    }
  }
}

class Point {
  float x, y, xoff, yoff, t;

  Point(float X, float Y) {
    x = X;
    y = Y;
    xoff = random(1000);
    yoff = random(1000);
    t = 0;
  }

  void move() {
    x += (noise(xoff + t) - 0.5)*3;
    y += (noise(yoff + t) - 0.5)*3;
    
    t += 0.001;
  }
}