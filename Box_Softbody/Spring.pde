class Spring{
  float baselen, pow;
  
  Spring(float baselen, float pow){
    this.baselen = baselen;
    this.pow = pow;
  }
  
  float getF(float x){
    return (x - baselen)*pow;
  }
}