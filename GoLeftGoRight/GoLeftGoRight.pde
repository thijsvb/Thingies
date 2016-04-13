float x = 250;

void setup(){
  size(600,600);
}

void draw(){
  background(255);
  noStroke();
  fill(0,255,192);
  rect(x, 250, 100, 100, 5);
  if(mousePressed){
    ++x;
  }
  else{
    --x;
  }
}