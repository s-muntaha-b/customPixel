PImage mewtwoX, mewtwoY;

ArrayList<spot> spots;

int scaleImage = 4; // uses every fourth pixel from image

void setup() {
  size(1080, 1080, P2D);  
  mewtwoX = loadImage("megaMewtwoX.png");

  
  mewtwoX.loadPixels();

  spots = new ArrayList<spot>();

  for (int x = 50; x < mewtwoX.width; x += scaleImage) {
    for (int y = 50; y < mewtwoX.height; y += scaleImage) {
      int loc = x + y * (mewtwoX.width);
      spots.add(new spot(x, y, mewtwoX.pixels[loc]));
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
