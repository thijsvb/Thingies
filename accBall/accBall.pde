Ball ball;
Guy goodguy;
Guy badguy;
int score = 0;

void setup() {
  size(800, 800);
  ball = new Ball(width/2, height/2, 25);
  goodguy = new Guy(random(width), random(height), 50, true);
  badguy = new Guy(random(width), random(height), 50, false);
}

void draw() {
  background(0);
  
  if(mousePressed) {
    PVector mouse = new PVector(mouseX, mouseY);
    PVector f = mouse.sub(ball.pos).mult(0.0005);
    ball.move(f);
  } else {
    ball.move();
  }
  
  goodguy.show();
  badguy.show();
  ball.show();
  
  if(goodguy.hit(ball)) {
    while(goodguy.hit(ball)) goodguy.spawn();
    score++;
  }
  if(badguy.hit(ball)) {
    while(badguy.hit(ball)) badguy.spawn();
    score--;
  }
  
  fill(255);
  text(score, 50, 50);
}

class Ball {
  PVector pos;
  PVector vel;
  PVector acc;
  float r;
  float m = 2;
  float maxvel = 10;
  float drag = 0.03;
  
  Ball(float x, float y, float radius) {
    pos = new PVector(x, y);
    vel = new PVector(0, 0);
    acc = new PVector(0, 0);
    r = radius;
  }
  
  void move() {
    PVector f = new PVector(0,0);
    move(f);
  }
  
  void move(PVector force) {
    force.sub(vel.copy().mult(drag));
    acc = force.copy().mult((float)1/m);
    vel.add(acc);
    vel.limit(maxvel);
    pos.add(vel);
    
    if(pos.x > width-r) pos.set(width-r, pos.y);
    if(pos.y > height-r) pos.set(pos.x, height-r);
    if(pos.x < r) pos.set(r, pos.y);
    if(pos.y < r) pos.set(pos.x, r);
  }
  
  void show() {
    fill(0, 127, 0);
    noStroke();
    ellipse(pos.x, pos.y, r*2, r*2);
  }
}

class Guy {
  float x, y;
  float w;
  boolean good;
  
  Guy(float X, float Y, float size, boolean g) {
    x = X;
    y = Y;
    w = size;
    good = g;
  }
  
  boolean hit(Ball b) {
    float nearestX = max(x-w/2, min(b.pos.x, x+w/2));
    float nearestY = max(y-w/2, min(b.pos.y, y+w/2));
    return dist(nearestX, nearestY, b.pos.x, b.pos.y) < b.r;
  }
  
  void show() {
    stroke(255);
    if(good) {
      fill(0, 255, 0);
    } else {
      fill(255, 0, 0);
    }
    rectMode(CENTER);
    rect(x, y, w, w);
    noFill();
    if(this.good) arc(x, y+w/6, w/2, w/4, 0, PI);
    else arc(x, y+w/4, w/2, w/4, PI, TWO_PI);
    ellipse(x-w/4, y-w/4, w/4, w/4);
    ellipse(x+w/4, y-w/4, w/4, w/4);
  }
  
  void spawn() {
    x = random(width);
    y = random(height);
  }
}