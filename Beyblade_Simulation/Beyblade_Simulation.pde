


/*
Naming conventions:

All classes are CamelCase
All objects of classes are snake_case

*/

Ball my_ball;
BeybladeComponent my_component;
Beyblade b;
Beyblade bb;
void setup(){
  size(1000, 600);
  //my_component = new BeybladeComponent(new PVector(width/3, height/3), 11, 300.0, 10, radians(2));
  b = new Beyblade(3, // amount of components
                   new PVector(width/2, height/2), //center
                   100, // radius of beyblade
                   5, // ball num
                   5, // how thick the components are
                   radians(2) // how fast it spins
  );
  bb = new Beyblade(3, new PVector(width/3, height/3), 100, 12, 5, radians(1));
  bb.set_velocity(new PVector(1,1));
  background(0);
}

void draw(){
  background(0);
  //my_component.update();
  //my_component.display();

  bb.update();
  bb.display();
  
  //b.update();
  b.display();
  
  fill(255);
  circle(width/2, height/2, 5);
}
