PImage kuva;
int pieniKoko;
int suuriKoko;
float koko;
int lopetus;
int x;
int y;
int pallot;
int pallojenMaara;
int sydan = 1;
int palloKorva = 2;
int tahti = 3;
int pienennysKerroin = 1;
int korkeus;
int leveys;
float transparency;
int alkuX = 70; //static? 
int alkuY = 90;

boolean kuvaaPiirretaan;
boolean playKlikattu; 
int leimasin;

float ellipsiMuuntokerroinX = 0.50;
float ellipsiMuuntokerroinY = 0.60;
float ellipsiKokokerroin = 1.6;

float sydanMuuntokerroinX = 0.3;
float sydanMuuntokerroinY = 0.1;
float sydanMuuntokerroinY2 = 0.2;

float kolmionMuuntokerroinX = 0.12;
float kolmionMuuntokerroinY = 0.15;
float kolmionMuuntokerroinY2 = 0.08;
float kolmionMuuntokerroinY3 = 0.22; 

Ulkoasu ulkoasu; 

void setup() {
  
  this.ulkoasu = new Ulkoasu();

  kuva = loadImage("minionitpieni.jpg");
  noStroke();
  background(255);
  
  leimasin = sydan;
  tarkistaLeimasin();
  
  koko = suuriKoko;
  this.ulkoasu.piirraUlkoasu();

}

void tarkistaLeimasin(){
  
  if (leimasin == sydan){
  pieniKoko = 50;
  suuriKoko = 500;
  pallojenMaara = 1500;
  pienennysKerroin = 4;
  }
  
  if(leimasin == palloKorva){
  pieniKoko = 10;
  suuriKoko = 100;
  pallojenMaara = 2000;
  
  }
  
  if(leimasin == tahti){
  pieniKoko = 80;
  suuriKoko = 500;
  pallojenMaara = 1000; 
  pienennysKerroin = 4; 
  }
}

/*
Metodi tarkistaa onko kuvan piirto vielä käynnissä, eli 
onko pieniä palloja piirretty riittävästi
*/
boolean kaynnissa(){
 if(pallot <= pallojenMaara){
 return true;
 }
 else{
 playKlikattu = false;
 pallot = 0;
 return false;
}
}


/*
Metodi pienentää parametrina annettua lukua riippuen sen koosta,
ja palauttaa muutetun lukuarvon.
*/
float pienenee(float luku){
  
if(luku > pieniKoko){
  if(luku < 0.3*suuriKoko){
   luku -= 0.02*pienennysKerroin; 
  }
  
  if(luku < 0.5*suuriKoko){
    luku -=0.05*pienennysKerroin;
  }
  if(luku < 0.7*suuriKoko){
    luku -=0.1*pienennysKerroin;
  }
  else{
    luku -=0.2*pienennysKerroin;
  }
}
else{
  pallot += 1;
}
return luku;
}


void piirra(){
  
  noStroke();
  
  leveys = kuva.width;
  korkeus = kuva.height;

  if(leveys > 470){
    leveys = 470;
  }
  if(korkeus > 490){
    korkeus = 490; 
  }
  x = int(random(alkuX, leveys));
  y = int(random(alkuY, korkeus));  

  //Pienennetään kuvion kokoa ja piirretään kuvio. 
  koko = pienenee(koko);
    
  color vari = kuva.get(x, y);
  fill(vari,255);
  
}


void piirraSydan(){
  
  
   //Apumuuttujia
      float sydanX1 = x + sydanMuuntokerroinX*koko; 
      float sydanX2 = x - sydanMuuntokerroinX*koko;
      float sydanY1 = y - sydanMuuntokerroinY2*koko;
      float sydanY2 = y - sydanMuuntokerroinY*koko;
      float sydanY3 = y + sydanMuuntokerroinY2*koko;
  
      smooth();
      beginShape();
      vertex(x, y); 
      bezierVertex(x, sydanY1, sydanX1, sydanY2, x, sydanY3); 
      vertex(x, y); 
      bezierVertex(x, sydanY1, sydanX2, sydanY2, x, sydanY3); 
      endShape();
      
}

