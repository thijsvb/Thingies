float a;

void setup(){
  colorMode(HSB);
  fullScreen(P3D);
}

void draw(){
  background(0);
  
  a+=PI/64;
  a=a%TWO_PI;
  
  for(float i=20; i<=width-20; i+=20){
    for(float j=20; j<=height-20; j+=20){
      pushMatrix();
      
      fill((map(a,0,TWO_PI,0,256)+j/height*256)%256,255,128);
      stroke((128+map(a,0,TWO_PI,0,256)+i/width*256)%256,255,255);
      strokeWeight(cos((a + i/width*TWO_PI) * 8)*4 + sin((a + j/height*TWO_PI) * 6)*4);
      
      translate(i,j, cos(7 * (i/width*TWO_PI + a))*10 + sin(7 * (j/height*TWO_PI + a))*10);
      rotateY(a + i/width*TWO_PI);
      rotateX(a + j/height*TWO_PI);
      rotateZ(PI/4);
      
      box(10 + i/20%2*5 + j/20%2*5);
      
      popMatrix();
    }
  }
}