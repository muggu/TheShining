import pitaru.sonia_v2_9.*;

public class Taputus{
  
float clapLevel = 0.5;  // How loud is a clap
float threshold = 0.25; // How quiet is silence
boolean clapping = false;
  
  Taputus() {
    Sonia.start(this); // Start Sonia engine.
    LiveInput.start(); // Start listening to the microphone
  }
  
  float volume(){
    float vol = LiveInput.getLevel();
    
    if (vol > clapLevel && !clapping) { 
    clapping = true; // We are now clapping!
  } 
    else if (clapping && vol < threshold) { 
    // Otherwise, if we were just clapping and the volume level has gone down below 0.25, then we are no longer clapping!
    clapping = false;
  }
  }
  
  // Close the sound engine
public void stop() {
  Sonia.stop();
  super.stop();
}
  
  }
