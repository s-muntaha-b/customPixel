PImage dialgaImg, palkiaImg;
color col1, col2;

ArrayList<Spot> spots;
ArrayList<PVector> arrayOne, arrayTwo;

int scaler = 3; // 3rd pixel from the images
int threshold = 200;

boolean imageToggled = false;

void setup() {
  size(1080, 1080, P2D);  
  dialgaImg = loadImage("dialgaPixel.png"); // Picture belongs to Pokemon/Nintendo
  dialgaImg.resize(1000, 1000);
  palkiaImg = loadImage("palkiaPixel.png"); // Picture belongs to Pokemon/Nintedo
  palkiaImg.resize(1000, 1000);

    int w, h;
  if (dialgaImg.width > palkiaImg.width) { // Referenced from class material
    w = dialgaImg.width;
  } else {
    w = palkiaImg.width; 
  }
  if (dialgaImg.height > palkiaImg.height) {
    h = dialgaImg.height;
  } else {
    h = palkiaImg.height;
  }
  surface.setSize(w, h);
  
  dialgaImg.loadPixels();
  palkiaImg.loadPixels();
  
  arrayOne = new ArrayList<PVector>();
  arrayTwo = new ArrayList<PVector>();
  
  col1 = color(255, 0, 247, 30);
  col2 = color(0, 26, 255, 30);
  
  for (int x = 0; x < palkiaImg.width; x += scaler) {  // Referenced from class material
    for (int y = 0; y < palkiaImg.height; y += scaler) {
      int loc = x + y * palkiaImg.width;


      if (brightness(palkiaImg.pixels[loc]) > threshold) {
        arrayTwo.add(new PVector(x, y));
      }
    }
  }

  spots = new ArrayList<Spot>();

  for (int x = 0; x < dialgaImg.width; x += scaler) {  
    for (int y = 0; y < dialgaImg.height; y += scaler) {
      int loc = x + y * dialgaImg.width;
      
      if (brightness(dialgaImg.pixels[loc]) > threshold) {
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
    for (Spot spot : spots) {
      if (!imageToggled) {
        int targetIndex = int(random(0, arrayOne.size()));
        spot.target = arrayOne.get(targetIndex); // Referenced from class material
        spot.col = col2;
      } else {
        int targetIndex = int(random(0, arrayTwo.size()));
        spot.target = arrayTwo.get(targetIndex);
        spot.col = col1;
      }
    }
    imageToggled = !imageToggled;
  }
    
  surface.setTitle("" + frameRate);
}
