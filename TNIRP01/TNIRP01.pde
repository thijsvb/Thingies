int w = 15;
int n = 0;
int cols, rows;

void setup() {
  size(600, 600);
  background(0);
  noFill();
  stroke(255);
  
  cols = floor(width/w);
  rows = floor(height/w);
}

void draw() {
  tile(n%cols, floor(n++/rows), w, floor(random(4)));
  if(n == cols*rows) noLoop();
}

void tile(int x, int y, float s, int o) {
  pushMatrix();
  translate(x*s + s/2, y*s + s/2);
  rotate(o%4 * HALF_PI);
  
  //line(-s/2, -s/2, s/2, s/2);
  
  //line(-s/2, 0, 0, -s/2);
  //line(s/2, 0, 0, s/2);
  
  
  
  //arc(s/2, s/2, s, s, PI, 3*PI/2);
  arc(-s/2, -s/2, s, s, 0, PI/2);
  
  arc(-s/2, -s/2, 2*s, 2*s, 0, PI/2);
  
  popMatrix();
}