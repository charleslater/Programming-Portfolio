class star {
  //Member Variables
  int x, y, diam, speed;


  // Constructor
  star() {
    x=int(random(width));
    y=-10;
    diam=int(random(1, 4));
    speed =int(random(1, 6));
  }

  //Member Methods
  void display() {
    fill(255);
    ellipse(x, y, diam, diam);
  }

  void move() {
    y+=speed;
  }
  boolean reachedTop() {
    if (y>height+5) {
      return true;
    } else {
      return false;
    }
  }
  boolean intersect() {
    return true;
  }
}
