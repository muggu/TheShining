
//oltava ulkoasuluokan attribuutteja
PImage oletuskuva;
OmaKuva omakuva;

//testaukseen, ei yhdistettyyn versioon
void setup() {
  size(600,600);
  oletuskuva = loadImage("tausta.jpg");
  omakuva = new OmaKuva(oletuskuva);
  omakuva.piirraKuva();
  valitseKuva();
}

//paaluokan draw-metodin on tarkkailtava, tarvitseeko oma kuva piirtaa
void draw() {
  //kutsupolut muokattava this.ulkoasu.omakuva.ladattuKuva tms.
  if (omakuva.ladattuKuva != null && omakuva.piirretty == false) {
    omakuva.piirraKuva();
    
    //testaukseen, ei yhdistettyyn versioon
    nimeaKuva();
  }
}

//apumetodi ulkoasuluokkaan, kutsuu lataaOmaKuva-metodia
//(eli tata kutsutaan, kun nappia painetaan)
void valitseKuva() {
  selectInput("Valitse kuvatiedosto (.jpg, .png, .tif tai .tga):", "lataaOmaKuva");
}

//apumetodi ulkoasuluokkaan
void lataaOmaKuva(File polku) {
  omakuva.lataaKuva(polku);
}

//apumetodi ulkoasuluokkaan, kutsuu tallennaOmaKuva-metodia
//(eli tata kutsutaan, kun nappia painetaan)
void nimeaKuva() {
  selectInput("Tallenna kuva nimella (ei tiedostopaatetta):", "tallennaOmaKuva");
}

//apumetodi ulkoasuluokkaan
void tallennaOmaKuva(File polku) {
  omakuva.tallennaKuva(polku);
}

//luokka oman kuvan lataamiseen ja kayttamiseen seka kuvan tallentamiseen
public class OmaKuva {
  
  public PImage ladattuKuva;
  PImage muokattuKuva;
  public boolean piirretty = false;
  
  //taytyy sovittaa piirtoalueen mittoihin ja marginaaleihin
  int sivu = width-50;
  int marginaaliX = 25;
  int marginaaliY = 25;
  
  public OmaKuva(PImage oletuskuva) {
    ladattuKuva = oletuskuva;
  }
  
  void lataaKuva(File polku) {
    if (polku != null) {
      println(polku);
      String kuva = polku.toString();
      ladattuKuva = loadImage(kuva);
      piirretty = false;
    } else {
      println("Tiedostoa ei valittu.");
    }
  }
  
  void piirraKuva() {
    
    //muutetaan sopivaan kokoon
    
    //skaalataan lyhyemman sivun mukaan
    /*if (ladattuKuva.height <= ladattuKuva.width) { //vaakakuva tai nelio
      float kerroin = ladattuKuva.height / ladattuKuva.width;
      ladattuKuva.resize(int(sivu*kerroin), sivu);
    }
    else { //pystykuva
      float kerroin = ladattuKuva.width / ladattuKuva.height;
      ladattuKuva.resize(sivu, int(sivu*kerroin));
    }*/
    
    //skaalataan pidemman sivun mukaan
    if (ladattuKuva.height <= ladattuKuva.width) { //vaakakuva tai nelio
      float kerroin = ladattuKuva.height / ladattuKuva.width;
      ladattuKuva.resize(sivu, int(sivu*kerroin));
    }
    else { //pystykuva
      float kerroin = ladattuKuva.width / ladattuKuva.height;
      ladattuKuva.resize(int(sivu*kerroin), sivu);
    }
    //PIIRTOALUEEN TAUSTA PIIRRETTAVA UUDESTAAN
    
    //piirretaan keskelle piirtoaluetta
    imageMode(CENTER);
    image(ladattuKuva, sivu/2 + marginaaliX, sivu/2 + marginaaliY);
    
    piirretty = true;
    
  }
  
  void tallennaKuva(File polku) {
    if (polku != null) {
      String nimi = polku.toString();
      //kaapataan pikselit uuteen kuvaan, joka on nelio
      muokattuKuva = get(marginaaliX, marginaaliY, sivu, sivu);
      //tallennetaan nimella
      muokattuKuva.save(nimi +".png");
    } else {
      println("Et antanut kuvalle nimea.");
    }
  }

}
