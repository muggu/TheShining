
public class Ulkoasu {

  PImage infokuva = loadImage("info.png");
  PImage lataakuva = loadImage("cloud-download.png");
  PImage playkuva = loadImage("play.png");
  PImage mikkihiiri = loadImage("mikkihiiri.png");
  PImage sydan = loadImage("sydan.png");
  PImage tahti = loadImage("tahti.png");
  PFont fontti;
  int valittuSymboli = 1; //Symboli, jota on klikattu (highlight'aus). Alussa ylin symboli.
  int valittuValokuva = 1;
  //symbolinapit:
  int napinLeveys = 100; //symbolinapin leveys
  int napinKorkeus = 60;  //symbolinapin korkeus
  int aloitusX = 570;  //ylimman symbolin koordinaatti x
  int aloitusY = 100;  //ylimman symbolin koordinaatti y
  int marginaaliY = 20;  //symbolien pikselivali
  //valokuvaboksit:
  int kuvanLeveys = 70;  //valokuvaboksien leveys
  int kuvanKorkeus = 70;  //valokuvaboksien korkeus
  int aloitusY1 = 580; //vasemmanpuolimmaisen valokuvan X-koordinaatti
  int aloitusX1 = 40;  //vasemmanpuolimmaisen valokuvan y-koordinaatti
  int marginaaliX = 10; //pikselivali valokuvaruutujen valilla.
  //play-nappi
  int playX = 620;
  int playY = 470;
  int playHalkaisija = 90;
  //tallenna oma kuva -nappi
  int tallennaX = 563;
  int tallennaY = 560;
  int tallennaKorkeus = 85;
  int tallennaLeveys = 128;
  boolean klikattuPlay = false;
  //informaationappula
  int infoX = 710;
  int infoY = 30;
  int infoHalkaisija = 32;
  boolean infoNakyvilla = false;
  PImage[] symbolit = {mikkihiiri, sydan, tahti}; 
  
  
  
  void piirraUlkoasu(){
   background(255);
   size(750, 700);
   fill(200, 90);
   this.fontti = createFont("Courier New Bold", 20);
   textFont(fontti);
   text("Picture Editor 2.0", 70, 30);
   fill(255,0);
   noStroke();
   rect(30, 50, 500, 500, 10);
   piirraNapit();
   piirraValokuvat(); 
   
   }
  
  
  /**Piirtaa nappulat, joilla voi vaihtaa symbolia, jolla muodostetaan kuva.
  * Nappuloihin tulee kuvat listasta esim?!
  * Luo myos Play-napin, Info-napin ja myos oman kuvan lisaamista varten napin.
  */
  void piirraNapit() {
    text("Symbols", 570, 70);
    //piirretaan symbolinapit
    for(int i = 0; i<3; i++) {
      stroke(0);
      if (this.valittuSymboli == i+1) {
        stroke(200);
      }
      rect(aloitusX, aloitusY + i*(marginaaliY + napinKorkeus), napinLeveys, napinKorkeus, 15, 2, 15, 2);
      image(symbolit[i], aloitusX + 10, i*(marginaaliY + napinKorkeus));  
  }
    stroke(0);
    //piirretaan play-nappi
    ellipse(playX, playY, playHalkaisija, playHalkaisija);
    scale(0.75);
    image(playkuva, (1/0.75)*(playX-playHalkaisija/2), (1/0.75)*(playY-playHalkaisija/2));
    scale(1/0.75);
    //oman kuvan lisaaminen -nappi
    fill(250);
    noStroke();
    rect(tallennaX, tallennaY, tallennaLeveys, tallennaKorkeus, 30);
    image(lataakuva, tallennaX, tallennaY);
    //infonappula:
    stroke(0);
    fill(255);
    ellipse(infoX, infoY, infoHalkaisija, infoHalkaisija);
    scale(0.5);
    image(infokuva, infoX*2-infoHalkaisija, 2*infoY-infoHalkaisija);  
    scale(1/0.5);
    fill(200);
}
  
  
  /*Piirretaan valokuvavaihtoehdot alareunaan. 
  */
  void piirraValokuvat() {
    text("Image Options", aloitusX1, aloitusY1-10);
    for(int i = 0; i < 6; i++) {
      stroke(0);
      if (this.valittuValokuva == i+1) {
        stroke(200);
      }
      rect(aloitusX1+i*(kuvanLeveys+marginaaliX), aloitusY1, kuvanLeveys, kuvanKorkeus, 5); 
    } 
  }
  
  //Vaihtaa valitun symbolin aariviivan varin. 
  //Palauttaa valitun symbolin numeron.
  int klikattuSymboli(int mousex, int mousey) {
    int x = mousex; //mouseX
    int y = mousey; //mouseY
    if (x >= this.aloitusX && x <= this.aloitusX + this.napinLeveys ) {
      for (int i = 0; i < 4; i++) {
        if (y >= this.aloitusY + i*(this.napinKorkeus + this.marginaaliY) 
        && y <= this.aloitusY + this.napinKorkeus + i*(this.napinKorkeus+this.marginaaliY)) {
         this.valittuSymboli = i+1;
         println(this.valittuSymboli); 
        }
      }
      this.piirraNapit();
      return this.valittuSymboli; 
    }
   return 0;
 }

  //Vaihtaa valitun valokuvan aariviivan varin. 
  //Palauttaa valitun valokuvan numeron.
  int klikattuValokuva(int mousex, int mousey) {
    int x = mousex; //mouseX
    int y = mousey; //mouseY
    if (y >= this.aloitusY1 && y <= this.aloitusY1 + this.kuvanKorkeus) {
      for (int i = 0; i < 6; i++) {
        if (x >= this.aloitusX1 + i*(this.kuvanLeveys + this.marginaaliX) 
        && x <= this.aloitusX1 + this.kuvanLeveys + i*(this.kuvanLeveys+this.marginaaliX)) {
         this.valittuValokuva = i+1;
         println("valokuva " + this.valittuValokuva); 
        }
      }
      this.piirraValokuvat();
      return this.valittuValokuva; 
    }
   return 0;
 }
 
 boolean klikattuPlay(int mouseX, int mouseY) {
   int x = mouseX;
   int y = mouseY;
   if (pow(x-this.playX,2) + pow(y-this.playY,2) < pow(this.playHalkaisija/2,2) ) {
     println("Play-nappia");
     return true;
   }
   return false;
 }
 
 
 boolean onkoInfonSisalla(int mouseX, int mouseY) {
   int x = mouseX;
   int y = mouseY;
   if (pow(x-this.infoX,2) + pow(y-this.infoY,2) < pow(this.infoHalkaisija/2,2) ) {
     if(!this.infoNakyvilla) {
       piirraInfoboksiNakyviin();
     }
     return true;
   }
   if (infoNakyvilla) {
     this.infoNakyvilla = false;
   }
   return false;
 }
 
 void piirraInfoboksiNakyviin() {
  this.infoNakyvilla = true;
  fill(230);
  rect(width/4, height/4, width/2, height/2, 30);
 }
 
 
}
 
  

