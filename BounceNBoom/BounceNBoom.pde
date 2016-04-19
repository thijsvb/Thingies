PVector b[] = new PVector[100];
PVector v[] = new PVector[100];
color c[] = new color[100];
int n = 0;

void setup() {
  size(600, 600);
  stroke(255);
  fill(c[n]);
  b[0] = new PVector(300, 300);
  v[0] = new PVector(2, 2);
  colorMode(HSB);
  for (int i=0; i!=100; ++i) {
    c[i] = color(random(255), 255, 255);
  }
}

void draw() {
  background(0);

  for (int i=0; i!=n+1; ++i) {
    ellipse(b[i].x, b[i].y, 50, 50);
    b[i].add(v[i]);
    
    if(b[i].x < 25 || b[i].x > 575){
      v[i].set(-v[i].x,v[i].y);
    }
    if(b[i].y < 25 || b[i].y > 575){
      v[i].set(v[i].x,-v[i].y);
    }
  }
  
}

void mouseClicked() {
  ++n;
  b[n] = new PVector(0, 0);
  v[n] = new PVector(0, 0);
  fill(c[n]);
  for (int i=0; i!=n; ++i) {
    v[i+1].set(v[i].rotate(PI/4));
    b[i+1].set(b[i]);
    v[i].rotate(-PI/2);
  }
}