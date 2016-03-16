boolean inside = false;
float x, y, d, pd, mov, end, arc;

void setup(){
  size(600, 600);
  x = width/2;
  y = height/2;
  d = 50;
  arc = PI;
  background(128,0,0);
  noFill();
  stroke(255);
  strokeWeight(2);
}

void draw(){
  if(inside){
    arc(x, y, d, d, end, mov);
    mov+=PI/64;
  }
  else{
    arc(x, y, d, d, mov, end);
    mov-=PI/64;
  }
  if(mov%TWO_PI - arc%TWO_PI <= PI/64){
    pd = d;
    d = random(25,100);
    x += cos(mov)*(pd/2) + cos(mov)*(d/2);
    y += sin(mov)*(pd/2) + sin(mov)*(d/2);
    x = x%width;
    y = y%height;
    end = mov-PI;
    mov = end;
    arc = mov + random(PI/2,TWO_PI+PI/2);
    inside = !inside;
  }
}