class Dot {

  PVector target, pos, mewtwo;
  
  float speed;
  float dotSize;
  boolean ready;
  
  color col;
  
  
  Dot(float x, float y, color _col, PVector _target) {
    pos = new PVector(x, y);
    col = _col;
    target = _target;
    speed = 0.02;
    dotSize = 10;
    ready = false;
  }
  
  void update() {
    pos.lerp(target, speed);
    ready = pos.dist(target) < 10;
  }
  
  void draw() {
    stroke(col);
    strokeWeight(dotSize);
    point(pos.x, pos.y);
  }
  
  void run() {
    update();
    draw();
  }

}
