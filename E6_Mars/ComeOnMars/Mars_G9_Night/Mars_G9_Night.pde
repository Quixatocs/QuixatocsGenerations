//Mars Picture 9
float y1 = 505;
float y2 = 545;
float y3 = 590;

void setup(){
size(640,640);
smooth();
background(0);
noStroke();
stroke(200);
  
  drawStars(1000);
  drawRidge(y1, 50, 50, 83);
  drawRidge(y2, 30, 30, 53);
  drawRidge(y3, 15, 15, 23);
  
  saveMe();
}

void drawRidge(float yStart, int red, int green, int blue) {
  for (int i=0; i < width; i++) {
    yStart += random(-1.5, +1.5);
    stroke(red, green, blue);
    line(i, yStart, i, height);
  }
}

void drawStars(int numberOfStars) {
  stroke(255);
  for (int i = 0; i < numberOfStars; i++) {
    point(random(width), random(height));
  }
}

void saveMe() {
  save("G9_01.png");
}