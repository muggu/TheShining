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
int pienennysKerroin = 1;

int leimasin = palloKorva;

float ellipsiMuuntokerroinX = 0.50;
float ellipsiMuuntokerroinY = 0.60;
float ellipsiKokokerroin = 1.6;

float sydanMuuntokerroinX = 0.3;
float sydanMuuntokerroinY = 0.1;
float sydanMuuntokerroinY2 = 0.2;


void setup() {
  size(600, 480);
  kuva = loadImage("minionitpieni.jpg");
  imageMode(CENTER);
  noStroke();
  background(255);
  
  
  if (leimasin == sydan){
  pieniKoko = 50;
  suuriKoko = 500;
  pallojenMaara = 1000;
  pienennysKerroin = 2;
  }
  
  if(leimasin == palloKorva){
  pieniKoko = 10;
  suuriKoko = 100;
  pallojenMaara = 1500;
  
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

/*
Metodi pienentää parametrina annettua lukua riippuen sen koosta,
ja palauttaa muutetun lukuarvon.
*/
float pienenee(float luku){
if(luku > pieniKoko){
  if(luku < 0.2*suuriKoko){
    luku -=0.05*pienennysKerroin;
  }
  if(luku < 0.4*suuriKoko){
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
    
    //Sydän
    if(leimasin == sydan){
      
      //Apumuuttujia
      float sydanX1 = x + sydanMuuntokerroinX*koko; 
      float sydanX2 = x - sydanMuuntokerroinX*koko;
      float sydanY1 = y - sydanMuuntokerroinY2*koko;
      float sydanY2 = y - sydanMuuntokerroinY*koko;
      float sydanY3 = y + sydanMuuntokerroinY2*koko;
  
      smooth();
      fill(vari,255);
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

    fill(vari, 255); 
    ellipse(ellipsiX1, ellipsiY1, koko, koko);
    
    fill(vari, 255);
    ellipse(ellipsiX2, ellipsiY2, koko, koko);
    
    fill(vari, 255);
    ellipse(x, y, ellipsiKokokerroin*koko, ellipsiKokokerroin*koko);
    }
  }
}
