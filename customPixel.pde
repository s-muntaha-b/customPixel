PImage explosionImg, bg;

ArrayList<spot> spots;

int scaleImage = 4; // uses every fourth pixel from image

void setup() {
  size(1280, 720, P2D);  
  bg = loadImage("flameBG.png"); // image retrieved from http://pixelartmaker.com/art/a298a5319f34894
  bg.resize(1280, 720);
  explosionImg = loadImage("flamePixel.png"); // image retrieved from http://pixelartmaker.com/art/370776acb20eed7

  
  explosionImg.loadPixels();

  spots = new ArrayList<spot>();

  for (int x = 0; x < explosionImg.width; x += scaleImage) {
    for (int y = 0; y < explosionImg.height; y += scaleImage) {
      int loc = x + y * (explosionImg.height);
      spots.add(new spot(x, y, explosionImg.pixels[loc]));
    }
  }
}

void draw() { 
  background(bg);
  
  for (spot spot : spots) {
    spot.run();
  }
  
  surface.setTitle("" + frameRate);
}
