float theta;   

void setup() {
  size(640, 640);
  
}

void draw() {
  background(155);
  frameRate(30);
  stroke(255);
  // Let's pick an angle 0 to 90 degrees based on the mouse position
  float a = (mouseX / (float) width) * 720f;
  //float a = random(1) * 720f;
  // Convert it to radians
  theta = radians(a);
  // Start the tree from the bottom of the screen
  translate(width/2, height/2);
  //translate(random(width),random(height));
  // Draw a line 120 pixels
  //line(0,0,0,-160);
  
  // Move to the end of that line
  //translate(0,-160);
  // Start the recursive branching!
  branch(160);

}

void branch(float h) {
  // Each branch will be 2/3rds the size of the previous one
  h *= 0.80;
  
  // All recursive functions must have an exit condition!!!!
  // Here, ours is when the length of the branch is 2 pixels or less
  if (h > 2) {
  
    strokeWeight(3);
    stroke(0);
    line(0, 0, 0, -h);  // Draw the branch
    stroke(40,80,200);
    fill(0);
    ellipse(+5,-h, -5, 5);
    
    
    
    // Repeat the same thing, only branch off to the "left" this time!
    pushMatrix();
    rotate(-theta);
    stroke(0);
    line(0, 0, 0, -h);
    
    stroke(0);
    point(-5,0);
    stroke(200,80,40);
    fill(0);
    ellipse(-5,-h, -5, 5);
    translate(-30, -h);
    
    translate(+10, -h);
    branch(h);
    popMatrix();
  }
}



void saveMe() {
  save("AgeOfRoots_01.png");
}