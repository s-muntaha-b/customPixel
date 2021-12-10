PImage newtwoOG, newtwoImg;

void setup() {
  size(1080, 1080, P2D);  
  newtwoOG = loadImage("megaMewtwoY.png");
  newtwoOG.resize(1080,1080);
;
  newtwoOG.loadPixels();
  
  newtwoImg = newtwoOG.get();
  newtwoImg.loadPixels();
}

void draw() { 
  int indexOne = int(random(2, 10));
  int indexTwo = int(random(4, 10));
  int indexThree = int(random(6, 10));
  
  for (int i=0; i<newtwoImg.pixels.length; i++) {
    if (i % indexOne == 0) {
      newtwoImg.pixels[i] = color(159, 43, 104);
    } else if (i % indexTwo == 0) {
      newtwoImg.pixels[i] = color(119, 7, 55);
    } else if (i % indexThree == 0) {
      newtwoImg.pixels[i] = color(216, 191, 216);
    } 
  }
  newtwoImg.updatePixels();
  image(newtwoImg, 0, 0);
}
