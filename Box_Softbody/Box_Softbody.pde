float g = 9.8;
float dt = 0.1;
ArrayList<Object> objs = new ArrayList<Object>();
PImage img;

void setup(){
  //size(1000, 500);
  fullScreen();
  img = loadImage("FevCat.png");
}

void draw(){
  background(255);
  for(int i = 250; i < width; i+= 300){
    if(frameCount == i/ 10){
      objs.add(new Object(250, 10, new PVector(i, 250)));
    }
  }
  fill(255, 0, 0);
  for(Object obj : objs){
    obj.update();
    obj.show();
  }
}