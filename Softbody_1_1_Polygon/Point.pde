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
    for(Obstacle o : obstacles){
      o.collide(this);
    }
    pos = new PVector(constrain(pos.x, 0, width), constrain(pos.y, 0, height));
    acc = new PVector();
  }
}