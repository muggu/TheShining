import pitaru.sonia_v2_9.*;

PImage minioni;
PImage taustaKuva;

int minioniLkm = 24; //kuvien maara animaatiossa
int kuvaLkm = 13; //erilaisten kuvien maara
int minioniIndeksi = 0; //piirrettavan kuvan indeksi
PImage[] minionit = new PImage[minioniLkm];

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
boolean hyppy = false;

int taustanReuna = 500;
int MINION = 150;
int LAHJA = 50;

int hyppyVakio = 0;

int aika;
int alkuAika;
int nykyAika;

Taputus taputus; 
 
void setup() {
    
  size(LEVEYS, KORKEUS);
  smooth();
  
  lahjat = new ArrayList<Lahja>();
  taustaKuva = loadImage("tausta.jpg");

//ladataan kuvat minionianimaatiota varten ja tallennetaan taulukkoon
 frameRate(24);
  int j = 2;
    for (int i = 0; i < minioniLkm; i++) {
    if (i < kuvaLkm) { //ladataan kaikki eri kuvat
      String kuvanNimi = "min" + (i + 1) + ".png";
      minionit[i] = loadImage(kuvanNimi);
    } 
    else if (i < (minioniLkm)) { //tallennetaan kaikki paitsi eka ja vika kahteen kertaan, koska liike on edestakaista
      minionit[i] = minionit[i-j];
      j += 2;
    }
  }


  
  lahja1 = new Lahja();
  lahja2 = new Lahja();
  lahja3 = new Lahja();
  
  lahjat.add(lahja1);
  lahjat.add(lahja2);
  lahjat.add(lahja3);
  
  Sonia.start(this);
  LiveInput.start();
  
  imageMode(CENTER);
}

void tarkistaLahjat(){
  for(int i=0; i<lahjat.size(); i++){
   lahjat.get(i).nopeus();
   tormays(lahjat.get(i));
 
}
}
 
void draw() {
 
  if (!menuKlikattu) {
      clear();
      menu = new Menu();
      tarkistaVolume();
  }
  
  else{
    
    if(!tormays){
      clear();
      muutaTausta();
      tarkistaAika();
      
      text(aika, width-40, 40);
      
      //kierratetaan kuvia %-operaattorilla animaatiota varten
     minioniIndeksi = (minioniIndeksi + 1) % minioniLkm;
      
      piirraMinioni(); 
      tarkistaLahjat();
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
    menuKlikattu = false;
    println("tormays");
}  
}
}

void muutaTausta() {
  image(taustaKuva, taustanReuna, height/2);
  taustanReuna = taustanReuna - 5;
  if (taustanReuna < 0) {
    taustanReuna = 500;
  }
}
 
void piirraMinioni() {
   
  //animaatio
  minioni = minionit[minioniIndeksi];

  
  if(hyppy){
    for(int i=0; i<4; i++){
       hyppaa(-1);
    }
    
    for(int j=0; j<4; j++){
      hyppaa(1);
    }
    hyppy = false;
  }
  
  if(tarkistaVolume()){
    hyppy = true;
  }

  if(!hyppy){
      y = height - 50;
      x = MINION;
      image(minioni, x, y);

  }
   
}

void mouseClicked() {
  if (!menuKlikattu) {
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
    float clapLevel = 0.3;
    
    if (vol > clapLevel){ 
      menuKlikattu = true;
      return true;  
    }
    else{
      return false;
    }
}

void hyppaa(int i){

    x = MINION;
   if(i==-1){
    y = y-30;
    }
   
    if(i==1){ 
      y = y+30;
    }  
   image(minioni, x, y);
}

