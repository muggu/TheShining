PImage lahjakuva;

public class Lahja {
  
  PImage lahjakuva = loadImage("princess.png");
  float sijaintiX = 0;
  float sijaintiY = 0;
  float nopeus = 0;
  int ALARAJA = 50;
  
  Lahja () {
    sijaintiX = random(width-100,width);
    sijaintiY = random(ALARAJA, height-3*ALARAJA);
    nopeus = random (-5, -10);
    nopeus();
  }

    


  void nopeus() {
    
    image(lahjakuva, sijaintiX, sijaintiY);
    sijaintiX+=nopeus;
    
    if (sijaintiX < 0) {
    sijaintiY = random(ALARAJA,height);
    sijaintiX = width;
   }
  }
  
  float annaX(){
   return sijaintiX; 
  }
  
  float annaY(){
   return sijaintiY; 
  }
}
