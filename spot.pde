class spot {

  PVector position, target;
  color col;
  float speed;
  float spotSize;
  
  spot(float x, float y, color _col) {
    position = new PVector(x, y);
    target = new PVector(random(width), random(height));
    col = _col;
    
    float b = brightness(col) / 255;
    speed = b / 800;
    spotSize = abs(50 - (b * 5)) + 5;
  }
  
  void update() {
    position.lerp(target, speed);
  }
  
  void draw() {
    stroke(col);
    strokeWeight(spotSize);
    point(position.x, position.y);
  }
  
  void run() {
    update();
    draw();
  }

}
