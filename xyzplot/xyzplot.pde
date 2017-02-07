PShape plot;
PVector o;

void setup() {
  size(500, 500, P3D);
  background(0);
  noFill();
  stroke(255);
  
  Table data = loadTable("data.csv");
  int rows = data.getRowCount(), cols = data.getColumnCount();
  
  println(rows, cols);
  
  float max = 0, min = 100;
  for(int i=0; i!=rows; ++i) {
    for(int j=0; j!=cols; ++j) {
      float current = data.getFloat(i, j);
      if(current > max) max = current;
      if(current < min) min = current;
    }
  }
  println(min, max);
  
  plot = createShape();
  plot.beginShape();
  for(int i=0; i!=rows; ++i) {
    float x = map(data.getFloat(i, 0), min, max, 0, width);
    float z = map(data.getFloat(i, 1), min, max, 0, -width);
    float y = map(data.getFloat(i, 2), min, max, width, 0);
    
    plot.vertex(x, y, z);
  }
  plot.endShape();
  
  o = new PVector(map(data.getFloat(1,0), min, max, 0, width),
                  map(data.getFloat(1,2), min, max, width, 0),
                  map(data.getFloat(1,1), min, max, 0, -width));
  
}

float a = 0;

void draw() {
  a = (a+PI/60)%TWO_PI;
  background(0);
  translate(-150, 200,0);
  translate(o.x,o.y,o.z+250);
  rotateY(a);
  translate(-o.x,-o.y,-o.z-250);
  
  stroke(255, 0, 0);
  line(o.x, o.y, o.z, o.x+100, o.y, o.z);
  stroke(0, 255, 0);
  line(o.x, o.y, o.z, o.x, o.y-100, o.z);
  stroke(0, 0, 255);
  line(o.x, o.y, o.z, o.x, o.y, o.z+100);
  shape(plot);
}