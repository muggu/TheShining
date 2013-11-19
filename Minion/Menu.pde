public class Menu{

PImage menu1;
PFont fontti;

Menu() {
  fontti = loadFont("fontti.vlw");
  menu1=loadImage("tausta.jpg");
  image(menu1, (width/2), (height/2));
  fill(200, 1, 1);
  stroke(0);
  strokeWeight(2);
  rect((width/2)-150, 300, 300, 100);
  fill(255);
  textFont(fontti, 30);
  text("Aloita taputtamalla käsiäsi", (width/2)-40, 360);
}
}

