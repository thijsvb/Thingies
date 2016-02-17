float ex,ey;
float ry,ly;
float xv,yv;
float rv,lv;
float rscore,lscore;
 
void setup(){
    size(1000,500);
    rectMode(CENTER);
    textAlign(CENTER,TOP);
    noStroke();
    fill(255);
    ry = height/2;
    ly = height/2;
    ex = width/2;
    ey = height/2;
    xv = 3;
    yv = 0;
    rv = 0;
    lv = 0;
}
 
void draw(){
    background(0);
    text(lscore,width*.25,20);
    text(rscore,width*.75,20);
    ellipse(ex,ey,50,50);
    rect(50,ly,20,80);
    rect(width-50,ry,20,80);
    ex += xv;
    ey += yv;
    ry += rv;
    ly += lv;
    
    rv = 0;
    lv = 0;
    if(keyPressed){        
        if(ry-40 > 0 && key == CODED && keyCode == UP){
            rv = -3;
        }
        else if(ry+40 < height && key == CODED && keyCode == DOWN){
            rv = 3;
        }
    }
    if(mousePressed){
        if(ly-40 > 0 && mouseButton == LEFT){
            lv = -3;
        }
        else if(ly+40 < height && mouseButton == RIGHT){
            lv = 3;
        }
    }
    
    if(ey > ry-40 && ey < ry+40 && ex+25 >= width-60){
        xv = xv*-1;
        if(rv != 0){
            yv += rv/abs(rv);
        }
    }
    else if(ey > ly-40 && ey < ly+40 && ex-25 <= 60){
        xv = xv*-1;
        if(lv != 0){
            yv += lv/abs(lv);
        }
    }
    
    if(ey-25 <= 0 || ey+25 >= height){
        yv = yv*-1;
    }
    
    if(ex > width){
        ex = width/2;
        ey = height/2;
        xv = 3;
        yv = 0;
        ++lscore;
    }
    else if(ex < 0){
        ex = width/2;
        ey = height/2;
        xv = -3;
        yv = 0;
        ++rscore;
    }
}