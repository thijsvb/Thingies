PShape s;
float r = 100;
float sx[] = new float[514];
float sy[] = new float[514];
float sz[] = new float[514];

void setup(){
  size(500, 500, P3D);
  fill(0,128);
  stroke(0);
  sx[0] = 0;
  sy[0] = -r;
  sz[0] = 0;
  int i = 1;
  for(float phi=0; phi<=PI; phi+=PI/16){
    for(float theta=0; theta<=TWO_PI; theta+=PI/16){
      sx[i] = cos(theta)*sin(phi)*r;
      sy[i] = cos(phi)*r;
      sz[i] = sin(theta)*sin(phi)*r;
      ++i;
    }
  }
  sx[i] = 0;
  sy[i] = -r;
  sz[i] = 0;
  
  s = createShape();
  s.beginShape();
  for(int j=0; j!=514; ++j){
    s.vertex(sx[j], sy[j], sz[j]);
  }
  s.endShape();
  println(s.getVertexCount());
}

void draw(){
  background(255);
  translate(width/2,height/2);
  rotateX(map(mouseY, 0, height, PI, -PI));
  rotateY(map(mouseX, 0, width, -PI, PI));
  shape(s,0,0);
}