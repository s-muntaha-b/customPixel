PImage megaX, megaY;
color col1, col2;

ArrayList<Spot> spots;
ArrayList<PVector> arrayOne, arrayTwo;

int scaler = 3; // 3rd pixel from the images
int threshold = 200;

boolean imageToggled = false;

void setup() {
  size(1080, 1080, P2D);  
  megaX = loadImage("megaMewtwoX.png");
  megaX.resize(1080, 1080);
  megaY = loadImage("megaMewtwoY.png");
  megaY.resize(1080, 1080);

    int w, h;
  if (megaX.width > megaY.width) { // Referenced from class material
    w = megaX.width;
  } else {
    w = megaY.width; 
  }
  if (megaX.height > megaY.height) {
    h = megaX.height;
  } else {
    h = megaY.height;
  }
  surface.setSize(w, h);
  
  megaX.loadPixels();
  megaY.loadPixels();
  
  arrayOne = new ArrayList<PVector>();
  arrayTwo = new ArrayList<PVector>();
  
  col1 = color(186, 85, 211, 30);
  col2 = color(74, 0, 130, 30);
  
  for (int x = 0; x < megaY.width; x += scaler) {  // Referenced from class material
    for (int y = 0; y < megaY.height; y += scaler) {
      int loc = x + y * megaY.width;


      if (brightness(megaY.pixels[loc]) > threshold) {
        arrayTwo.add(new PVector(x, y));
      }
    }
  }

  spots = new ArrayList<Spot>();

  for (int x = 0; x < megaX.width; x += scaler) {  
    for (int y = 0; y < megaX.height; y += scaler) {
      int loc = x + y * megaX.width;
      
      if (brightness(megaX.pixels[loc]) > threshold) {
        int targetIndex = int(random(0, arrayTwo.size()));
        arrayOne.add(new PVector(x, y));
        Spot spot = new Spot(x, y, col1, arrayTwo.get(targetIndex));
        spots.add(spot); // Referenced from class material
      }
    }
  }
}

void draw() { 
  background(0);
  
  blendMode(ADD);
  
  boolean imageFlip = true;

  for (Spot spot : spots) {
    spot.run();
    if (!spot.ready) imageFlip  = false;
  }
  
  if (imageFlip) {
    for (Spot dot : spots) {
      if (!imageToggled) {
        int targetIndex = int(random(0, arrayOne.size()));
        dot.target = arrayOne.get(targetIndex); // Referenced from class material
        dot.col = col2;
      } else {
        int targetIndex = int(random(0, arrayTwo.size()));
        dot.target = arrayTwo.get(targetIndex);
        dot.col = col1;
      }
    }
    imageToggled = !imageToggled;
  }
    
  surface.setTitle("" + frameRate);
}
