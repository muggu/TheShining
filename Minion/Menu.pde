public class Menu {

  PImage menu;
  PFont fontti;
  
  Menu() {
    fontti = loadFont("fontti.vlw");
    menu = loadImage("tausta.jpg");
    background(255);
    image(menu, (width/2), (height/2));
    fill(200, 1, 1);
    stroke(0);
    strokeWeight(2);
    rect((width/2)-150, 300, 300, 100);
    fill(255);
    textFont(fontti, 24);
    text("Aloita taputtamalla käsiäsi", (width/2)-140, 360);
  }
  
}

