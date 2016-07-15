final float k = 1; //radial distortion coefficient

void setup() {
  size(1000,500,P2D);
  PImage input = loadImage("test.png");
  image(input, 0, 0);
  image(barrel(input), 500, 0);
}

void draw() {
}

PImage barrel(PImage img) {
  PImage output = createImage(img.width, img.height, ARGB);
  
  for(int i=0; i!=output.width*output.height; ++i){
    output.pixels[i] = color(0,255,0);
  }
  
  for (float x=0; x!=img.width; ++x) {
    for (float y=0; y!=img.height; ++y) {
      float oldR = CartesianToPolarR(x, y);
      float a = CartesianToPolarA(x, y);
      
      float newR = oldR;      
      
      float newX = PolarToCartesianX(newR, a);
      float newY = PolarToCartesianY(newR, a);
      
      //println(newX + ", " + newY);
      output.pixels[(int)(newY*output.width + newX)] = img.pixels[(int)(y*img.width + x)];
    }
  }
  float green = 0;
  for(int i=0; i!=output.width*output.height; ++i){
    if(output.pixels[i] == color(0,255,0)){
      ++green;
    }
  }
  println(green/(output.width*output.height)*100+"% was lost");
  return output;
}