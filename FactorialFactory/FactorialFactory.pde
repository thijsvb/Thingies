int x;
 
void setup(){
    size(500,500);
}
 
void draw(){
    background(0);
    text(x, 50, 50);
    text(factorial(x), 50,100);
}
 
void mouseClicked(){
    if(mouseButton == LEFT){
        x = (x+1)%170;
    }
    else if(mouseButton == RIGHT){
        x = (x-1)%170;
    }
}
 
long factorial(int input){
    if(input < 0){
        return 0;
    }
    else if(input == 0 || input == 1){
        return 1;
    }
    else{
        return input * factorial(input-1);
    }
}