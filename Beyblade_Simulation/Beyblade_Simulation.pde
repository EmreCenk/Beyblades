


/*
Naming conventions:

All classes are CamelCase
All objects of classes are snake_case

*/

Ball my_ball;
BeybladeComponent my_component;
Beyblade b;
void setup(){
  size(1000, 600);
  //my_component = new BeybladeComponent(new PVector(width/2, height/2), 300, 10.0, 10, radians(2));
  b = new Beyblade(3, new PVector(width/2, height/2), 100, 10, 5, radians(2));
  background(0);
}

void draw(){
  background(0);
  b.update();
  b.display();

}
