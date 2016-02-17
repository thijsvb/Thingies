float n = 2;
float a = 0;
float r = 100;
 
void setup(){
    size(1000,500);
    noFill();
    colorMode(HSB);
}
 
void draw(){
    background(0);
    stroke(map(r,0,width/4,0,255),255,255);
    translate(width/2,height/2);
    rotate(a);
    beginShape();
    vertex(r,0);
    for(float j=r; j>0; j-=5){
        for(float i=0; i < TWO_PI; i+=TWO_PI/n){
            vertex(cos(i)*j,sin(i)*j);
        }
    }
    vertex(0,0);
    endShape();
}
 
void mousePressed(){
    if(mouseButton == LEFT){
        ++n;
    }
    else if(mouseButton == RIGHT && n > 2){
        --n;
    }
}
 
void keyPressed(){
    if(key == CODED){
        if(keyCode == UP){
            r+=5;
        }
        else if(keyCode == DOWN && r > 5){
            r-=5;
        }
        if(keyCode == LEFT){
            a-=PI/32;
        }
        else if(keyCode == RIGHT){
            a+=PI/32;
        }
    }
}