float[] a = new float[6];
 
void setup() {  
    size(500,500);
    colorMode(HSB);
    stroke(255);
    strokeWeight(5);
    noFill();
} 
 
void draw() {
    background(0);
    translate(width/2,height/2);
    
    a[0] = map(second(),0,59,0,TWO_PI) - PI/2;
    a[1] = map(minute(),0,59,0,TWO_PI) - PI/2;
    a[2] = map(hour(),0,23,0,TWO_PI) - PI/2;
    a[3] = map(day(),1,31,0,TWO_PI) - PI/2;
    a[4] = map(month(),1,12,0,TWO_PI) - PI/2;
    a[5] = map(year(),2010,2020,0,TWO_PI) - PI/2;
    
    
    for(int i=0; i!=a.length; ++i){
        stroke(map(a[i],-PI/2,TWO_PI-PI/2,0,255),255,255);
        arc(0,0,50+i*50,50+i*50,-PI/2,a[i]);
    }
}