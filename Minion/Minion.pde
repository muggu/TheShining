import pitaru.sonia_v2_9.*;

PImage minioni;
PImage liukuhihna;

PImage[] taustat = new PImage[3];
int kuva = 0;
int edellinen = 0;

int minioniLkm = 24; //kuvien maara animaatiossa
int kuvaLkm = 13; //erilaisten kuvien maara
int minioniIndeksi = 0; //piirrettavan kuvan indeksi
PImage[] minionit = new PImage[minioniLkm];

int liukuhihnaLkm = 7; //kuvien maara animaatiossa
int liukuhihnaIndeksi = 0; //piirrettavan liukuhihnan indeksi
PImage[] liukuhihnat = new PImage[liukuhihnaLkm];

int LEVEYS = 640;
int KORKEUS = 480;
int pisteet = 0;

int hyppyNopeus = 0;
float taputusVolume;
float clapLevel = 0.3;
float alin;
float keski;
float ylin;

float x;
float y;

ArrayList<Lahja> lahjat;

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
int pidennys = 0;

Kirkkaus kirkkaus;
 
void setup() {
    
  size(LEVEYS, KORKEUS);
  smooth();
  
  lahjat = new ArrayList<Lahja>();
  
  taustat[0] = loadImage("c.png");
  taustat[1] = loadImage("c2.png");
  taustat[2] = loadImage("c3.png");
  
  kirkkaus = new Kirkkaus(this);

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
  
  //ladataan kuvat liukuhihna-animaatioon
  for (int i = 0; i < liukuhihnaLkm; i++) {
    String hihnanNimi = "cb" + (i + 1) + ".png";
    liukuhihnat[i] = loadImage(hihnanNimi);
  }
  
  for (int i = 0; i < 4; i++) {
    lahjat.add(new Lahja());
  }
  
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
      
      //piirretaan tausta webkameran mittaaman kirkkauden mukaan
      kuva = kirkkaus.tarkistaKirkkaus();
      if (kuva != -1) { //jos webkameran kuva saatavilla
        image(taustat[kuva], width/2, height/2);
        edellinen = kuva;
      } else {
        image(taustat[edellinen], width/2, height/2);
      }
      
      text(aika, width-40, 40);
      text(pisteet, width-100, 40);  

      //kierratetaan kuvia %-operaattorilla animaatioita varten
      minioniIndeksi = (minioniIndeksi + 1) % minioniLkm;  
      liukuhihnaIndeksi = (liukuhihnaIndeksi + 1) % liukuhihnaLkm;   
      
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
    aika = 8 - aika + pidennys;
    
    if (aika < 1 || pisteet > 3000) {
      peliLoppu = true;
      menuKlikattu = true;
      clear();
      if (pisteet >= 3000) {
        text("Voitit pelin, pisteesi ovat " + pisteet, width-500, 150);
      } else {
        text("Peli loppui, pisteesi ovat " + pisteet, width-500, 150);
      }
    }
  }
}

void tormays(Lahja lahja){
  
  float lahjaX = lahja.annaX();
  float lahjaY = lahja.annaY();

  if (lahjaX > MINION-40 && lahjaX < MINION+60 ) {
    if (lahjaY+LAHJA > y-90 && lahjaY < y+90) {
      tormays = true;
      if (lahja.onkoTormatty() == false) {
        lahja.asetaTormatyksi();
        pidennys += 1; //pidennetaan jaljella olevaa aikaa
      }
      pisteet = pisteet + 10;
    }  
  }
}
 
void piirraMinioni() {
   
  //animaatio
  minioni = minionit[minioniIndeksi];
  liukuhihna = liukuhihnat[liukuhihnaIndeksi];
  
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

  if (!hyppy && !hyppyKaynnissa || y < 0) {
    y = height - 120;
    x = MINION;
    
    image(liukuhihna, width/2, height-39);
    image(minioni, x, y);
  }
   
}

boolean tarkistaVolume() {
  
  float vol = LiveInput.getLevel();
  
  //konfiguroidaan aanenvoimakkuuden tasot ekan taputuksen perusteella
  if (!menuKlikattu && vol >= 0.15) {
    clapLevel = vol*0.8;
    alin = clapLevel;
    keski = clapLevel*1.25;
    ylin = clapLevel*1.5;
  }
    
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
  
  if (taputusVolume > alin) {
    hyppyKorkeus = 30;
    if (taputusVolume > keski) {
      hyppyKorkeus = 50;  
    }
    if (taputusVolume > ylin) {
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

