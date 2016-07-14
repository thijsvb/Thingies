float CartesianToPolarR(float x, float y) {
  return sqrt(x*x + y*y);
}

float CartesianToPolarA(float x, float y) {
  if (x == 0) {
    if (y >= 0) {
      return HALF_PI;
    } else {
      return -HALF_PI;
    }
  }

  if (x > 0) {  
    return (atan(y/x)+TWO_PI)%TWO_PI;
  } else {
    return atan(y/x)+PI;
  }
}

float PolarToCartesianX(float r, float a) {
  return cos(a)*r;
}

float PolarToCartesianY(float r, float a) {
  return sin(a)*r;
}