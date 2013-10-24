PFont fontti;

void setup() {
 background(250);
 size(750, 700);
 fill(200);
 rect(30, 50, 500, 500, 10);
 this.fontti = createFont("Courier New Bold", 20);
 textFont(fontti);
 this.piirraNapit();
 this.piirraValokuvat();
 text("Picture Editor 2.0", 70, 30);
   
}

/**Piirtaa nappulat, joilla voi vaihtaa symbolia, jolla muodostetaan kuva.
* Nappuloihin tulee kuvat listasta esim?!
* Luo myos Play-napin ja Info-napin.
*/
void piirraNapit() {
  text("Symbols", 570, 70);
  int napinLeveys = 100;
  int napinKorkeus = 60;
  int aloitusX = 570;
  int aloitusY = 100;
  int marginaaliY = 20;
  //piirretaan symbolinapit
  for(int i = 0; i<4; i++) {
    rect(aloitusX, aloitusY + i*(marginaaliY + napinKorkeus), napinLeveys, napinKorkeus, 15, 2, 15, 2);
  }
  //piirretaan play-nappi
  ellipse(630, 470, 90, 90);
  //oman kuvan lisaaminen -nappi
  ellipse(630, 610, 150, 80);
}


/*Piirretaan valokuvavaihtoehdot alareunaan. 
*/
void piirraValokuvat() {
  int kuvanLeveys = 70;
  int kuvanKorkeus = 70;
  int aloitusY = 580; //vasemmanpuolimmaisen kuvan X-koordinaatti
  int aloitusX = 40;
  int marginaaliX = 10; //vali eri valokuvaruutujen valilla.
  text("Image Options", aloitusX, aloitusY-10);
  for(int i = 0; i < 6; i++) {
    rect(aloitusX+i*(kuvanLeveys+marginaaliX), aloitusY, kuvanLeveys, kuvanKorkeus, 5); 
  } 
}