void piirraPalloKorva(){
  
      // Muunnetaan eri ellipsien x- ja y-koordinaatit kuntoon
      float ellipsiX1 = x-ellipsiMuuntokerroinX*koko; 
      float ellipsiY1 = y-ellipsiMuuntokerroinY*koko;
      float ellipsiX2 = x+ellipsiMuuntokerroinX*koko;
      float ellipsiY2 = y-ellipsiMuuntokerroinY*koko;

      ellipse(ellipsiX1, ellipsiY1, koko, koko);
      
      ellipse(ellipsiX2, ellipsiY2, koko, koko);
      
      ellipse(x, y, ellipsiKokokerroin*koko, ellipsiKokokerroin*koko);
}

void piirraTahti(){
  float tahtiX1 = x-kolmionMuuntokerroinX*koko;
  float tahtiX2 = x+kolmionMuuntokerroinX*koko;
  float tahtiY1 = y+kolmionMuuntokerroinY*koko;
  float tahtiY2 = y-kolmionMuuntokerroinY2*koko;
  float tahtiY3 = y+kolmionMuuntokerroinY3*koko;
  
  triangle(tahtiX1, tahtiY1, x, tahtiY2, tahtiX2, tahtiY1);
  triangle(tahtiX1, y, x,tahtiY3, tahtiX2, y);
}

void piirraKuva(){
    
 if(mouseX >= alkuX && mouseX <= 
  leveys && mouseY >= alkuY && mouseY <= korkeus){
    
  kuvaaPiirretaan = true;  
  
  if(transparency <= 255){
    transparency = transparency + 0.2 ;
  } 
  
 if(transparency >= 100){
    transparency = transparency + 1 ;
  }
  
 
  tint(255,255,255,transparency);
  image(kuva, alkuX, alkuY, leveys, korkeus);
  
}else{

transparency = 0;
kuvaaPiirretaan = false;

}
}
/*
Kuvan piirto
*/
void draw() {
  
  piirraKuva();
  tarkistaLeimasin();
  
  if(kaynnissa() && playKlikattu && !kuvaaPiirretaan){
    
    piirra();

    //Sydän
    if(leimasin == sydan){
     piirraSydan();
     
      if(koko < 0.5*suuriKoko){
        piirraSydan();
        piirraSydan();
      } 
     
    }
    
    //Mikki hiiri
    if(leimasin == palloKorva){
      
      piirraPalloKorva();
    
      if(koko < 0.5*suuriKoko){
        piirraPalloKorva();
        piirraPalloKorva();
      }  
      
      if(koko < 0.3*suuriKoko){
       piirraPalloKorva();
       piirraPalloKorva();
       piirraPalloKorva();
       piirraPalloKorva();
      } 


}
    
    if(leimasin == tahti){
      
      piirraTahti(); 
      
      if(koko < 0.5*suuriKoko){
        piirraTahti();
        piirraTahti();
      
    }  

    }
  }
  else{
   koko = suuriKoko; 
  }
}

void mouseClicked() {  
  if(!playKlikattu){
    
  this.ulkoasu.klikattuSymboli(mouseX, mouseY);
  this.ulkoasu.klikattuValokuva(mouseX, mouseY);
  this.ulkoasu.klikattuPlay(mouseX, mouseY);

  
  if(this.ulkoasu.klikattuPlay(mouseX,mouseY)){
   this.ulkoasu.piirraUlkoasu();
   playKlikattu = true; 
  }  
    
  if(this.ulkoasu.klikattuSymboli(mouseX, mouseY) != 0){
  leimasin = this.ulkoasu.klikattuSymboli(mouseX, mouseY);
  }
  }
  
}

void mouseMoved() {
  if(mouseX >= 600 && mouseY <= 100 && !playKlikattu) {
    this.ulkoasu.onkoInfonSisalla(mouseX, mouseY); 
  }
}
