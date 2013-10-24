PImage kuva;
int pieniKoko;
int suuriKoko;
float koko;
int lopetus;
int x;
int y;
int pallot;

void setup() {
  size(800, 480);
  kuva = loadImage("minionitpieni.jpg");
  pieniKoko = 15;
  suuriKoko = 150;
  koko = suuriKoko;
  imageMode(CENTER);
  noStroke();
  background(255);
}

/*
Metodi tarkistaa onko kuvan piirto vielä käynnissä, eli 
onko pieniä palloja piirretty riittävästi
*/
boolean kaynnissa(){
 if(pallot <= 700){
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
  if(luku <30){
    luku -=0.05;
  }
  if(luku < 60){
    luku -=0.1;
  }
  else{
    luku -=0.2;
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
    
    color vari = kuva.get(x, y);
    fill(vari, 200);
    
    //Pienennetään kuvion kokoa ja piirretään kuvio. 
    koko = pienenee(koko);
    rect(x, y, koko, koko);
  }
}
