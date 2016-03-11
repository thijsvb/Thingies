final int d = 30;
float xr, yr, zr;

void setup() {
  size(600, 600, P3D);
  background(0);
}

void draw() {
  translate(width/2, height/2, width/2);
  rotateX(xr);
  rotateY(yr);
  rotateZ(zr);
  background(0);
  stroke(255, 0, 0);
  line(0,0,0, width/2,0,0);
  line(0,0,0, 0,width/2,0);
  line(0,0,0, 0,0,width/2);
  stroke(0, 255, 0);
  for (int x=-width/2; x<width/2; x+=d) {
    for (int y=-width/2; y<width/2; y+=d) {
      for (int z=-width/2; z<width/2; z+=d) {
        point(x, y, z);
      }
    }
  }
  if (keyPressed) {
    if (key == 'z') {
      zr+=PI/64;
    }
    if (key == 'y') {
      yr+=PI/64;
    }
    if (key == 'x') {
      xr+=PI/64;
    }
    if(key == 'r'){
      xr = 0;
      yr = 0;
      zr = 0;
    }
    if(key == 'q'){
      xr += random(-PI/64,PI/64);
      yr += random(-PI/64,PI/64);
      zr += random(-PI/64,PI/64);
    }
  }
}