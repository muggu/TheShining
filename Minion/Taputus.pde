import pitaru.sonia_v2_9.*;

public class Taputus{
 
  
float clapLevel = 0.5;  // How loud is a clap
float threshold = 0.25; // How quiet is silence
boolean clapping = false;

Taputus(){
 LiveInput.start(); // Start listening to the microphone 
}

boolean annaVolume(){
  if(clapping){
    return true;}
    else{
    return false;
    }
}


void volume(){
    
    float clapLevel = 0.5;  // How loud is a clap
    float threshold = 0.25; // How quiet is silence

    
    float vol = LiveInput.getLevel();
    
    if (vol > clapLevel  && !clapping){ 
      clapping = true;
      println("eihän tää tänne mee edes, saatana");
  
    }
    else if (clapping && vol < threshold){
      clapping = false;
      println("toimiiko ees tääkään, helvetti");
    }
  
  
  }
}
