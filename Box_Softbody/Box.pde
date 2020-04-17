class Object{
  PVector pos = new PVector();
  PVector vel = new PVector();
  float size;
  float ly;
  Spring spring;
  
  Object(float size, float pow, PVector pos){
    this.size = size;
    this.pos = pos;
    spring = new Spring(size, pow);
  }
  
  void update(){
    ly = min(height-pos.y+size/2, size);
    float f = spring.getF(ly);
    vel.y += (g+f) * dt;
    pos.add(PVector.mult(vel, dt));
  }
  
  void show(){
    float sx = size*size/ly;
    float sy = ly;
    //ellipse(pos.x, pos.y, sx, sy);
    image(img, pos.x-sx/2, pos.y-size/2, sx, sy);
  }
}