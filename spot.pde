class Spot {

  PVector target, pos, mewtwo;
  
  float speed;
  float spotSize;
  boolean ready;
  
  color col;
  
  
  Spot(float x, float y, color _col, PVector _target) { // Referenced from class material
    pos = new PVector(x, y);
    col = _col;
    target = _target;
    speed = 0.02;
    spotSize = 10;
    ready = false;
  }
  
  void update() {
    pos.lerp(target, speed);
    ready = pos.dist(target) < 10;
  }
  
  void draw() {
    stroke(col);
    strokeWeight(spotSize);
    point(pos.x, pos.y);
  }
  
  void run() {
    update();
    draw();
  }

}
