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

void setup() {
  size(600, 480);
  kuva = loadImage("minionitpieni.jpg");
  imageMode(CENTER);
  noStroke();
  background(255);
   
  asetaLeimasin(sydan);
  
  if (leimasin == sydan){
  pieniKoko = 50;
  suuriKoko = 500;
  pallojenMaara = 1500;
  pienennysKerroin = 2;
  }
  
  if(leimasin == palloKorva){
  pieniKoko = 8;
  suuriKoko = 100;
  pallojenMaara = 2000;
  
  }
  
  if(leimasin == tahti){
  pieniKoko = 50;
  suuriKoko = 500;
  pallojenMaara = 1000; 
  pienennysKerroin = 4; 
  }
  koko = suuriKoko;
}

/*
Metodi tarkistaa onko kuvan piirto vielä käynnissä, eli 
onko pieniä palloja piirretty riittävästi
*/
boolean kaynnissa(){
 if(pallot <= pallojenMaara){
 return true;
 }
 return false;
}

void leimasimenValinta(int arvo){
leimasin = arvo; 
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
    luku -=0.3*pienennysKerroin;
  }
}
else{
  pallot += 1;
}
return luku;
}

void asetaLeimasin(int luku){
leimasin = luku;
}

void piirra(){
  x = int(random(kuva.width));
  y = int(random(kuva.height));  
  
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

/*
Kuvan piirto
*/
void draw() {
  
  if(kaynnissa()){
    
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
}
