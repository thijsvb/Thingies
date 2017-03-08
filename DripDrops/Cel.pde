class Cel {
  PVector pos;
  int row, col;
  float res = random(2);

  Cel(int i, int j) {
    float x = i*w + w/2;
    float y = j*w + w/2;
    row = j;
    col = i;
    pos = new PVector(x, y);
  }
  
  ArrayList<Cel> neighbors() {
    ArrayList<Cel> n = new ArrayList<Cel>();
    if(col == 0) {
      n.add(grid[col+1][row]);
      n.add(grid[col][row+1]);
      n.add(grid[col+1][row+1]);
    }
    else if(col == rows-1) {
      n.add(grid[col-1][row]);
      n.add(grid[col][row+1]);
      n.add(grid[col-1][row+1]);
    }
    else {
      n.add(grid[col-1][row]);
      n.add(grid[col-1][row+1]);
      n.add(grid[col+1][row]);
      n.add(grid[col+1][row+1]);
      n.add(grid[col][row+1]);
    }
    return n;
  }
}