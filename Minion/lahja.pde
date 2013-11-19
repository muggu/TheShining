PImage lahjakuva;

public class Lahja {
  
  PImage lahjakuva = loadImage("princess.png");
  float sijaintiX = 0;
  float sijaintiY = 0;
  float nopeus = 0;
  int YLARAJA = 50;
  
  Lahja () {
    sijaintiX = random(width-300,width+300);
    sijaintiY = random(YLARAJA, height-2*YLARAJA);
    nopeus();
  }

  void nopeus() {
    
    nopeus = random (-10, -30);
    image(lahjakuva, sijaintiX, sijaintiY);
    sijaintiX+=nopeus;

    
    if (sijaintiX < 0) {
    sijaintiY =  random(YLARAJA, height-2*YLARAJA);
    sijaintiX = random(width-300,width+300);
   }
  }
  
  float annaX(){
   return sijaintiX; 
  }
  
  float annaY(){
   return sijaintiY; 
  }
}
