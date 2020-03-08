abstract class Obstacle{
  abstract void collide(Vertex v);
  abstract void show();
}

class Circle extends Obstacle{
  PVector pos;
  float r;
  
  Circle(float r){
    pos = new PVector();
    this.r = r;
  }
  
  void collide(Vertex v){
    if(PVector.dist(v.pos, pos) < r/2){
      float angle = atan2(v.pos.y-pos.y, v.pos.x-pos.x);
      v.pos = PVector.add(pos, PVector.fromAngle(angle).setMag(r/2));
      PVector normal = PVector.fromAngle(angle);
      v.vel = refrect(v.vel, normal);
      v.pos.add(PVector.mult(v.vel, dt));
    }
  }
  
  void show(){
    ellipse(pos.x, pos.y, r, r);
  }
}

class Polygon extends Obstacle{
  ArrayList<PVector> vertices = new ArrayList<PVector>();
  
  Polygon(float x, float y, float mr, int n){
    float Btheta = random(TWO_PI);
    for(int i = 0; i < n; i++){
      float theta = map(i, 0, n, 0, TWO_PI)+Btheta;
      float r = random(mr);
      vertices.add(new PVector(x+cos(theta)*r, y+sin(theta)*r));
    }
    calcBarrier();
  }
  
  void collide(Vertex v){
    Ray ray = new Ray(v.pos.x, v.pos.y, 0);
    ray.update();
    if(ray.inside){
      Barrier nearest = findNearestBarrier(v.pos);
      PVector normal = PVector.sub(nearest.sp, nearest.ep).normalize().rotate(HALF_PI);
      v.vel = refrect(v.vel, normal);
      v.pos.add(PVector.mult(v.vel, dt));
    }
  }
  
  Polygon(ArrayList<PVector> vertices){
    this.vertices = vertices;
    calcBarrier();
  }
  
  void calcBarrier(){
    for(int i = 0; i < vertices.size(); i++){
      barriers.add(new Barrier(vertices.get(i), vertices.get((i+1)%vertices.size())));
    } 
  }
  
  void show(){
    beginShape();
    for(PVector vertice : vertices){
      vertex(vertice.x, vertice.y);
    }
    endShape();
  }
}