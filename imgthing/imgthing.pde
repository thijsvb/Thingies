PImage img;

int res = 10;
float total, hue, sat, bri;

void setup() {
  size(800, 600, P3D);
  colorMode(HSB);
  img = loadImage("input.jpeg");
}

void draw() {
  background(255);

  for (int i=0; i!=img.width*img.height; ++i) {
    total += brightness(img.pixels[i]);
  }
  hue = total/(img.width*img.height);
  total = 0;
  //println('H');
  //println(hue);
  //println('S');

  for (int x=res; x<img.width-res; x+=res) {
    for (int i=0; i!=img.height; ++i) {
      total += brightness(img.pixels[i*img.width+x]);
    }
    sat = total/img.height;
    total = 0;
    //println(sat);
    stroke(hue, sat, 255);
    for (int y=0; y<img.height-res; y+=res) {
      line(x, y, brightness(img.pixels[y*img.width+x])/2, x, y+res, brightness(img.pixels[(y+res)*img.width+x])/2);
    }
  }
  //println('B');
  for (int y=res; y<img.height-res; y+=res) {
    for (int i=0; i!=img.width; ++i) {
      total += brightness(img.pixels[y*img.width+i]);
    }
    bri = total/img.height;
    total = 0;
    //println(bri);
    stroke(hue, 255, bri);
    for (int x=0; x<img.width-res; x+=res) {
      line(x, y, brightness(img.pixels[y*img.width+x])/2, x+res, y, brightness(img.pixels[y*img.width+(x+res)])/2);
    }
  }
}

void keyPressed() {
  if (key == 's' || key == 'S') {
    save("output.jpg");
  } else if (key == CODED) {
    if (keyCode == UP) {
      ++res;
    }
    if (keyCode == DOWN && res > 1) {
      --res;
    }
  }
}