public class Menu{

PImage menu1;

//menu function with a button to start
Menu() {
  
  menu1=loadImage("tausta.jpg");
  image(menu1, (width/2), (height/2));
  fill(200, 1, 1);
  stroke(0);
  strokeWeight(2);
  rect((width/2)-150, 300, 300, 100);
  fill(0);
  text("START", (width/2)-40, 360);
  if (mouseX >=((width/2)-150) && mouseX <=((width/2)+150)) {
    if (mouseY >=(300) && mouseY <=(400)) {
      stroke(255);
      strokeWeight(6);
      fill(200, 1, 1);
      rect((width/2)-150, 300, 300, 100);
      fill(255);
      text("START", (width/2)-40, 360);
    }
}
}
}

