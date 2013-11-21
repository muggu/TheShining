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
    rect((width/2)-200, 300, 420, 160);
    fill(255);
    textFont(fontti, 20);
    text("Aloita taputtamalla käsiäsi. Hyppää", (width/2)-190, 330);
    text("taputtamalla ja kerää pisteitä sekä lisää", (width/2)-190, 355);
    text("aikaa osumalla paketteihin. Peli päättyy, ", (width/2)-190, 380);
    text("kun olet kerännyt 3000 pistettä tai", (width/2)-190, 405);
    text("kun aikasi loppuu. Äänentaso kalibroidaan", (width/2)-190, 430);
    text("ensimmäisen taputuksesi mukaan.", (width/2)-190,455);
}
  
}

