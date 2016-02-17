float time;
float rot;
float a;
color b = color(0);
color f = color(0);
color p = color(0);
color c = color(255);
float h;
 
void setup(){
    size(500,500);
    noFill();
    stroke(255);
    strokeWeight(10);
    colorMode(HSB);
    time = millis();
}
 
void draw(){
    translate(width/2,height/2);
    rotate(rot);
    if(millis() - time >= 50){
        background(b);
        stroke(p);
        ellipse(0,0,400,400);
        stroke(c);
        arc(0,0,400,400,0,a);
        a += PI/16;
        if(a >= TWO_PI + PI/16){
            a = 0;
            rot += PI/16;
            b = color(hue(p),255,128);
            p = c;
            h += random(64,192);
            c = color(h%255,255,255);
        }
        time = millis();
    }
}