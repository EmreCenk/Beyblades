


/*
Naming conventions:

All classes are CamelCase
All objects of classes are snake_case

*/

Ball my_ball;
BeybladeComponent my_component;
Beyblade b, bb;
Prison my_prison;

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
  
  b.set_velocity(new PVector(-3, 0));

  my_prison = new Prison(0, 0, width, height, 0.8, 0.4);
  
  bb = new Beyblade(3, new PVector(width/3, height/3), 100, 12, 5, radians(1));

  
  bb.set_velocity(new PVector(3, 0));
  background(0);
}

void draw(){
  background(0);
  //my_component.update();
  //my_component.display();


  my_prison.calculate_collision(b, bb);

  bb.update();
  my_prison.imprison(bb);

  
  b.update();
  my_prison.imprison(b)
  
  
  ;
  b.display();
  bb.display();  
  
  fill(255);
  circle(width/2, height/2, 5);
}

void keyPressed(){
  loop();
}
