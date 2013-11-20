import processing.video.*;

Capture video;
PImage img;
int brightestValue;

void setup() {
  size(640, 480);
  img = loadImage("minion.jpg");
  brightestValue = 0;
  // Uses the default video input, see the reference if this causes an error
  video = new Capture(this, width, height);
  video.start();  
  noStroke();
  smooth();
}

void draw() {
  loadPixels();

  if (video.available()) {
    video.read();
    image(img, 0, 0, width, height); // Draw the picture onto the screen

    int brightestX = 0; // X-coordinate of the brightest video pixel
    int brightestY = 0; // Y-coordinate of the brightest video pixel
    float brightestValue = 0; // Brightness of the brightest video pixel
    // Search for the brightest pixel: For each row of pixels in the video image and
    // for each pixel in the yth row, compute each pixel's index in the video
    
    video.loadPixels();
    int index = 0;
    float brightnessSum = 0.0;
    for (int y = 0; y < video.height; y++) {
      for (int x = 0; x < video.width; x++) {
    
        // Get the color stored in the pixel
        int pixelValue = video.pixels[index];
    
        // Determine the brightness of the pixel
        float pixelBrightness = brightness(pixelValue);
        brightnessSum += pixelBrightness;
    
        // If that value is brighter than any previous, then store the
        // brightness of that pixel, as well as its (x,y) location
        if (pixelBrightness > brightestValue) {
          brightestValue = pixelBrightness;
          //brightestY = y;
          //brightestX = x;
        }
        index++;
      }
    }
    
    brightestValue = brightnessSum / (video.height * video.width);
    
    System.out.println(brightestValue);

    for (int x = 0; x < img.width; x++) {
    for (int y = 0; y < img.height; y++ ) {
      // Calculate the 1D location from a 2D grid
      int loc = x + y*img.width;
      
      // Get the R,G,B values from image
      float r,g,b;
      r = red (img.pixels[loc]);
      g = green (img.pixels[loc]);
      b = blue (img.pixels[loc]);
      
      // Calculate an amount to change brightness based on proximity to the mouse
      //float maxdist = 50;//dist(0,0,width,height);
      //float d = dist(x, y, mouseX, mouseY);
      float adjustbrightness = brightestValue*0.2;
      r += adjustbrightness;
      g += adjustbrightness;
      b += adjustbrightness;
      
      // Constrain RGB to make sure they are within 0-255 color range
      r = constrain(r, 0, 255);
      g = constrain(g, 0, 255);
      b = constrain(b, 0, 255);
      
      // Make a new color and set pixel in the window
      color c = color(r, g, b);
      //color c = color(r);
      pixels[y*width + x] = c;
        
    // Draw a large, yellow circle at the brightest pixel
    //fill(255, 204, 0, 128);
    //ellipse(brightestX, brightestY, 200, 200);
  }
}

  updatePixels();

  }
  
}
