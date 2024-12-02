class laser {
  // Member Variables
  int x, y, w, h, speed;

  // Constructor
  laser(int x, int y) {
    this.x = x;
    this.y = y;
    w = 5;
    h = 10;
    speed = 10;
  }


  // Member Methods
  void display() {
    fill(255, 0, 0);
    rectMode(CENTER);
    noStroke();
    rect(x, y, w, h);
  }

  void move() {
    y-=speed;
  }

  boolean reachedTop() {
    if (y<-20) {
      return true;
    } else {
      return false;
    }
  }

  boolean intersect(rock r) {
   float d = dist(x, y, r.x, r.y);
    if (d<50) {
    return true;
  } else {
  return false;
  }
  }
}
