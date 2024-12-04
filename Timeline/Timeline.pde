// Charles later | Timeline Project | 8-28-2024 | Java Sintax

void setup() {
  size(900, 400);
  background(127);
}

void draw() {
  background(127);
  drawRef();
  histEvent(150, 200, "Z2", "1940 | Konrad Zuse | Germany", true);
  histEvent(210, 300, "ENIAC", "1945 | John Mauchly & J. Presper Eckret | U.S", false);
  histEvent(260, 200,"M.Baby","1948 | Frederic C. Williams, Tom Kilburn, & Geoff Tootill | England" , true);
  histEvent(320,300,"Ferrenti","1951 | Ferranti Ltd. | U.S" ,false);
  histEvent(320,300,"H.CADET","1955 | A.E.R.E | England" ,true);
}

void drawRef() {
  // timeline format
  strokeWeight(3);
  stroke(0);
  line(100, 250, 800, 250);
  textSize(18);
  text("1940", 90, 260);
  text("1960", 810, 260);

  // title text
  textSize(35);
  textAlign(CENTER, CENTER);
  fill(50);
  text("Historic Computer Systems", width/2, 60);
  textSize(25);
  text("by Charles Later", width/2, 85);
}

void histEvent(int x, int y, String title, String detail, boolean top) {
  if (top == true) {
    line(x, y, x+20, y+50);
  } else {
    line(x, y, x+20, y-50);
  }
  rectMode(CENTER);
  fill(220);
  rect(x, y, 100, 20);
  fill(0);
  text(title, x, y);
  if (mouseX>x-50 && mouseX<x+50 && mouseY>y-10 && mouseY<y+10) {
    text(detail, width/2, 350);
  }
}
