final int rows = 300, max = 50;
float w;

Cel[][] grid = new Cel[rows][rows];
ArrayList<Drop> drops = new ArrayList<Drop>();

void setup() {
  size(500, 500);
  w = width/float(rows);
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
  
  if(drops.size() == max) drops.clear();

  if (floor(random(20)) == 0) {
    drops.add(new Drop(grid[floor(random(rows))][floor(random(rows))]));
  }
}