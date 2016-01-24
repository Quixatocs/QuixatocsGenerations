//Mars Picture 8
float noiseVal;
float noiseScale=0.02;


float y1 = 505;
float y2 = 545;
float y3 = 590;

void setup(){
size(640,640);
smooth();
background(255, 80, 40);
noStroke();
stroke(200);
ellipse(270, 170, 15, 15);
stroke(200, 50);
strokeWeight(4);
noFill();
ellipse(270, 170, 70, 70);

  
   drawRidge(y1, 235, 180, 180);
   drawRidge(y2, 215, 180, 180);
   drawRidge(y3, 185, 140, 140);
   
   drawStorm();
  
  saveMe();
}

void drawRidge(float yStart, int red, int green, int blue) {
  for (int i=0; i < width; i++) {
    yStart += random(-1.5, +1.5);
    stroke(red, green, blue);
    line(i, yStart, i, height);
  }
}



void drawStorm() {
  for (int y = 0; y < height; y++) {
    for (int x = 0; x < width; x++) {
      stroke(noiseVal*225, noiseVal*130, 0, noiseVal*y/5);
      point(x,y);
      noiseDetail(8,0.55);
      noiseVal = noise(x * noiseScale, 
                       y * noiseScale);
    }
  }
}

void saveMe() {
  save("G8_01.png");
}