class SpaceShip {
  // Member Variables
  int x, y, w, laserCount, turretCount, health;
  PImage ship;

  // Constructor
  SpaceShip() {
    x = width/2;
    y = height/2;
    w = 100;
    laserCount = 100;
    turretCount = 1;
    health = 10;
    ship = loadImage("rocket.png");
  }


  // Member Methods
  void display() {
    imageMode(CENTER);
    image(ship, x, y);
  }

  void move(int tempX, int tempY) {
    x = tempX;
    y = tempY;
  }

  boolean fire() {
    if (laserCount>0) {
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
