float c = 0;

void setup() {
  size(500, 500);
  colorMode(HSB);
  strokeWeight(3);
}

void draw() {
  c = (c+1)%256;
  background(0);
  stroke(c,255,128);
  fill(255-c,255,255);
  translate(width/2, height/2);
  for (int i=0; i!=8; ++i) {
    pushMatrix();
    float a = map(i, 0, 8, 0, TWO_PI);
    rotate(a);
    float m = 0;
    if (i%2 == 0) {
      m = -1;
    } else if (i%2 == 1) {
      m = 1;
    }
    scale(1, m);
    for (float l=0; l<QUARTER_PI; l+=QUARTER_PI/10) {
      pushMatrix();
      rotate(l*m);
      rect(0, 0, 150+(sin(map(c,0,256,0,TWO_PI))*100), cos(map(c,0,256,0,TWO_PI))*25);
      popMatrix();
    }
    popMatrix();
  }
}