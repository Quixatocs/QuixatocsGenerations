color q;
color t;
color u;
color r;

int a;
int b;
int c;
int d;

void setup() {
size(1201, 601);
noLoop();
}
  void draw() {
loadPixels();
  
   q = color(random(255),random(255),random(255));
   t = color(random(255),random(255),random(255));
   u = color(random(255),random(255),random(255));
   r = color(random(255),random(255),random(255));
  
   a = int(random(18));
   b = int(random(22));
   c = int(random(120));
   
  loadPixels(); 
  for (int x = 0; x < width; x++) {
  for (int y = 0; y < height; y++) {
  int loc = x + y * width;
    
            if (x % 120 == 0) { 
      pixels[loc] = color(u);
     } else if (x % 120-10-(-a) == 0) { 
      pixels[loc] = color(q);
     } else if (x % 120-105-(a) == 0) { 
      pixels[loc] = color(q);
     } else if (x % 120-15-(-a) == 0) { 
      pixels[loc] = color(q);
     } else if (x % 120-110-(a) == 0) { 
      pixels[loc] = color(q);
     } else if (x % 120-90-(b) == 0) { 
      pixels[loc] = color(t);
     } else if (x % 120-30-(-b) == 0) { 
      pixels[loc] = color(t);
    
    
    } else if (y % 120-90-(b) == 0) { 
      pixels[loc] = color(t);
    } else if (y % 120-30-(-b) == 0) { 
      pixels[loc] = color(t);
    } else if (y % 120-110-(a) == 0) { 
      pixels[loc] = color(q);
    } else if (y % 120-105-(a) == 0) { 
      pixels[loc] = color(q);
    } else if (y % 120-15-(-a) == 0) { 
      pixels[loc] = color(q);
    } else if (y % 120-10-(-a) == 0) { 
      pixels[loc] = color(q);
    }  else if (y % 120 == 0) { 
      pixels[loc] = color(u);
      
    } else {          
      pixels[loc] = color(r);
    }
  }
}
updatePixels();

}

void mousePressed() 
{
  redraw();
}

