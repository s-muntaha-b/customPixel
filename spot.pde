class spot {

  PVector position, target;
  color colours;
  float speed;
  float spotSize;
  
  spot(float x, float y, color _col) {
    colours = _col;
    position = new PVector(x, y);
    target = new PVector(random(width), random(height));
    
    float b = brightness(colours) / 255;
    speed = b / 800;
    spotSize = abs(50 - (b * 5)) + 5;
  }
  
  void update() {
    position.lerp(target, speed);
  }
  
  void draw() {
    stroke(colours);
    strokeWeight(spotSize);
    point(position.x, position.y);
  }
  
  void run() {
    update();
    draw();
  }

}
