float noiseScale1=0.005;
float noiseScale2=0.005;


float y1 = 525;
float y2 = 545;
float y3 = 590;

void setup(){
size(640,640);
smooth();
background(255, 200, 200);
noStroke();
ellipse(480, 480, 15, 15);

  for (int i=0; i < width; i++) {
    y1 += random(-1.5, +1.5);
    stroke(255, 235, 235);
    line(i, y1, i, height);
  }
  
   for (int i=0; i < width; i++) {
    y2 += random(-1.5, +1.5);
    stroke(245, 225, 225);
    line(i, y2, i, height);
  }
  
  for (int i=0; i < width; i++) {
    y3 += random(-1.5, +1.5);
    stroke(225, 205, 205);
    line(i, y3, i, height);
  }


  /*for (int i = 0; i < 20000; i++) {
    float x2 = x1 + random(-10, 10);
    float y2 = y1 + random(-10, 10);
    
    
    stroke(255, 230, 230);
    
    if (x2 <= width+50 && x2 >= 0-50 && y2 <= height+50 && y2 >= 550){
      line(x1,y1,x2,y2);
      x1 = x2;
      y1 = y2;
    }
  }*/
  
  //save("diagonal.jpg");
}



