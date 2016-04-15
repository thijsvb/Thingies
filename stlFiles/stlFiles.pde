import java.io.OutputStream;

PrintWriter file;
OutputStream binfile;
char[] c = new char[80];
byte[] b = new byte[80];
String string = "This header is useless";
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
  binfile = createOutput("thingBin.stl");
  s = createShape();
  for (int i=0; i!=80; ++i) {
    c[i] = string.charAt(i%string.length());
    b[i] = byte(c[i]);
  }

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

  try {
    for (int i=0; i!=80; ++i) {
      binfile.write(b[i]);      //useless header, as long as it doesn't begin with "solid"
    }

    binfile.write(0);
    binfile.write(0);
    binfile.write(0);
    binfile.write(4); //needs to be a 32 bit number, so yeah...
    for (int i=0; i<s.getVertexCount(); i+=3) {
      binfile.write(0);
      binfile.write(0);
      binfile.write(0);
      binfile.write(0);
      binfile.write(0);
      binfile.write(0);
      binfile.write(0);
      binfile.write(0);
      binfile.write(0);
      binfile.write(0);
      binfile.write(0);
      binfile.write(0);//normal vector, doesn't matter
      for (int j=0; j!=3; ++j) {
        float x = s.getVertex(i+j).x;
        float y = s.getVertex(i+j).y;
        float z = s.getVertex(i+j).z;

        int convertX = Float.floatToIntBits(x);
        int convertY = Float.floatToIntBits(y);
        int convertZ = Float.floatToIntBits(z);

        binfile.write((convertX >> 24) & 0xff);
        binfile.write((convertX >> 16) & 0xff);
        binfile.write((convertX >> 8) & 0xff);
        binfile.write(convertX);
        binfile.write((convertY >> 24) & 0xff);
        binfile.write((convertY >> 16) & 0xff);
        binfile.write((convertY >> 8) & 0xff);
        binfile.write(convertY);
        binfile.write((convertZ >> 24) & 0xff);
        binfile.write((convertZ >> 16) & 0xff);
        binfile.write((convertZ >> 8) & 0xff);
        binfile.write(convertZ);
      }
      binfile.write(0);
      binfile.write(0);  //attribute byte count (16 bit), never used
    }
    binfile.flush();
    binfile.close();
  }
  catch(IOException e) {
    println("Oh no! " + e);
  }
}

void draw() {
  background(0);
  translate(width/2, height/2);
  rotateY(map(mouseX, 0, width, 0, TWO_PI));
  rotateX(map(mouseY, 0, height, 0, TWO_PI));
  shape(s);
}