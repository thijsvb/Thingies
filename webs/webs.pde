size(500, 500);
background(0);
stroke(255);
for (int j=0; j!=10; ++j) {
  float max = 500 * pow(0.582656, j);
  for (int i=0; i<=max; i+=30 * pow(0.582656,j)) {
    line(i, 0, max, i);
    line(max, i, max-i, max);
    line(max-i, max, 0, max-i);
    line(0, max-i, i, 0);
  }
  translate(max/2,max*0.088);
  rotate(PI/4);
}