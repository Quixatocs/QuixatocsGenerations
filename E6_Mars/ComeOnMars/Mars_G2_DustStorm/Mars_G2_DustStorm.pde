//Mars Picture 2

int y2 = 0;
float[] summitPoints2;

void setup(){
size(640,640);
smooth();
background(225, 205, 205);
noStroke();
  
  summitPoints2 = new float[width*4];
  drawRidgeWave(-25, 55, 14, 45);
  
  saveMe();
}

void drawRidgeWave(int randomLow, int randomHigh, int weightMax, int maxFade) {
 
 for (int i = 0 - width*2; i < width*2 - 1 ; i++) {
   //set up ridgepoint values
    float ridgePoint_x = i;
    float ridgePoint_y = 0;    
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

void saveMe() {
  save("G2_01.png");
}