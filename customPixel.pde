PImage img;
ArrayList<spot> spots;
int scaleImage = 4; // will use only every 4th pixel from the image

void setup() {
  size(1080, 1080, P2D);  
  img = loadImage("megaMewtwoY.png");
  
  img.loadPixels();
  spots = new ArrayList<spot>();

  for (int x = 0; x < img.width; x += scaleImage) {
    for (int y = 0; y < img.height; y += scaleImage) {
      // this translates x and y coordinates into a location in the pixels array
      int loc = x + y * (img.width);
      
      spots.add(new spot(x, y, img.pixels[loc]));
    }
  }
}

void draw() { 
  background(0);
  
  for (spot spot : spots) {
    spot.run();
  }
  
  surface.setTitle("" + frameRate);
}
