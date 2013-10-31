/**Ulkoasuluokka piirtaa Shape-O-Maticin ulkoasun, kuten muuttuvat napit ja 
*valokuvavaihtoehdot
*/
public class Ulkoasu {

  PImage infokuva = loadImage("info.png");
  PImage lataakuva = loadImage("cloud-download.png");
  PImage playkuva = loadImage("play.png");
  PImage mikkihiiri = loadImage("mikkihiiri.png");
  PImage sydan = loadImage("sydan.png");
  PImage tahti = loadImage("tahti.png");
  PImage one = loadImage("one.png");
  PImage two = loadImage("two.png");
  PImage three = loadImage("three.png");
  PImage four = loadImage("four.png");
  PImage five = loadImage("five.png");
  PImage onevalittu = loadImage("onekopio.png");
  PImage twovalittu = loadImage("twokopio.png");
  PImage threevalittu = loadImage("threekopio.png");
  PImage fourvalittu = loadImage("fourkopio.png");
  PImage fivevalittu = loadImage("fivekopio.png");
  PImage save = loadImage("save.png");
  PFont fontti;
  int valittuSymboli = 0; //Symboli, jota on klikattu (highlight'aus). Alussa ylin symboli.
  int valittuValokuva = 0;
  //symbolinapit:
  int napinLeveys = 80; //symbolinapin leveys
  int napinKorkeus = 70;  //symbolinapin korkeus
  int aloitusX = 610;  //ylimman symbolin koordinaatti x
  int aloitusY = 100;  //ylimman symbolin koordinaatti y
  int marginaaliY = 30;  //symbolien pikselivali
  //valokuvaboksit:
  int kuvanLeveys = 70;  //valokuvaboksien leveys
  int kuvanKorkeus = 70;  //valokuvaboksien korkeus
  int aloitusY1 = 610; //vasemmanpuolimmaisen valokuvan X-koordinaatti
  int aloitusX1 = 40;  //vasemmanpuolimmaisen valokuvan y-koordinaatti
  int marginaaliX = 10; //pikselivali valokuvaruutujen valilla.
  //play-nappi
  int playX = 648;
  int playY = 440;
  int playHalkaisija = 90;
  //lataa oma kuva -nappi
  int lataaX = 585;
  int lataaY = 510;
  int lataaKorkeus = 85;
  int lataaLeveys = 128;
  //tallenna kuva -nappi
  int tallennaX = 470;
  int tallennaY = 610;
  int tallennaKorkeus = 64;
  int tallennaLeveys = 64;
  boolean klikattuPlay = false;
  //informaationappula
  int infoX = 710;
  int infoY = 30;
  int infoHalkaisija = 32;
  boolean infoNakyvilla = false;
  PImage[] symbolit = {sydan, mikkihiiri, tahti}; 
  PImage[] numerot = {one, two, three, four, five};
  PImage[] valittunro = {onevalittu, twovalittu, threevalittu, fourvalittu, fivevalittu};
  
  
  void piirraUlkoasu(){
   background(230, 240, 255, 250);
   size(750, 700);
   fill(200, 90);
   this.fontti = loadFont("otsikko.vlw");
   fill(80);
   textFont(fontti,48);
   text("Shape-O-Matic", 70, 55);
   fill(255,0);
   stroke(80);
   strokeWeight(3);
   rect(10, 70, 540, 520, 30);
   noStroke();
   piirraNapit();
   piirraValokuvat(); 
   piirraTallenna();
      
   PImage pause = loadImage("pause.png");
   stroke(150);
   strokeWeight(2);
   fill(200);
   ellipse(650, 442, 94, 94);
   image(pause, 605, 396);
   noFill();
   noStroke();
      
   }
  
  
  /**Piirtaa nappulat, joilla voi vaihtaa symbolia, jolla muodostetaan kuva.
  * Nappuloihin tulee kuvat listasta esim?!
  * Luo myos Play-napin, Info-napin ja myos oman kuvan lisaamista varten napin.
  */
  void piirraNapit() {
    //piirretaan symbolinapit
   tint(150);
   image(sydan, aloitusX+7, 103);
   image(mikkihiiri, aloitusX+1, 204);
   image(tahti, aloitusX+12, 302);
   image(tahti, aloitusX+13, 303);
     
   if (valittuSymboli != 1) {
      image(sydan, aloitusX+11, 102); 
   }
   
   if (valittuSymboli != 2) {
      image(mikkihiiri, aloitusX+5, 205); 
   }
   if (valittuSymboli != 3) {
       image(tahti, aloitusX+14, 304);
       image(tahti, aloitusX + 15, 305);
   }
      
   noTint();
   image(mikkihiiri, aloitusX,200);
   image(sydan, aloitusX + 5, 98);
   image(tahti, aloitusX + 10, 300); 
  
    stroke(0);
    //piirretaan play-nappi
    scale(0.75); //pienennetaan play-kuvaa
    image(playkuva, (1/0.75)*(playX-playHalkaisija/2), (1/0.75)*(playY-playHalkaisija/2));
    scale(1/0.75);
    //oman kuvan lisaaminen -nappi
    
    tint(150);
    image(lataakuva, lataaX+5, lataaY+5);
    noTint();
    fill(250);
    noStroke();
    image(lataakuva, lataaX, lataaY);
    //infonappula:
    stroke(0);
    fill(255);
    scale(0.5);
    image(infokuva, infoX*2-infoHalkaisija, 2*infoY-infoHalkaisija);  
    scale(1/0.5);
    fill(200);
}
    
