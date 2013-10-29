
//luokka oman kuvan lataamiseen ja kayttamiseen seka kuvan tallentamiseen
public class OmaKuva {
  
  public PImage ladattuKuva;
  
  //taytyy sovittaa piirtoaluenelion sivun pituuteen ja marginaaleihin
  int sivu = 470; //sivun pituus pikseleina
  int marginaaliX = 70;
  int marginaaliY = 80;
  
  PImage lataaKuva(File polku) {
    if (polku != null) {
      println(polku);
      String kuva = polku.toString();
      ladattuKuva = loadImage(kuva);
      return ladattuKuva;
    } else {
      println("Tiedostoa ei valittu.");
      return null;
    }
  }
  
  void tallennaKuva(File polku) {
    if (polku != null) {
      String nimi = polku.toString();
      //kaapataan pikselit uuteen kuvaan, joka on nelio
      PImage muokattuKuva = get(marginaaliX, marginaaliY, sivu, sivu);
      //tallennetaan nimella
      muokattuKuva.save(nimi +".png");
    } else {
      println("Et antanut kuvalle nimea.");
    }
  }

}
