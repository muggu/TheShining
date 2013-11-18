//IMAGES
PImage pedo;
PImage back;
PImage menu;
PImage princess;
PImage endback;

//OTHER VARIABLES
Princess pr1= new Princess();
Princess pr2= new Princess();
Princess pr3= new Princess();
Princess pr4= new Princess();
PFont font;
boolean menuok = false;
boolean end= false;
float x;
float y;
float bpos=-1300;
int score = 0;
int N = 200;
int time=0;
int starttime=0;
int newtime=0;
int counter = score/10;
int speedInc;
 
 
void setup() {
  size(670, 500);
  background(0);
  smooth();
  //IMAGES LOADING
  endback=loadImage("tausta.jpg");
  menu=loadImage("tausta.jpg");
  back = loadImage("tausta.jpg");
  pedo = loadImage("pedo.png");
  princess = loadImage("princess.png");
  imageMode(CENTER);

}
 
void draw() {
 
  //checking if menu is passed and the countdown is not finish
  if (menuok == false) {
    menuSetup();
  }
  else if ((menuok==true)&&(end==false)) {
    background(0);
    back();
    time();
    text(score, 30, 40);//display the score on top left corner
    text(time, width-40, 40);//display the countdown on top right corner
    bear(); 
    speedInc();
    pr1.run();
    pr2.run();
    pr3.run();
    if (score>100){
    pr4.run();
    }
    
  }
  else {
    theend();
  }
} 
// time function for the 1 minute countdown
void time() {
  if (menuok==true) { //if the game started
    newtime=millis();
    time=((newtime-starttime)/1000);
    time=59-time;
    if (time<=1) {
      end=true; // when the countdown ends
    }
  }
}
 
//back function sets the background scrolling
void back() {
  image(back, bpos, height/2);
  bpos=bpos+3;
  if (bpos>=width+1300) {
    bpos=-1300;
  }
}
 
//end function, display the end screen with final score reached in 1 minute
void theend() {
  image(endback, width/2, height/2);
  //in.stop();
  fill(255);
  text(score, (width/2)-30, 450);
}
 
//bear function initializes and controls the bear
void bear() {
  float p_y = random(-1, 1);
  x = width-190;
  y = mouseY;
  pushMatrix();
  translate(x, y+p_y);
  noStroke();
  fill(255, 150);
  for (int i = 0; i < N;i++) {
    ellipse(i, random(-10, 10)+p_y, 15, 15);
  }
  image(pedo, 0, 0);
  popMatrix();
}
 
//button event for menu
void mouseClicked() {
  if (menuok == false) {
    if (mouseX >=((width/2)-150) && mouseX <=((width/2)+150)) {
      if (mouseY >=(300) && mouseY <=(400)) {
        menuok = true;
        starttime=millis();
      }
    }
  }
}
 
//menu function with a button to start
void menuSetup() {
 
  image(menu, (width/2), (height/2));
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
//speed up
public void speedInc(){
if(counter!=0){
if(counter%5==0){
speedInc=speedInc+((counter/5)*4);
}
else speedInc+=1;
}
else speedInc=1;
}

