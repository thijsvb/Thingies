PShape plot;

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
  
}

void draw() {
  background(0);
  translate(0, 0,0);
  shape(plot);
}