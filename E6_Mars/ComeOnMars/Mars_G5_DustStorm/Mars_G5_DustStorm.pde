//Mars Picture 5

float noiseVal;
float noiseScale=0.02;

int y1 = 150;
int y2 = 550;
float[] summitPoints1;
float[] summitPoints2;

void setup(){
size(640,640);
smooth();
background(185, 140, 140);
noStroke();
  
  summitPoints1 = new float[width*2];
  summitPoints2 = new float[width*2];
  
  createSummitPoints1Array();
  drawBackgroundRidge();
  drawRidgeWave(1, -35, 15, 2, 105);
  drawStorm();
  drawRidgeWave(2, -25, 55, 12, 45);

  
  saveMe();
}


void createSummitPoints1Array() {
  //Define the summit points in an array
  for (int i = 0; i < width*2; i++) {
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
 
 for (int i = 0; i < width*2 - 1 ; i++) {
   //set up ridgepoint values
    float ridgePoint_x = i - width/2;
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
    float ridgeRedColor = maxFade + random(100); 
    ridgeRedColor += random(-20,+20);
    stroke(ridgeRedColor/3*2, maxFade, maxFade/2);
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

void drawStorm() {
  for (int y = 0; y < height; y++) {
    for (int x = 0; x < width; x++) {
      stroke(noiseVal*225, noiseVal*130, 0, 100 + y/2);
      point(x,y);
      noiseDetail(8,0.55);
      noiseVal = noise(x * noiseScale, 
                       y * noiseScale);
    }
  }
}

void saveMe() {
  save("G5_01.png");
}