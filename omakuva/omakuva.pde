
//oltava ulkoasuluokan attribuutteja
PImage oletuskuva;
OmaKuva omakuva;

//testaukseen, ei yhdistettyyn versioon
void setup() {
  size(600,600);
  this.oletuskuva = loadImage("tausta.jpg");
  this.omakuva = new OmaKuva(oletuskuva);
  this.omakuva.piirraKuva();
  this.valitseKuva();
}

//paaluokan draw-metodin on tarkkailtava, tarvitseeko oma kuva piirtaa
void draw() {
  //kutsupolut muokattava this.ulkoasu.omakuva.ladattuKuva tms.
  if (this.omakuva.ladattuKuva != null && this.omakuva.piirretty == false) {
    this.omakuva.piirraKuva();
    
    //testaukseen, ei yhdistettyyn versioon
    this.nimeaKuva();
  }
}

//apumetodi ulkoasuluokkaan, kutsuu lataaOmaKuva-metodia
//(eli tata kutsutaan, kun nappia painetaan)
void valitseKuva() {
  selectInput("Valitse kuvatiedosto (.jpg, .png, .tif tai .tga):", "lataaOmaKuva");
}

//apumetodi ulkoasuluokkaan
void lataaOmaKuva(File polku) {
  this.omakuva.lataaKuva(polku);
}

//apumetodi ulkoasuluokkaan, kutsuu tallennaOmaKuva-metodia
//(eli tata kutsutaan, kun nappia painetaan)
void nimeaKuva() {
  selectInput("Tallenna kuva nimella (ei tiedostopaatetta):", "tallennaOmaKuva");
}

//apumetodi ulkoasuluokkaan
void tallennaOmaKuva(File polku) {
  this.omakuva.tallennaKuva(polku);
}

//luokka oman kuvan lataamiseen ja kayttamiseen seka kuvan tallentamiseen
public class OmaKuva {
  
  public PImage ladattuKuva;
  public boolean piirretty = false;
  
  public OmaKuva(PImage oletuskuva) {
    this.ladattuKuva = oletuskuva;
  }
  
  void lataaKuva(File polku) {
    if (polku != null) {
      println(polku);
      String kuva = polku.toString();
      this.ladattuKuva = loadImage(kuva);
      this.piirretty = false;
    } else {
      println("Tiedostoa ei valittu.");
    }
  }
  
  void piirraKuva() {
     
    //taytyy sovittaa piirtoalueen mittoihin ja marginaaleihin
    int leveys = width-50;
    int korkeus = height-50;
    int marginaaliX = 25;
    int marginaaliY = 25;
    
    //muutetaan sopivaan kokoon
    if (this.ladattuKuva.height <= this.ladattuKuva.width) { //vaakakuva tai nelio
      float kerroin = this.ladattuKuva.height / this.ladattuKuva.width;
      this.ladattuKuva.resize(int(leveys*kerroin), korkeus);
    }
    else { //pystykuva
      float kerroin = this.ladattuKuva.width / this.ladattuKuva.height;
      this.ladattuKuva.resize(leveys, int(korkeus*kerroin));
    }
    
    //piirretaan keskelle piirtoaluetta
    imageMode(CENTER);
    image(this.ladattuKuva, leveys/2 + marginaaliX, korkeus/2 + marginaaliY);
    
    this.piirretty = true;
  }
  
  void tallennaKuva(File polku) {
    if (polku != null) {
      String nimi = polku.toString();
      this.ladattuKuva.save(nimi +".png");
    } else {
      println("Et antanut kuvalle nimea.");
    }
  }

}
