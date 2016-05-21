import g4p_controls.*;

float a, b, m, n1, n2, n3;

void setup() {
  size(1000, 500);
  createGUI();
}

void draw() { 
  m = mSlider.getValueF();
  n1 = n1Slider.getValueF();
  n2 = n2Slider.getValueF();
  n3 = n3Slider.getValueF();
  a = aSlider.getValueF();
  b = bSlider.getValueF();
  
  background(0);
  pushMatrix();
  translate(250, 250);
  stroke(255);
  for (float a=0; a<TWO_PI; a+=PI/180) {
    point(cos(a)*sf(a)*50, sin(a)*sf(a)*50);
  }
  popMatrix();
}

float sf(float angle) {
  return pow( pow( abs( cos(m*angle/4)/a ), n2 ) + pow( abs( sin(m*angle/4)/b ), n3 ), -1/n1);
}