import processing.video.*;
Capture cam;
PImage img;


void setup() {
  size(800, 600);
  cam = new Capture(this, 640, 480);
  cam.start();
}



 
void randomPixelManipulation(Capture cam) {
  // Make sure the camera has a new frame available
  if (cam.available()) {
    cam.read();
  }
  
  // Load camera pixels
  cam.loadPixels();
  loadPixels();


     for (int i = 0; i < cam.pixels.length; i++) {
    // Randomly alter the color values of each pixel
    float r = red(cam.pixels[i]);
    float g = green(cam.pixels[i]);
    float b = blue(cam.pixels[i]);


    r += random(-120,200); // Adjust the range as needed
    g += random(-100,150);
    b += random(-200,75);

    // Ensure color values stay within the valid range (0-255)
    r = constrain(r, 0, 255);
    g = constrain(g, 0, 255);
    b = constrain(b, 0, 255);

    cam.pixels[i] = color(r, g, b);
  }

  cam.updatePixels();
}

