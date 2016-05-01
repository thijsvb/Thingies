int tier = 0;
int m;
int[] n;
int[] a;

int calc(){
  int max = 30;//floor(width/10);
  println(max);println();
  n = new int[max];
  a = new int[max];
  for(int i=0; i!=max; ++i){
    n[i] = number(i);
    a[i] = abandon(i);
    println(i);
  }
  println();
  return max-1;
}

void printStats() {
  print("tier: ");
  println(tier);
  print("people: ");
  println(n[tier] + a[tier]);
  print("abandon: ");
  println(a[tier]);
  print("left: ");
  println(n[tier]);
  println();
}
void setup() {
  size(600,600);
  stroke(0);
  background(255,64,64);
  m = calc();
  printStats();
}
void draw() {
  background(255);
  for(int i=0; i<=tier; ++i){
    int x;
    fill(0,255,0);
    for(x=0; x!=n[i]; ++x){
      ellipse(width/2 - (x*10+5), i*10+5, 10,10);
    }
    fill(255,0,0);
    for(int j=x; j!=x+a[i]; ++j){
      ellipse( width/2 - (x*10)+(j*10+5), i*10+5, 10,10);
    }
  }
  line(width/2,0,width/2,height);
}
void mousePressed() {
  if (mouseButton == LEFT && tier < m) {
    ++tier;
  } else if (mouseButton == RIGHT && tier > 0) {
    --tier;
  }
  printStats();
}

int number(int t) {
  if (t == 0) {
    return 1;
  } else {
    return 2*number(t-1)-abandon(t);
  }
}

int abandon(int t) {
  if (t == 0) {
    return 0;
  } else {
    return number(t-1)-1;
  }
}