
float R = 100;
float H = 100;
int N = 6;

void setup(){
  size(500,500,P3D);
  noFill();
  //stroke(0,255,0);
  colorMode(HSB);
}

void draw(){
  N = floor(sin(millis()*PI/2000)*15) + 21;
  H = sin(millis()*PI/3000)*150 + 200;
  R = sin(millis()*PI/5000)*75 + 100;
  stroke((millis()*255/7000)%255, 255, 255);
  
  background(0);
  translate(width/2,height/2);
  rotateX(-PI/8);
  rotateY(millis()*PI/1000);
  shape(thing(N,H,R));
}

PShape thing(int n, float h, float r){
  PShape s = createShape();
  s.beginShape();
    for(int i=0; i!=n; ++i){
      float a = i*TWO_PI/n;
      s.vertex(cos(a)*r, -h/2, sin(a)*r);
    }
    for(int i=0; i!=n; ++i){
      float a = i*TWO_PI/n;
      s.vertex(cos(a)*r, -h/2, sin(a)*r);
      s.vertex(cos(a)*r, h/2, sin(a)*r);
    }
    for(int i=0; i!=n; ++i){
      float a = i*TWO_PI/n;
      s.vertex(cos(a)*r, h/2, sin(a)*r);
    }
  s.endShape(CLOSE);
  
  return s;
}