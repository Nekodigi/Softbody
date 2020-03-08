class Barrier{
  PVector sp, ep;
  
  Barrier(float sx, float sy, float ex, float ey){
    this(new PVector(sx, sy), new PVector(ex, ey));
  }
  
  Barrier(PVector sp, PVector ep){
    this.sp = sp;
    this.ep = ep;
  }
  
  void show(){
     line(sp, ep);
  }
}