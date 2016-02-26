int v;
float x[] = new float[3];
PrintWriter file;
String name;
int version = 0;
 
void setup(){
    v = int(random(9,60));
    v = v - (v%3);
    println(v/3);
    x = expand(x,v);;
    
    file = createWriter("vorm0.stl");
  
    size(400,400,P3D);
    fill(255);
    stroke(0,255,0);
    for(int i=0; i!=x.length; ++i){
        x[i] = random(-250,250);
    }
}
 
void draw(){  
    background(0);
    translate(width/2,height/2,-500);
    scale(-1,1);
    rotateX(map(mouseY,0,width,0,TWO_PI));
    rotateY(map(mouseX,0,width,0,TWO_PI));
    
    beginShape();
    for(int i=0; i!=x.length; i+=3){
    vertex(x[i],x[i+1],x[i+2]);
    }
    endShape(CLOSE);
}
 
void mousePressed(){
    if(mouseButton == LEFT){
        v = int(random(9,60));
        v = v- (v%3);
        println(v/3);
        x = new float[v];
        for(int i=0; i!=x.length; ++i){
            x[i] = random(-250,250);
        }
    }
    else{
        for(int i=0; i!=x.length; ++i){
            x[i] = random(-250,250);
        }
    }
}

void keyPressed(){
  float a[][] = new float[v/3][3];
  for(int i=0; i!=v; i+=3){
    a[i/3][0] = x[i];
    a[i/3][1] = x[i+1];
    a[i/3][2] = x[i+2];
  }
  
  file.println("solid vorm");
  
  for(int i=0; i!=v/3; ++i){
    file.println("facet normal 0 0 0");
    file.println("outer loop");
    for(int j=0; j!=3; ++j){
      file.println("vertex " + a[(i+j)%a.length][0] + ' ' + a[(i+j)%a.length][1] + ' ' + a[(i+j)%a.length][2]);
    }
    file.println("endloop");
    file.println("endfacet");
  }
  
  file.println("endsolid");
  file.flush();
  file.close();
  ++version;
  name = "vorm" + version + ".stl";
  file = createWriter(name);
}