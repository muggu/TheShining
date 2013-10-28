PImage kuva;

float transparency;

void setup(){
  size(500,500);
  transparency = 0;
  kuva = loadImage("minionitpieni.jpg");

}

void draw(){
  background(255);
  tint(255,255,255,transparency);
  image(kuva, 0, 0);
  
 if(transparency >40){
    transparency = transparency + 0.8 ;
  }
  
  if(transparency < 255){
    transparency = transparency + 0.2 ;
  }
}

