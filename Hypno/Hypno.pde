float time;
float c;
float bg;
boolean w = true;
 
void setup(){
    size(500,500);
    noFill();
    stroke(255);
    strokeWeight(5);
    rectMode(CENTER);
    colorMode(HSB);
    time = millis();
}
 
void draw(){
    translate(width/2,height/2);
    if(millis()-time >= 50){
        bg = random(255);
        background(bg,255,255);
        stroke((bg+128)%255,255,255);
        rect(0,0,400,400,c);
        if(w){
            c+=5;
        }else{
            c-=5;
        }
        if(c == 200 || c == 0){
            w = !w;
        }
        time = millis();
    }
}