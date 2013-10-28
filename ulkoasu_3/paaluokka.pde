
Ulkoasu ulkoasu;

void setup() {

 this.ulkoasu = new Ulkoasu();
 this.ulkoasu.piirraUlkoasu();

}

void draw() {
  
}

void mouseClicked() {
  this.ulkoasu.klikattuSymboli(mouseX, mouseY);
  this.ulkoasu.klikattuValokuva(mouseX, mouseY);
  this.ulkoasu.klikattuPlay(mouseX, mouseY);
  
}

void mouseMoved() {
  if(mouseX >= 600 && mouseY <= 100) {
    this.ulkoasu.onkoInfonSisalla(mouseX, mouseY); 
  }
  
}
