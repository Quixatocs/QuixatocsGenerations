//Mars Picture 3

int y2 = 0;
float[] summitPoints2;

void setup(){
size(640,640);
smooth();
background(0);
noStroke();
  
  summitPoints2 = new float[width*8];
  drawRidgeWave(-5, 60, 14, 10);
  
  saveMe();
}

void drawRidgeWave(int randomLow, int randomHigh, int weightMax, int maxFade) {
 
 for (int i = 0 - width*4; i < width*4 - 1 ; i++) {
   //set up ridgepoint values
    float ridgePoint_x = i;
    float ridgePoint_y = 0;    
    float nextRidgePoint_x = ridgePoint_x;
    float nextRidgePoint_y = ridgePoint_y;
    
    // brownian ridge colouring
    float ridgeBlueColor = maxFade + random(80); 
    ridgeBlueColor += random(-10,+10);
    stroke(maxFade, maxFade, ridgeBlueColor);
    strokeWeight(random(1, weightMax));
    
    if (i % 12 == 0) {
      stroke(15 + random(55), 200);
      strokeWeight(4);
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
  save("G3_01.png");
}