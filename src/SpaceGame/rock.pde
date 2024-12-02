class rock {
  // Member Variables
  int x, y, diam, speed;
  PImage r1;

  // Constructor
  rock() {
    x = int(random(width));
    y = -300;
    diam = int(random(20, 80));
    speed = int(random(1, 5));
    r1 = loadImage("New Piskel (1).png");
  }


  // Member Methods
  void display() {
    imageMode(CENTER);
    r1. resize(diam, diam);
    image(r1, x, y);
  }

  void move() {
    y=y+speed;
  }

  boolean reachedTop() {
    return true;
  }

  boolean reachedBottom() {
    if (y>height+80) {
      return true;
    } else {
      return false;
    }
  }
}
