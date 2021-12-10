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
    speed = b / 1000;
    spotSize = abs(10 - (b * 10)) + 2;
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
