float theta;   

void setup() {
  size(640, 640);
  
  
  
}

void draw() {
  background(0);
  frameRate(30);
  stroke(155);
  strokeWeight(3);
  line(320, 0, 320, 640);
  line(0, 320, 640, 320);
  line(0, 0, 640, 640);
  line(640, 0, 0, 640);
  stroke(255);
  // Let's pick an angle 0 to 90 degrees based on the mouse position
  float a = (mouseX / (float) width) * 720f;
  //float a = random(1) * 720f;
  // Convert it to radians
  theta = radians(a);
  // Start the tree from the bottom of the screen
  translate(0, 270);
  //translate(random(width),random(height));
  // Draw a line 120 pixels
  //line(0,0,0,-160);
  
  // Move to the end of that line
  //translate(0,-160);
  // Start the recursive branching!
  branch(160);
  translate(0,-270);
  
}

void branch(float h) {
  // Each branch will be 2/3rds the size of the previous one
  h *= 0.80;
  
  // All recursive functions must have an exit condition!!!!
  // Here, ours is when the length of the branch is 2 pixels or less
  if (h > 2) {
  
    strokeWeight(3);
    stroke(0);
    
    stroke(40,80,200);
    fill(0);
    ellipse(+5,-h, -5, 5);
    ellipse(+15,-h, -5, 5);
    
    
    
    // Repeat the same thing, only branch off to the "left" this time!
    pushMatrix();
    rotate(-theta);
    stroke(0);
    
    stroke(0);
    
    stroke(200,80,40);
    fill(0);
    ellipse(-5,-h, -5, 5);
    ellipse(-15,-h, -5, 5);
    translate(-30, -h);
    
    translate(+10, -h);
    branch(h);
    popMatrix();
  }
}

void mouseClicked() {
  saveMe();
}



void saveMe() {
  save("QuixthrinWheel_05.png");
}