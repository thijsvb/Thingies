PrintWriter file;
PShape s;
float v[][] = {
  {0, 0, 0}, 
  {100, 0, 0}, 
  {50, 100, 0}, 
  {50, 50, 100}
};

void setup() {
  size(500, 500, P3D);
  fill(128);
  stroke(0, 255, 0);
  file = createWriter("thing.stl");
  s = createShape();

  s.beginShape(TRIANGLES);
  for (int i=0; i!=4; ++i) {
    for (int j=0; j!=3; ++j) {
      s.vertex(v[(i+j)%4][0], v[(i+j)%4][1], v[(i+j)%4][2]);
    }
  }
  s.endShape();

  file.println("solid thing");
  for (int i=0; i!=4; ++i) {
    file.println("facet normal 0 0 0");    //Not the most correct way, but should work with most software
    file.println("outer loop");

    for (int j=0; j!=3; ++j) {
      file.print("vertex ");
      file.print(v[(i+j)%4][0]);
      file.print(' ');
      file.print(v[(i+j)%4][1]);
      file.print(' ');
      file.println(v[(i+j)%4][2]);
    }

    file.println("endloop");
    file.println("endfacet");
  }
  file.println("endsolid");
  file.flush();
  file.close();
}

void draw() {
  background(0);
  translate(width/2, height/2);
  rotateY(map(mouseX, 0, width, 0, TWO_PI));
  rotateX(map(mouseY, 0, height, 0, TWO_PI));
  shape(s);
}