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

 for (int x = 0; x < cam.width; x++) {
    for (int y = 0; y < cam.height; y++) {
      int loc = x + y * cam.width;

   

      color currentColor = cam.pixels[loc];

    // Randomly alter the color values of each pixel
    float r = red(currentColor);
    float g = green(currentColor);
    float b = blue(currentColor);

if (random(1) < 0.1) { // 10% chance to modify each pixel
    r += random(-120,200); // Adjust the range as needed
    g += random(-100,150);
    b += random(-200,75);

    // Ensure color values stay within the valid range (0-255)
   r = constrain(r, 0, 255);
    g = constrain(g, 0, 255);
   b = constrain(b, 0, 255);
}

   pixels[loc] = color(r, g, b);
  }
 }

 updatePixels();
}

