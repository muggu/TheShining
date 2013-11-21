import processing.video.*;

public class Kirkkaus {

Capture video;
float keskiarvo = 0.0;
int leveys = 640;
int korkeus = 480;

public Kirkkaus(Minion minion) {
  video = new Capture(minion, leveys, korkeus);
  video.start();  
}

int tarkistaKirkkaus() {

  if (video.available()) {
    video.read();
    video.loadPixels();
    int indeksi = 0;
    float summa = 0.0;
    
    for (int y = 0; y < korkeus; y++) {
      for (int x = 0; x < leveys; x++) {
        
        int pikselinArvo = video.pixels[indeksi];
        float pikselinKirkkaus = brightness(pikselinArvo);
        
        //lasketaan kirkkaudet yhteen
        summa += pikselinKirkkaus;
        
      }
      indeksi++;
    }
    
    //lasketaan kirkkauden keskiarvo
    keskiarvo = summa / (korkeus * leveys);
    
    if (keskiarvo > 180) {
      return 0;
    } else if (keskiarvo > 160) {
      return 1;
    } else if (keskiarvo > 140) {
      return 2;
    } else if (keskiarvo > 120) {
      return 3;
    } else if (keskiarvo > 100) {
      return 4;
    } else if (keskiarvo > 80) {
      return 5;
    } else {
      return 6;
    }

  }
  
  return -1;
  
}

}
