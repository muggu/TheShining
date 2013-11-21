PImage lahjakuva;

public class Lahja {
  
  PImage lahjakuva = loadImage("box.png");
  float sijaintiX = 0;
  float sijaintiY = 0;
  float nopeus = 0;
  int YLARAJA = 50;
  boolean tormatty = false;
  
  Lahja () {
    sijaintiX = random(width-300, width+300);
    sijaintiY = random(YLARAJA, height-2*YLARAJA);
    nopeus();
  }

  void nopeus() {
    
    nopeus = random(-10, -30);
    if (tormatty == false) {
      image(lahjakuva, sijaintiX, sijaintiY);
    }
    sijaintiX += nopeus;
    
    if (sijaintiX < 0) {
      sijaintiY = random(YLARAJA, height-3*YLARAJA);
      sijaintiX = random(width-300, width+300);
      tormatty = false;
    }
  }
  
  float annaX() {
    return sijaintiX; 
  }
  
  float annaY() {
    return sijaintiY; 
  }
  
  public void asetaTormatyksi() {
    tormatty = true;
  }
  
  public boolean onkoTormatty() {
    return tormatty;
  }

}
