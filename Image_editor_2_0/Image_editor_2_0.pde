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


boolean piirretty = false;

void setup() {
  size(600, 480);
  kuva = loadImage("minionitpieni.jpg");
  imageMode(CENTER);
  noStroke();
  background(255);
   
  asetaLeimasin(tahti);
  
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
    luku -=0.2*pienennysKerroin;
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


/*
Kuvan piirto
*/
void draw() {
  
  if(kaynnissa()){
    
    //Valitaan randomikoordinaatteja kuvasta, joita piirretään.
    x = int(random(kuva.width));
    y = int(random(kuva.height));
    
    
    //Pienennetään kuvion kokoa ja piirretään kuvio. 
    koko = pienenee(koko);
    
    color vari = kuva.get(x, y);
    fill(vari,255);

    //Sydän
    if(leimasin == sydan){
      
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
    
    //Mikki hiiri
    if(leimasin == palloKorva){
    // Muunnetaan eri ellipsien x- ja y-koordinaatit kuntoon
      float ellipsiX1 = x-ellipsiMuuntokerroinX*koko; 
      float ellipsiY1 = y-ellipsiMuuntokerroinY*koko;
      float ellipsiX2 = x+ellipsiMuuntokerroinX*koko;
      float ellipsiY2 = y-ellipsiMuuntokerroinY*koko;
      
    //Mikkihiiren eri pallojen värit
   // color variEllipsi1 = kuva.get(int(ellipsiX1), int(ellipsiY1));
   // color variEllipsi2 = kuva.get(int(ellipsiX2), int(ellipsiY2));

      ellipse(ellipsiX1, ellipsiY1, koko, koko);
      
      ellipse(ellipsiX2, ellipsiY2, koko, koko);
      
      ellipse(x, y, ellipsiKokokerroin*koko, ellipsiKokokerroin*koko);
    
      if(koko < 0.4*suuriKoko){
    
        x = int(random(kuva.width));
        y = int(random(kuva.height));

        color vari1 = kuva.get(x, y);
        fill(vari1,255);
        
        float ellipsiX11 = x-ellipsiMuuntokerroinX*koko; 
        float ellipsiY11 = y-ellipsiMuuntokerroinY*koko;
        float ellipsiX21 = x+ellipsiMuuntokerroinX*koko;
        float ellipsiY21 = y-ellipsiMuuntokerroinY*koko;
        
      
        
        ellipse(ellipsiX11, ellipsiY11, koko, koko);
        
        ellipse(ellipsiX21, ellipsiY21, koko, koko);
        
        ellipse(x, y, ellipsiKokokerroin*koko, ellipsiKokokerroin*koko); 
  }  


}
    
    if(leimasin == tahti){
      
      triangle(x-0.12*koko, y+0.15*koko, x, y-0.08*koko, x+0.12*koko, y+0.15*koko);
      triangle(x-0.12*koko, y, x, y+0.22*koko, x+0.12*koko, y); 

      
    }
  }
}