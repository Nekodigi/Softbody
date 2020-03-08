class Spring{
  Vertex start, end;
  float baseL;
  PVector normal;
  
  Spring(Vertex start, Vertex end){
    this.start = start;
    this.end = end;
    this.baseL = PVector.dist(start.pos, end.pos);
  }
  
  float calcL(){
    return PVector.dist(start.pos, end.pos);
  }
}