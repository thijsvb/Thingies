int sticker = 0;

void setup() {
  size(500, 500);
}

void draw() {
  switch(sticker) {
  case 0:
    fill(0);
    noStroke();
    rect(0, 0, 500, 500);
    stroke(255);
    for (int i=0; i<=500; i+=10) {
      line(500, 0, i, i);
      line(0, 500, i, i);
    }
    break;

  case 1:
    fill(0);
    noStroke();
    rect(0, 0, 500, 500);
    stroke(255);
    for (int i=0; i<=500; i+=10) {
      line(500, i, 500-i, 500);
      line(i, 0, 500, i);
      line(0, i, 500-i, 0);
      line(i, 500, 0, i);
    }
    break;

  case 2:
    fill(0);
    noStroke();
    rect(0, 0, 500, 500);
    for (int i=0; i<=250; i+=5) {
      stroke(i);
      line(i, 0, 500-i, 500);
      line(500-i, 0, i, 500);
    }
    break;

  case 3:
    fill(0);
    noStroke();
    rect(0, 0, 500, 500);
    for (int i=0; i<=500; i+=5) {
      stroke(0, i/2, 255);
      line(500, 0, i, i);
      stroke(0, 255, 255-i/2);
      line(0, 500, i, i);
    }
    break;

  case 4:
    fill(0);
    noStroke();
    rect(0, 0, 500, 500);
    colorMode(HSB);
    for (int i=0; i<=500; ++i) {
      stroke(255-i/2, 255, 255);
      for (int j=0; j!=5; ++j) {
        point(i, 75 + j*100 - 25*sin(TWO_PI*i/100));
      }
      stroke(i/2, 255, 255);
      for (int j=0; j!=5; ++j) {
        point(i, 25 + j*100 + 25*sin(TWO_PI*i/100));
      }
    }
    break;
  }
}

void mousePressed() {
  if (mouseButton == RIGHT && sticker > 0) {
    --sticker;
  } else if (mouseButton == LEFT && sticker < 4) {
    ++sticker;
  }
}