//Mars Picture 1 //<>//

int y2 = 0;

void setup(){
size(4370,2917);
smooth();
background(225, 205, 205);
noStroke();
  
  drawRidgeWave(-45*7, 25*7, 14*7, 55);
  
  saveMe();
}

void drawRidgeWave(int randomLow, int randomHigh, int weightMax, int maxFade) {
 
 for (int i = 0; i < width*3 - 1 ; i++) {
   //set up ridgepoint values
    float ridgePoint_x = i;
    float ridgePoint_y = 0;    
    float nextRidgePoint_x = ridgePoint_x;
    float nextRidgePoint_y = ridgePoint_y;
    
    // brownian ridge colouring
    float ridgeRedColor = maxFade + random(100); 
    ridgeRedColor += random(-30,+30);
    stroke(ridgeRedColor, maxFade, maxFade);
    strokeWeight(random(1, weightMax));
    
    //random line from top of point wiggling downwards
    while (ridgePoint_y < height) { 
     nextRidgePoint_x += random(randomLow, randomHigh);
     nextRidgePoint_y += random(+20*7);
     //draw the line
     line(ridgePoint_x, ridgePoint_y, nextRidgePoint_x, nextRidgePoint_y);
     ridgePoint_x = nextRidgePoint_x;
     ridgePoint_y = nextRidgePoint_y;
   }
 }
}

void saveMe() {
  save("G1_VTA3_01.png");
}