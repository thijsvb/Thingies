float s;
float b;
float w = 50;
 
void setup(){
    size(500,500);
    colorMode(HSB);
    noFill();
    stroke(255);
    strokeWeight(4);
}
 
void draw(){
    background(b,255,128);
    ellipse(mouseX,mouseY,w,w);
    if(mousePressed){
        s = random(255);
        stroke(s,255,255);
        fill((s+128)%255,255,255);
    }
    if(keyPressed){
        if(keyCode == UP){
            w+=5;
        }
        else if(keyCode == DOWN && w > 0){
            w-=5;
        }
        else if(key  == ' '){
            b = random(255);
        }
    }
}