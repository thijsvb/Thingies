
PGraphics g;

void setup() {
  size(1000, 700);
  background(255);
  color a = color(0, 255, 0);
  color b = color(0, 255, 255);
  g = createGraphics(width, height);
  g.beginDraw();
  g.noFill();
  for (float i=0; i!=width; ++i) {
    g.stroke(lerpColor(a, b, i/width));
    g.line(i, 0, i, height);
  }
  g.stroke(0, 0, 255, 128);
  for (float i=0; i<width; i+=random(50)) {
    g.line(i, 0, width-i, height);
    g.line(0, i, width, height-i);
  }
  g.stroke(0, 255, 128, 128);
  for (float i=0; i<width; i+=random(20)) {
    g.triangle(i, random(height), i+random(-10, 0), random(height), i+random(10), random(height));
  }
  g.noStroke();
  g.fill(0);
  float[][] x = {{10, random(150, 250), random(350, 450), random(550, 650), random(750, 850), 990}, 
    {10, random(150, 250), random(350, 450), random(550, 650), random(750, 850), 990}, 
    {10, random(150, 250), random(350, 450), random(550, 650), random(750, 850), 990}};
  float[] y = {350, random(150, 550), random(150, 550), random(150, 550), random(150, 550), random(150, 550), 350};
  for (int i=0; i!=5; ++i) {
    g.quad(x[0][i]+10, 20, 
      x[1][i]+10, y[i]-10, 
      x[1][i+1]-10, y[i+1]-10, 
      x[0][i+1]-10, 20);
  }
  for (int i=0; i!=5; ++i) {
    g.quad(x[2][i]+10, 680, 
      x[1][i]+10, y[i]+10, 
      x[1][i+1]-10, y[i+1]+10, 
      x[2][i+1]-10, 680);
  }
  g.endDraw();
}

void draw() {
  println(g.pixelCount);
  image(g, 0, 0);
}

void keyPressed() {
  if (key == 's'||key == 'S') {
    g.save("thing.png");
  } else {
    setup();
  }
}