float h = 1;

PShape korrel(float r, float k) {
  PShape korrel = createShape();
  korrel.beginShape();
  for (float a=0; a<TWO_PI; a+=PI/42) {
    float x = cos(a)*r + random(-k,k);
    float y = sin(a)*r + random(-k,k);
    korrel.vertex(x, y);
  }
  korrel.endShape();

  return korrel;
}

void setup() {
  size(600, 600);
  noStroke();
  fill(192, 128, 0);

  background(0);
  for(float x=width/13; x<width-width/13; x+=width/13){
    for(float y=height/13; y<height-height/13; y+=width/13){
      pushMatrix();
      translate(x,y);
      shape(korrel(width/30, h));
      popMatrix();
    }
  }
}

void draw(){}

void keyPressed(){
  if(key == CODED){
    if(keyCode == UP){
      ++h;
    }
    else if(keyCode == DOWN && h>0){
      --h;
    }
  }
  setup();
}