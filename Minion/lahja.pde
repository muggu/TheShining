public class Princess {
  float c_x = 0;
  float c_y = 0;
  float speedX = 0;
  boolean caught= false;
  //Constructor for princess class
  Princess () {
    c_x = random(-200, -50);
    c_y = random(50, 550);
    speedX = random (3, 5);
    speedX=speedX+(score/10);
  }
  //Initializes the princess image and start position
  public void init() {
    caught = false;
    translate(0, 0);
    image(princess, c_x, c_y);
    if (c_x > width + 80) {
      c_y = random(height);
      c_x = random(-200, 0);
    }
  }
  //Speed fuction
  public void speed() {
    c_x+=speedX+speedInc;
  }
  //Collision function detects coordinate clash
  public void collision() {
    if (c_x>width-200 && c_x<width-165) {
      if (c_y>mouseY-30 && c_y<mouseY+30) {
        caught=true;
      }
    }
  }
  //runs the necessary Princess class functions
  public void run() {
    collision();
    if (caught==false) {
      init();
      speed();
    }
    if (caught==true) {
      score+=10;
      c_y = random(height);
      c_x = random(-200, -50);
      init();
      speed();
    }
  }
}
