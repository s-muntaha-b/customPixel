PImage originalImage, image;

void setup() {
  size(1080, 1080, P2D);  
  originalImage = loadImage("megaMewtwoY.png");
  originalImage.resize(1080,1080);
;
  originalImage.loadPixels();
  
  image = originalImage.get();
  image.loadPixels();
}

void draw() { 
  int index1 = int(random(1, 10));
  int index2 = int(random(1, 10));
  int index3 = int(random(1, 10));
  
}
