//based on this site https://github.com/smacke/pressure-softbody

float r = 10;
float grav = 1100;//gravity
float resolution = 30;
float dt = 0.01;
float mouseR = 200;
Softbody softbody;

void setup(){
  fullScreen();
  //size(500, 500);
  softbody = new Softbody(r, resolution);
}

void draw(){
  background(255);
  fill(255, 0, 0);
  softbody.update();
  softbody.show();
  ellipse(mouseX, mouseY, mouseR, mouseR);
}