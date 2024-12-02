// Charles Later | SpaceGame | 11-6-2024
import processing.sound.*;
SoundFile laser;
SpaceShip A;
ArrayList<rock> rocks = new ArrayList<rock>();
ArrayList<laser> lasers = new ArrayList<laser>();
ArrayList<powerup> powerups = new ArrayList<powerup>();
ArrayList<star> stars = new ArrayList<star>();
int score, level, rockRate;
boolean play;
timer rTime, puTime;


void setup() {
  size(800, 800);
  A = new SpaceShip();
  score = 0;
  level = 1;
  play = false;
  rockRate = 1000;
  rTime = new timer(rockRate);
  rTime.start();
  puTime = new timer(5000);
  puTime.start();
  laser = new SoundFile(this, "mario_fall.wav");
}

void draw() {
  if (!play) {
    startScreen();
  } else {
    background(0);
    if (frameCount % 1000 == 0) {
      level++;
      rockRate -= 50;
    }
    stars.add(new star());
    for (int i=0; i<stars.size(); i++) {
      star s = stars.get(i);
      s.display();
      s.move();
      if (s.reachedTop()) {
        stars.remove(s);
      }
    }

    if (puTime.isFinished()) {
      powerups.add(new powerup());
      puTime.start();
    }
    //Render powerups
    for (int i = 0; i < powerups.size(); i++) {
      powerup pu = powerups.get(i);
        pu.display();
        pu.move();
      if (pu.intersect(A) && pu.type == 'h') {
        //1. remove powerup
        powerups.remove(pu);
        //2. health bennefit
        A.health += 10;
      } else if (pu.intersect(A) && pu.type == 'a') {
        A.laserCount += 10;
        powerups.remove(pu);
      } else if (pu.intersect(A) && pu.type == 't') {
        A.turretCount += 1;
        powerups.remove(pu);

      
        if (pu.reachedBottom()) {
          powerups.remove(pu);
        }
      }
    }
    //if (keyPressed && key == ' ') {
    //  lasers.add(new laser(A.x, A.y));
    // Render Lasers and Detect rock collisions
    for (int i = 0; i < lasers.size(); i++) {
      laser laser = lasers.get(i);
      for (int j = 0; j < rocks.size(); j++) {
        rock rock = rocks.get(j);
        if (laser.intersect(rock)) {
          rock.diam-=10;
          score += 10;
          lasers.remove(laser);
        }


        if (rock.diam <1) {
          rocks.remove(rock);
        }
      }
      laser.display();
      laser.move();
      if (laser.reachedTop()) {
        lasers.remove(laser);
      }
    }
    // rock distribution
    if (rTime.isFinished()) {
      rocks.add(new rock());
      rTime.start();
    }
    for (int i = 0; i < rocks.size(); i++) {
      rock rock = rocks.get(i);
      rock.display();
      rock.move();
      if (A. intersect(rock)) {
        // deduct 10 points
        score -= 10;
        // deduct 10 health
        A.health -= 10;
        // delete rock
        rocks.remove(rock);
      }
      if (rock.reachedBottom()) {
        rocks.remove(rock);
      }
    }

    A.display();
    A.move(mouseX, mouseY);
    infopanel();
    if (A.health<1) {
      gameOver();
      noLoop();
    }
  }
}
void keyPressed() {
  if (key == ' ' && A.fire()) {
    lasers.add(new laser(A.x, A.y));
    A.laserCount--;
  }
}
void infopanel() {
  rectMode(CENTER);
  fill(127, 127);
  rect(width/2, 20, width, 40);
  fill(155);
  textSize(35);
  text("Score:"+score, 20, 36);
  text("Health:" + A.health, 200, 36);
  text("Level:" + level, 360, 36);
  text("Ammo:"+ A.laserCount, 500, 36);
}

void startScreen() {
  background(0);
  fill(255);
  text("Welcome To Space!", width/2, 300);
  text("By Charles Later!", width/2, 320);
  text("Click anywhere to start!", width/2, 340);
  text("Powerups: red = mores ammo, green = + health, blue = double turrets", width/2, 370);
  if (mousePressed) {
    play=true;
  }
}

void gameOver() {
  background(0);
  fill(255);
  text("game over", width/2, 300);
}

void ticker() {
}

void mousePressed() {
  if (A.fire() && A.turretCount == 1) {
    lasers.add(new laser(A.x, A.y));
    A.laserCount--;
    lasers.add(new laser(A.x, A.y));
  } else if (A.fire() && A.turretCount == 2) {
    lasers.add(new laser(A.x-10, A.y));
    lasers.add(new laser(A.x+10, A.y));
    A.laserCount-=2;
  }
}
