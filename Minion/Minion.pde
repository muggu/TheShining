import pitaru.sonia_v2_9.*;

PImage minioni;
PImage taustaKuva;

int LEVEYS = 640;
int KORKEUS = 480;

float x;
float y;

ArrayList<Lahja> lahjat;

Lahja lahja1;
Lahja lahja2;
Lahja lahja3;

Menu menu;

boolean tormays = false;
boolean menuKlikattu = false;
boolean peliLoppu = false;

int taustanReuna = 500;
int MINION = 150;
int LAHJA = 50;

int hyppyVakio = 0;

int aika;
int alkuAika;
int nykyAika;

Taputus taputus;

boolean clapping;
 
 
void setup() {
    
  size(LEVEYS, KORKEUS);
  smooth();
  
  lahjat = new ArrayList<Lahja>();
  taustaKuva = loadImage("tausta.jpg");
  minioni = loadImage("min1.png");
  
  lahja1 = new Lahja();
  lahja2 = new Lahja();
  lahja3 = new Lahja();
  
  lahjat.add(lahja1);
  lahjat.add(lahja2);
  lahjat.add(lahja3);
  
  Sonia.start(this); // Start Sonia engine.
  LiveInput.start(); // Start listening to the microphone
  
  imageMode(CENTER);
}
 
void draw() {
 
  //checking if menu is passed and the countdown is not finish
  if (menuKlikattu == false) {
    menu = new Menu();
  }
  
  else{
    
    if(!tormays){
      clear();
      muutaTausta();
      tarkistaAika();
      
      text(aika, width-40, 40);//display the countdown on top right corner
      
      piirraMinioni(); 
     
      for(int i=0; i<lahjat.size(); i++){
        lahjat.get(i).nopeus();
        tormays(lahjat.get(i));
      }
    
    }
    else{
      clear();
      menu = new Menu();
      menuKlikattu = false;
     
    } 
  }
}

void tarkistaAika() {
  if (menuKlikattu) {
    
    nykyAika = millis();
    
    aika = ((nykyAika-alkuAika)/1000);
    aika = 30-aika;
    
    if (aika < 1) {
      peliLoppu = true;
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
void muutaTausta() {
  image(taustaKuva, taustanReuna, height/2);
  taustanReuna = taustanReuna - 5;
  if (taustanReuna < 0) {
    taustanReuna = 500;
  }
}
 
void piirraMinioni() {
  // tee ajalla
  boolean hyppy = false;
  
  
  if(tarkistaVolume()){
    hyppy = true;
  }
  if(hyppy){
    for(int i=0; i<4; i++){
       y = y-50;
       x = MINION;
       image(minioni, x, y);
    }
    
    for(int j=0; j<4; j++){
      y = y+50;
      x=MINION;
      image(minioni, x, y);
    }
    hyppy = false;
  }
  else{
      y = height - 50;
      x = MINION;
      image(minioni, x, y);

  }
   
}

void mouseClicked() {
  if (menuKlikattu == false) {
    if (mouseX >=((width/2)-150) && mouseX <=((width/2)+150)) {
      if (mouseY >=(300) && mouseY <=(400)) {
        alkuAika = millis();
        menuKlikattu = true;
      }
    }
  }
}


boolean tarkistaVolume(){
  
  
    float vol = LiveInput.getLevel();
    float clapLevel = 0.3;  // How loud is a clap
    
    if (vol > clapLevel){ 
      return true;  
    }
    else{
      return false;
    }
}
