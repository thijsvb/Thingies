final int rows = 300;
float w;

Cel[][] grid = new Cel[rows][rows];
ArrayList<Drop> drops = new ArrayList<Drop>();

void setup() {
  size(500, 500);
  w = width/float(rows);
  println(w);
  for (int i=0; i!=rows; ++i) {
    for (int j=0; j!=rows; ++j) {
      grid[i][j] = new Cel(i, j);
    }
  }
  drops.add(new Drop(grid[floor(random(rows))][0]));
}

void draw() {
  background(225); 
  for (Drop drop : drops) {
    if (drop.cel.row < rows-1) drop.fall();
    drop.show();
  }
  
  if(floor(random(50)) == 0) {
    drops.add(new Drop(grid[floor(random(rows))][floor(random(rows/3))]));
  }
}