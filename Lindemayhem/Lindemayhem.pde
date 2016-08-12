final int stages = 11;

final int[] fib = new int[stages];
for(int i=0; i!=fib.length; ++i){
  if(i == 0 || i == 1){
    fib[i] = 1;
  } else {
    fib[i] = fib[i-1] + fib[i-2];
  }
}

final boolean[][] split = new boolean[stages][];
for(int i=0; i!=split.length; ++i){
  split[i] = new boolean[fib[i]];
}

split[0][0] = false;
for(int i=1; i!=split.length; ++i){
  int index = 0;
  for(int j=0; j!=split[i].length;){
    if(split[i-1][index]){
      split[i][j] = true;
      split[i][j+1] = false;
      j+=2;
    } else {
      split[i][j] = true;
      ++j;
    }
    ++index;
  }
}

for(int i=0; i!=split.length; ++i){
  for(int j=0; j!=split[i].length; ++j){
    if(split[i][j]){
      print('A');
    } else {
      print('B');
    }
  }
  print('\n');
}