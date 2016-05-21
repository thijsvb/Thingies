float t1, t2;
float[] x = new float[500];
float[] y = new float[500];
int n = 0;

void setup() {
  size(500, 500);
}

void draw() {
  background(0);
  t1 = millis()/1000.0000;
  t2 = millis()/1000.0000 + 1000;
  x[n] = map(noise(t1), 0, 1, -25, 25);
  y[n] = map(noise(t2), 0, 1, -25, 25);
  noStroke();
  ellipse(250 + x[n], 250 + y[n], 400, 400);

  for (int i=0; i!=500; ++i) {
    stroke(map((n-i+500)%500, 0, 500, 0, 256));
    point(250+x[i], 250+y[i]);
  }
  n = (n+1)%500;
}