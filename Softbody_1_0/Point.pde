class Vertex{
  PVector pos;
  PVector vel = new PVector();
  PVector acc = new PVector();
  
  Vertex(PVector pos){
    this.pos = pos;
  }
  
  void update(){
    acc.add(new PVector(0, grav));
    vel.add(PVector.mult(acc, dt));
    pos.add(PVector.mult(vel, dt));
    if(pos.x < 0 || pos.x > width){
      vel.x = -vel.x/2;
    }
    if(pos.y < 0 || pos.y > height){
      vel.y = -vel.y/2;
    }
    PVector mouse = new PVector(mouseX, mouseY);
    if(PVector.dist(pos, mouse) < mouseR/2){
      float angle = atan2(pos.y-mouseY, pos.x-mouseX);println(angle);
      pos = mouse.add(PVector.fromAngle(angle).setMag(mouseR/2));
      vel.mult(-0.5);
    }
    pos = new PVector(constrain(pos.x, 0, width), constrain(pos.y, 0, height));
    acc = new PVector();
  }
}