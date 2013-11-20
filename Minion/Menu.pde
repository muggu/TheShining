public class Menu {

  PImage menu;
  PFont fontti;
  
  Menu() {
    fontti = loadFont("fontti.vlw");
    menu = loadImage("tausta.jpg");
    background(255);
    image(menu, (width/2), (height/2)-50);
    fill(200, 1, 1);
    stroke(0);
    strokeWeight(2);
    rect((width/2)-200, 300, 400, 140);
    fill(255);
    textFont(fontti, 22);
    text("Aloita taputtamalla kasiasi. Hyppaa", (width/2)-190, 330);
    text("taputtamalla ja keraa pisteita seka lisaa", (width/2)-190, 355);
    text("aikaa osumalla paketteihin. Peli paattyy, ", (width/2)-190, 380);
    text("kun olet kerannyt 3000 pistetta tai", (width/2)-190, 405);
    text("aikasi loppuu.", (width/2)-190, 430);
  }
  
}