  /*Piirretaan valokuvavaihtoehdot alareunaan. 
  */
  void piirraValokuvat() {
    noStroke();
    fill(230, 240, 255, 250);
    rect(30, 595, 400, 90);
    for(int i = 0; i < 5; i++) {
      //stroke(0);
      if (this.valittuValokuva == i+1) {
        image(valittunro[i], aloitusX1+i*(kuvanLeveys+marginaaliX), aloitusY1); 
      }
      else{
        image(numerot[i], aloitusX1+i*(kuvanLeveys+marginaaliX), aloitusY1); 
      }
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
     this.piirraUlkoasu();
   }
   return false;
 }
 
 /**Piirtaa infoboksin, jossa lukee ohjelman kaytto-ohjeet.
 *
 */
 void piirraInfoboksiNakyviin() {
  this.piirraUlkoasu();
  this.infoNakyvilla = true;
  textAlign(CENTER);
  fill(80);
  
  textFont(fontti,32);
  text("Welcome to Shape-O-Matic!", 275, 130);
  textFont(fontti,22);
  text("With this new picture editor you can", 275, 185);
  text("modify your pictures with different shapes!", 275, 210);
  text("First, choose the shape that will form the image.", 275, 235);
  text("Then, choose the number of an image, and click play!", 275, 260);
  text("When the program is running, you're not able", 275, 285);
  text("to change the shape or image.", 275, 310);
  text("You can also upload your own pictures", 275, 335);
  text("(best result with resolution of 400x400).", 275, 360);
  text("After the creating process is finished,",275, 385);
  text("you can save your unique piece of art.",275, 410);
  text("'Art is not what you see, but what you make others see.'", 275, 480);
  textAlign(RIGHT);
  text("- Edgar Degas", 450, 510);
  textAlign(LEFT);
 }
 
 //Piirtaa tallennusnapin
 void piirraTallenna() {
   image(save, tallennaX, tallennaY);
 }
 
 //tarkastelee, onko klikattu lataanappia
 boolean klikattuLataa(int mouseX, int mouseY) {
   int x = mouseX;
   int y = mouseY;
   
   if (y >= lataaY && y <= lataaY + lataaKorkeus) {
     if ( x >= lataaX && x <= lataaX + lataaLeveys) {
       println("latausnappi");
       return true;
     }
   }
   return false;
 }
 
 //tarkistaa onko klikattu tallennanappia
 boolean klikattuTallenna(int mouseX, int mouseY) {
   int x = mouseX;
   int y = mouseY;
   
   if (y >= tallennaY && y <= tallennaY + tallennaKorkeus) {
     if ( x >= tallennaX && x <= tallennaX + tallennaLeveys) {
       println("latausnappi");
       return true;
     }
   }
   return false;
   
   
 }
 
}
 
  

