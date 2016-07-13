void setup() {
  size(1000, 500, P3D); 
  stroke(255);
  textSize(15);
  textAlign(CENTER, CENTER);
}

float mina = 100;
float maxa = -100;
float minr = 100;
float maxr = -100;

void draw() {
  float rx =random(-100, 100);
  float ry =random(-100, 100);
  float n = r(rx, ry);
  float m = a(rx, ry);
  while (n < 0) {
    println(n + " OH NO!");
  }  
  println(n+"  |  "+m);

  if (n < minr) {
    minr = n;
  }
  if (n > maxr) {
    maxr = n;
  }
  if (m < mina) {
    mina = m;
  }
  if (m > maxa) {
    maxa = m;
  }
  background(0);  
  fill(255);
  text(minr+"   "+mina+'\n'+maxr+"   "+maxa, width/2, height/2);
  text(r(mouseX-width/2,mouseY-height/2)+", "+a(mouseX-width/2,mouseY-height/2),mouseX,mouseY);
  noFill();
  ellipse(width/2,height/2,400,400);
}


float r(float x, float y) {
  return sqrt(x*x + y*y);
}

float a(float x, float y) {
  if (x == 0) {
    if (y >= 0) {
      return HALF_PI;
    } else {
      return -HALF_PI;
    }
  }

  if (x > 0) {  
    return (atan(y/x)+TWO_PI)%TWO_PI;
  } else {
    return atan(y/x)+PI;
  }
}