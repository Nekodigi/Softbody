//based on this site https://github.com/smacke/pressure-softbody

float r = 10;
float grav = 1100;//gravity
float resolution = 20;
float dt = 0.01;
Softbody softbody;
ArrayList<Obstacle> obstacles = new ArrayList<Obstacle>();
Circle mouseCol = new Circle(200);
ArrayList<Barrier> barriers = new ArrayList<Barrier>();

void setup(){
  fullScreen();
  //size(500, 500);
  softbody = new Softbody(r, resolution);
  obstacles.add(mouseCol);
  for(int i = 0; i < 10; i++){
    obstacles.add(new Polygon(random(width), random(height), random(width/5), (int)random(3, 6)));
  }
}

void draw(){
  background(255);
  mouseCol.pos.x = mouseX;
  mouseCol.pos.y = mouseY;
  fill(255, 0, 0);
  softbody.update();
  softbody.show();
  for(Obstacle obstacle : obstacles){
    obstacle.show();
  }
}