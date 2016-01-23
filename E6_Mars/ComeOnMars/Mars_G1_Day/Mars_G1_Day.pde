//Mars Picture 4

int y1 = 80;
float[] summitPoints1;
float[] summitPoints2;

void setup(){
size(640,640);
smooth();
background(225, 205, 205);
noStroke();
  
  summitPoints1 = new float[width];
  summitPoints2 = new float[width];
  
  createSummitPoints1Array();
  //drawBackgroundRidge();
  drawRidgeWave(-35, 25, 0, width, 4);
  
   //<>//
  
  //saveMe();
}


void createSummitPoints1Array() {
  //Define the summit points in an array
  for (int i = 0; i < width; i++) {
    if (i % 5 == 0) {
      y1 += random(-5.5, +5.5);
    }
    summitPoints1[i] = y1; 
  }
}

void createSummitPoints2Array() {
  //Define the summit points in an array
  for (int i = 0; i < width; i++) {
    if (i % 5 == 0) {
      y1 += random(-5.5, +5.5);
    }
    summitPoints2[i] = y1; 
  }
}

void drawBackgroundRidge() {
  //loop over the summit points to create the background
  stroke(255, 160, 160);
  for (int i = 0; i < summitPoints1.length; i++) {
    line(i, summitPoints1[i], i, height);
  }
}

void drawRidgeWave(int randomLow, int randomHigh, int widthStart, int widthFinish, int weightMax) {
 

  
 for (int i = widthStart; i < widthFinish - 1 ; i++) {
   //set up ridgepoint values
    float ridgePoint_x = i;
    float ridgePoint_y = summitPoints1[i];
    float nextRidgePoint_x = ridgePoint_x;
    float nextRidgePoint_y = ridgePoint_y;
    
    // brownian ridge colouring
    float ridgeRedColor = 100 + random(155); 
    ridgeRedColor += random(-30,+30);
    stroke(ridgeRedColor, 100, 100);
    strokeWeight(random(1, weightMax));
    
    //random line from top of point wiggling downwards
    while (ridgePoint_y < height) { 
     nextRidgePoint_x += random(randomLow, randomHigh);
     nextRidgePoint_y += random(+20);
     //draw the line
     line(ridgePoint_x, ridgePoint_y, nextRidgePoint_x, nextRidgePoint_y);
     ridgePoint_x = nextRidgePoint_x;
     ridgePoint_y = nextRidgePoint_y;
   }
 }
}

void saveMe() {
  save("G4_01.png");
}