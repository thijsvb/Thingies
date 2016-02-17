PImage img;
final int detail = 10;
float total, hue, sat, bri;


void setup() {
  size(220, 298, P3D);
  colorMode(HSB);
  img = loadImage("input.jpg");
  background(255);
  stroke(0);
  for(int i=0; i!=img.width*img.height; ++i){
    total += brightness(img.pixels[i]);
  }
  hue = total/(img.width*img.height);
  total = 0;

  for (int x=detail; x<=img.width; x+=detail) {
    for(int i=0; i!=img.height; ++i){
      total += brightness(img.pixels[i]);
    }
    bri = total/img.height;
    total = 0;
    for (int y=detail; y<=img.height; y+=detail) {
      stroke(hue, hue, bri);
      line(x, y-detail, brightness(img.pixels[(y-detail)*(img.width-1)+x])/5, x, y, brightness(img.pixels[y*(img.width-1)+x])/5);
    }
  }
  for (int y=detail; y<=img.height; y+=detail) {
    for(int i=0; i!=img.width; ++i){
      total += brightness(img.pixels[i]);
    }
    sat = total/img.width;
    total = 0;
    for (int x=detail; x<=img.width; x+=detail) {
      stroke(hue, sat, hue);
      line(x-detail, y, brightness(img.pixels[y*(img.width-1)+x-detail])/5, x, y, brightness(img.pixels[y*(img.width-1)+x])/5);
    }
  }
}

void draw() {
}