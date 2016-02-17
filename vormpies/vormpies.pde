int v;
float x[] = new float[3];
 
void setup(){
    v = int(random(9,60));
    v = v - (v%3);
    println(v/3);
    x = expand(x,v);;
  
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