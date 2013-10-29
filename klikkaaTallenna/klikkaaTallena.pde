  //kun klikattu lataa oma kuva -nappia
 boolean klikattuLataa(int mouseX, int mouseY) {
   int x = mouseX;
   int y = mouseY;
   if( y >= tallennaY && y <= tallennaY + tallennaKorkeus) {
    if (x >= tallennaX && x <= tallennaX + tallennaLeveys) {
      
     println("latausnappi");
     return true;
    }
   }
   return false;
 }
