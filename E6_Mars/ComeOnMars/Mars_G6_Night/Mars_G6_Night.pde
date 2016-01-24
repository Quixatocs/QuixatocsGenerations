//Mars Picture 6

int y1 = 300;
int y2 = 550;
float[] summitPoints1;
float[] summitPoints2;

void setup(){
size(640,640);
smooth();
background(15, 15, 23);
noStroke();
  
  summitPoints1 = new float[width*8];
  summitPoints2 = new float[width*8];
  
  createSummitPoints1Array();
  //drawBackgroundRidge();
  drawRidgeWave(1, -45, 25, 2, 20);
  drawRidgeWave(2, -5, 60, 14, 10);

  
  saveMe();
}


void createSummitPoints1Array() {
  //Define the summit points in an array
  for (int i = 0; i < width*8; i++) {
    if (i % 5 == 0) {
      y1 += random(-5.5, +5.5);
    }
    if (i % 12 == 0) {
      y2 += random(-12.5, +12.5);
    }
    summitPoints1[i] = y1;
    summitPoints2[i] = y2; 
  }
}

void drawBackgroundRidge() {
  //loop over the summit points to create the background
  stroke(255, 160, 160);
  for (int i = 0; i < summitPoints1.length; i++) {
    line(i, summitPoints1[i], i, height);
  }
}

void drawForegroundRidge() {
  //loop over the summit points to create the background
  stroke(200, 100, 100);
  for (int i = 0; i < summitPoints2.length; i++) {
    line(i, summitPoints2[i], i, height);
  }
}

void drawRidgeWave(int arrayNum, int randomLow, int randomHigh, int weightMax, int maxFade) {
 
 for (int i = 0 ; i < width*8 ; i++) {
   //set up ridgepoint values
    float ridgePoint_x = i - width*4;
    float ridgePoint_y = 0; 
    switch(arrayNum) {
      case 1: 
        ridgePoint_y = summitPoints1[i];
      break;
      case 2: 
        ridgePoint_y = summitPoints2[i];
      break;
    }
    
    float nextRidgePoint_x = ridgePoint_x;
    float nextRidgePoint_y = ridgePoint_y;
    
    // brownian ridge colouring
    float ridgeBlueColor = maxFade + random(80); 
    ridgeBlueColor += random(-10,+10);
    stroke(maxFade, maxFade, ridgeBlueColor);
    strokeWeight(random(weightMax));
    
    if (i % 12 == 0) {
      stroke(15 + random(55), 200);
      strokeWeight(random(weightMax/4));
    }
    
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
  save("G6_01.png");
}