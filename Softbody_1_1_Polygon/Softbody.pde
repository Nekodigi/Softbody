class Softbody{
  ArrayList<Vertex> vertices = new ArrayList<Vertex>();
  ArrayList<Spring> springs = new ArrayList<Spring>();
  float resolution;
  float ks = 3000;//spring power
  float kd = 35;//spring dump?
  float r;
  float pressure = 7000000;
  float volume;
  
  Softbody(float r, float resolution){
    this.r = r;
    this.resolution = resolution;
    for(float i = 0; i < resolution; i++){
      float theta = map(i, 0, resolution, 0, TWO_PI);
      vertices.add(new Vertex(PVector.fromAngle(theta).setMag(r).add(new PVector(width/2, height/2))));
    }
    for(int i = 0; i < resolution; i++){
      springs.add(new Spring(vertices.get(i), vertices.get((i+1)%int(resolution))));
    }
  }
  
  void update(){
    for(int i = 0; i < resolution; i++){
      Spring spring = springs.get(i);
      float l = spring.calcL();
      if(l != 0){
        PVector vSub = PVector.sub(spring.start.vel, spring.end.vel);
        PVector pSub = PVector.sub(spring.start.pos, spring.end.pos);
        float f = (l - spring.baseL) * ks + PVector.dot(vSub, pSub) * kd / l;
        pSub.normalize();//spring direction
        spring.start.acc.sub(PVector.mult(pSub, f));
        spring.end.acc.add(PVector.mult(pSub, f));
        spring.normal = pSub.rotate(HALF_PI);
      }
    }
    
    volume = 0;
    for(int i = 0; i < resolution; i++){
      Spring spring = springs.get(i);
      float l = spring.calcL();
      float midX = (spring.start.pos.x - spring.end.pos.x)/2;
      
      volume += abs(midX) * abs(spring.normal.x) * l;
    }
    
    for(int i = 0; i < resolution; i++){
      Spring spring = springs.get(i);
      float l = spring.calcL();
      
      float pressureRev = l * pressure /volume;
      spring.start.acc.add(PVector.mult(spring.normal, pressureRev));
      spring.end.acc.add(PVector.mult(spring.normal, pressureRev));
    }
    
    for(Vertex v : vertices){
      v.update();
    }
  }
  
  void show(){
    beginShape();
    for(Vertex v : vertices){
      vertex(v.pos.x, v.pos.y);
    }
    endShape();
  }
}