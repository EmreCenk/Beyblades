


/*
Naming conventions:

All classes are CamelCase
All objects of classes are snake_case

*/

Ball my_ball;
BeybladeComponent my_component;

void setup(){
  size(1000, 600);
  my_component = new BeybladeComponent(new PVector(width/2, height/2), 100, 10, 10, radians(2));
  background(0);
}

void draw(){
  background(0);
  my_component.update();

  my_component.display();
}
