PImage pedo;
PImage back;
PImage endback;

int LEVEYS = 640;
int KORKEUS = 480;

ArrayList<Lahja> lahjat;

Lahja lahja1;
Lahja lahja2;
Lahja lahja3;


Menu menu;

boolean menuok = false;
boolean end= false;
boolean tormays = false;
float x;
float y;
//taustakuvan sijainti
float bpos=1300;
int score = 0;
int N = 200;
int time=0;
int starttime=0;
int newtime=0;
int counter = score/10; 
int MINION = 150;
int LAHJA = 50;
 
void setup() {
  size(LEVEYS, KORKEUS);
  background(0);
  smooth();
  lahjat = new ArrayList<Lahja>();
  //IMAGES LOADING
  endback=loadImage("tausta.jpg");
  back = loadImage("tausta.jpg");
  pedo = loadImage("pedo.png");
  
  lahja1 = new Lahja();
  lahja2 = new Lahja();
  lahja3 = new Lahja();
  
  lahjat.add(lahja1);
  lahjat.add(lahja2);
  lahjat.add(lahja3);
  
  
  imageMode(CENTER);
}
 
void draw() {
 
  //checking if menu is passed and the countdown is not finish
  if (menuok == false) {
    menu = new Menu();
  }
  else{
  
   

    
    if(!tormays){
    clear();
    back();
    time();
    text(score, 30, 40);//display the score on top left corner
    text(time, width-40, 40);//display the countdown on top right corner
    bear(); 
    
    for(int i=0; i<lahjat.size(); i++){
      lahjat.get(i).nopeus();
      tormays(lahjat.get(i));
    }
    
    }
  }
}

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

void tormays(Lahja lahja){
  
float lahjaX = lahja.annaX();
float lahjaY = lahja.annaY();

if(lahjaX > MINION-LAHJA && lahjaX < MINION+LAHJA ){
  if(lahjaY+LAHJA>y && lahjaY-LAHJA<y){
    tormays = true;
    println("tormays");
}  
}
}
 
//back function sets the background scrolling
void back() {
  image(back, bpos, height/2);
  bpos=bpos-3;
  if (bpos<0) {
    bpos=1300;
  }
}
 
void bear() {
  x = MINION;
  y = mouseY;
  image(pedo, x, y);
}

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

