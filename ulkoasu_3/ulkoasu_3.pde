
public class Ulkoasu {

 // PImage infokuva = loadImage("kysymysmerkki.png");
 // PImage lataakuva = loadImage("download.png");
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
  int playX = 630;
  int playY = 470;
  int playHalkaisija = 90;
  //tallenna oma kuva -nappi
  int tallennaX = 580;
  int tallennaY = 620;
  int tallennaHalkaisija = 60;
  boolean klikattuPlay = false;
  //informaationappula
  int infoX = 680;
  int infoY = this.tallennaY;
  int infoHalkaisija = this.tallennaHalkaisija;
  boolean infoNakyvilla = false;
  
  
  
  void piirraUlkoasu(){
   background(250);
   size(750, 700);
   fill(200);
   this.fontti = createFont("Courier New Bold", 20);
   textFont(fontti);
   text("Picture Editor 2.0", 70, 30);
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
    for(int i = 0; i<4; i++) {
      stroke(0);
      if (this.valittuSymboli == i+1) {
        stroke(200);
      }
      rect(aloitusX, aloitusY + i*(marginaaliY + napinKorkeus), napinLeveys, napinKorkeus, 15, 2, 15, 2);
    }
    stroke(0);
    //piirretaan play-nappi
    ellipse(playX, playY, playHalkaisija, playHalkaisija);
   // image(img, 0, 0)
    //oman kuvan lisaaminen -nappi
    ellipse(tallennaX, tallennaY, tallennaHalkaisija, tallennaHalkaisija);
  //  image(lataakuva, tallennaX-tallennaHalkaisija/2, tallennaY-tallennaHalkaisija/2);
    //infonappula:
    ellipse(infoX, infoY, infoHalkaisija, infoHalkaisija);
  //  image(infokuva, infoX-infoHalkaisija/2, infoY-infoHalkaisija/2);  
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
     this.piirraUlkoasu();
     this.infoNakyvilla = false;
   }
   return false;
 }
 
 void piirraInfoboksiNakyviin() {
  this.infoNakyvilla = true;
  fill(20, 20, 200);
  rect(width/4, height/4, width/2, height/2);
 }
 
 
}
 
  

