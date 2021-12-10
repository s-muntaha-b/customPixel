PImage mewtwoX, mewtwoY;

ArrayList<spot> spots;

int scaleImage = 4; // uses every fourth pixel from image

void setup() {
  size(1080, 1080, P2D);  
  mewtwoX = loadImage("megaMewtwoX.png");
  mewtwoY = loadImage("megaMewtwoY.png");

  
  mewtwoX.loadPixels();
  mewtwoY.loadPixels();

  spots = new ArrayList<spot>();

  for (int x = 0; x < mewtwoX.width; x += scaleImage) {
    for (int y = 0; y < mewtwoX.height; y += scaleImage) {
      // this translates x and y coordinates into a location in the pixels array
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
