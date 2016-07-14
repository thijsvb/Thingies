final float k = 1; //radial distortion coefficient

void setup() {
  size(64, 32);
  PImage input = loadImage("minion.png");
  image(input, 0, 0);
  image(barrel(input), 32, 0);
}

void draw() {
}

PImage barrel(PImage img) {
  PImage output = createImage(img.width*100, img.height*100, ARGB);
  for (float x=0; x!=img.width; ++x) {
    for (float y=0; y!=img.height; ++y) {
      float oldR = CartesianToPolarR(x, y);
      float a = CartesianToPolarA(x, y);
      
      float newR = oldR*(1 + k*oldR*oldR);      
      
      float newX = PolarToCartesianX(newR, a);
      float newY = PolarToCartesianY(newR, a);
      
      println(newX + ", " + newY);
      output.pixels[(int)(newY*output.width + newX)] = img.pixels[(int)(y*img.width + x)];
    }
  }
  
  return output;
}