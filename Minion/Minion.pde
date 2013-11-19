import pitaru.sonia_v2_9.*;

PImage minioni;
PImage taustaKuva;

int minioniLkm = 24; //kuvien maara animaatiossa
int kuvaLkm = 13; //erilaisten kuvien maara
int minioniIndeksi = 0; //piirrettavan kuvan indeksi
PImage[] minionit = new PImage[minioniLkm];

int LEVEYS = 640;
int KORKEUS = 480;
int pisteet = 0;

int hyppyNopeus = 0;
float taputusVolume;

float x;
float y;

ArrayList<Lahja> lahjat;

Lahja lahja1;
Lahja lahja2;
Lahja lahja3;
Lahja lahja4;

Menu menu;

boolean tormays = false;
boolean menuKlikattu = false;
boolean peliLoppu = false;
boolean hyppy = false;
boolean hyppyKaynnissa = false;

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
  taustaKuva = loadImage("c.png");

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
  lahja4 = new Lahja();
  
  lahjat.add(lahja1);
  lahjat.add(lahja2);
  lahjat.add(lahja3);
  lahjat.add(lahja4);
  
  Sonia.start(this);
  LiveInput.start();
  
  imageMode(CENTER);
}

void tarkistaLahjat(){
  for (int i = 0; i < lahjat.size(); i++) {
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
  
  else {
    
    if (!peliLoppu) {
      
      clear();
      
      //muutaTausta();
      image(taustaKuva, width/2, height/2); //tausta pysyy paikallaan
      
      text(aika, width-40, 40);
      text(pisteet, width-100, 40);  

      //kierratetaan kuvia %-operaattorilla animaatiota varten
      minioniIndeksi = (minioniIndeksi + 1) % minioniLkm;     
      
      piirraMinioni(); 
      tarkistaLahjat();
      
      if (hyppy) {
        hyppyNopeus = (hyppyNopeus + 1) % 2;
        hyppaa(-1);
        image(minioni, x, y);
        if (hyppyKaynnissa) {
          hyppaa(1);
          image(minioni, x, y);
        }
      }
      tarkistaAika();
    }
  }

}

void tarkistaAika() {
  
  if (menuKlikattu) {
    
    nykyAika = millis();
    
    aika = ((nykyAika - alkuAika) / 1000);
    aika = 15 - aika;
    
    if (aika < 1) {
      peliLoppu = true;
      menuKlikattu = true;
      clear();
      text("Peli loppui, pisteesi ovat " + pisteet, width-300, 150);
    }
  }
}

void tormays(Lahja lahja){
  
  float lahjaX = lahja.annaX();
  float lahjaY = lahja.annaY();

  if (lahjaX > MINION-LAHJA && lahjaX < MINION+LAHJA ) {
    if (lahjaY+LAHJA>y && lahjaY-LAHJA<y) {
      tormays = true;
      pisteet = pisteet + 10;
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

  
  if (hyppy) {
    for (int i = 0; i < 4; i++) {
      hyppaa(-1);
    }
    for (int j = 0; j < 4; j++) {
      hyppaa(1);
    }
    hyppy = false;
  }
  
  hyppy = tarkistaVolume();

  if (!hyppy && !hyppyKaynnissa) {
    y = height - 100;
    x = MINION;
    image(minioni, x, y);
  }
   
}

boolean tarkistaVolume() {
  
  float vol = LiveInput.getLevel();
  float clapLevel = 0.3;
    
  if (vol > clapLevel) { 
    if (!menuKlikattu) {
      alkuAika = millis();
      menuKlikattu = true;
    }
    if (peliLoppu) {
    peliLoppu = false;
    menuKlikattu = true;
    }
    taputusVolume = vol;
    return true;  
  }
  else {
    return false;
  }
}

void hyppaa(int i) {
      
  hyppyKaynnissa = true;
    
  int hyppyKorkeus = 0; 
  
  if (taputusVolume > 0.3) {
    hyppyKorkeus = 30;
    if (taputusVolume > 0.31) {
      hyppyKorkeus = 50;  
    }
    if (taputusVolume > 0.32) {
      hyppyKorkeus = 70;
    } 
  }
  
  x = MINION;
    
  if (i == -1) {
    hyppyNopeus = -hyppyKorkeus;
  }
   
  if (i == 1) { 
    hyppyNopeus = hyppyKorkeus;
  }  
  y = y + hyppyNopeus;
  hyppyKaynnissa = false;
}

