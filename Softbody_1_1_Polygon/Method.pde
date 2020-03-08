PVector intersection(PVector s1, PVector e1, PVector s2, PVector e2) {
  float x1 = s1.x;
  float y1 = s1.y;
  float x2 = e1.x;
  float y2 = e1.y;
  float x3 = s2.x;
  float y3 = s2.y;
  float x4 = e2.x;
  float y4 = e2.y;
  float den = (x1 - x2) * (y3 - y4) - (y1 - y2) * (x3 - x4);
  if (den == 0) {
    return null;
  }
  
  float t = ((x1 - x3) * (y3 - y4) - (y1 - y3) * (x3 - x4)) / den;
  float u = -((x1 - x2) * (y1 - y3) - (y1 - y2) * (x1 - x3)) / den;
  if (t > 0 && t < 1 && u > 0) {
    PVector pt = new PVector();
    pt.x = x1 + t * (x2 - x1);
    pt.y = y1 + t * (y2 - y1);
    return pt;
  } else {
    return null;
  }
}

Barrier findNearestBarrier(PVector p){
  float bestD = Float.POSITIVE_INFINITY;
  Barrier bestB = null;
  for(Barrier barrier : barriers){
    float dist = lineDist(p, barrier.sp, barrier.ep);
    if(dist < bestD){
      bestD = dist;
      bestB = barrier;
    }
  }
  return bestB;
}

PVector refrect(PVector d, PVector normal){
  return PVector.sub(d, PVector.mult(normal, 2*PVector.dot(d, normal)));
}

float lineDist(PVector c, PVector a, PVector b) {
  PVector ap = PVector.sub(c, a);
  PVector ab = PVector.sub(b, a);
  float l = PVector.dist(a, b);
  ab.normalize(); // Normalize the line
  float scala = ap.dot(ab);
  if(scala <= 0){
    return PVector.dist(c, a);
  }else if(scala >= l){
    return PVector.dist(c, b);
  }
  else{
    ab.mult(scala);
    PVector normalPoint = PVector.add(a, ab);
    return PVector.dist(c, normalPoint);
  }
}