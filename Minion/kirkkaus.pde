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
    
        // Get the color stored in the pixel
        int pikselinArvo = video.pixels[indeksi];
    
        // Determine the brightness of the pixel
        float pikselinKirkkaus = brightness(pikselinArvo);
        
        //lasketaan kirkkaudet yhteen
        summa += pikselinKirkkaus;
        
      }
      indeksi++;
    }
    
    //lasketaan kirkkauden keskiarvo
    keskiarvo = summa / (korkeus * leveys);
    
    println(keskiarvo);
    
    if (keskiarvo > 170) {
      return 2;
    } else if (keskiarvo > 140) {
      return 1;
    } else {
      return 0;
    }

  }
  
  return -1;
  
}

}
