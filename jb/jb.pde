void setup() {
  ArrayList<String> lln = new ArrayList<String>();
  int num = 300;
  
  for(int i=0; i!=num; ++i){
    String s = "122" + floor(random(10)) + floor(random(10)) + floor(random(10));
    lln.add(s);
  }
  
  size(990, 700);
  background(128);
  
  int tSize = 24;
  PFont f = createFont("monospace", tSize);
  textFont(f);
  textAlign(LEFT, TOP);

  int nx = floor(width/textWidth(lln.get(0)));
  int ny = num/nx;
  
  float xOff = (width%textWidth(lln.get(0))) / 2;
  float yOff = (height - ny*tSize) / 2;

  String[] lines = new String[ny];
  for(int i=0; i!=ny; ++i) {
    lines[i] = "";
    for(int j=0; j!=nx; ++j){
      if(i*nx + j == lln.size()) break;
      lines[i] += lln.get(i*nx + j);
    }
  }
  
  float dy = tSize;
  float dx = textWidth('0');
  
  PImage logo = loadImage("logo_quintus.png");
  
  for(int i=0; i!=ny; ++i) {
    for(int j=0; j!=nx*6; ++j) {
      int x = round(xOff + j*dx);
      int y = round(yOff + i*dy);
      
      color c = logo.pixels[y*logo.width + x];
      fill(c);
      
      text(lines[i].charAt(j), x, y);
    }
  }
  
  save("jb24.png");
}

void draw() {
  
}