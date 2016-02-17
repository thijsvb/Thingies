

void setup(){
  fullScreen(P3D);
  noFill();
  stroke(255);
  sphereDetail(10);
}

void draw(){
  background(0);
  for(int i=0; i<=width; i+=25){
    for(int j=0; j<=height; j+=25){
      pushMatrix();
      translate(i,j,-dist(i,j,mouseX,mouseY));
      sphere(10);
      popMatrix();
    }
  }
}