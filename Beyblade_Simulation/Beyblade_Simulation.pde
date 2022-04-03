


/*
Naming conventions:

All classes are CamelCase
All objects of classes are snake_case

*/

int n = 2; // number of beyblades you want to fight at the same time
float[] angular_speeds = {1, 2}; // the angular speeds of each beyblade (angular_speed[i] would be the angular speed for the i'th beyblade)


ArrayList<PVector> initial_velocities = new ArrayList<PVector>();
//initial_velocities.add(new PVector(0, 0));
//initial_velocities.add(new PVector(2, 3));

Beyblade[] beyblades;
Prison my_prison;
Beyblade b, bb;

void setup(){
  size(1000, 600);
  b = new Beyblade(3, // amount of components
                   new PVector(width*0.7, height/2), //center
                   100, // radius of beyblade
                   5, // ball num
                   5, // how thick the components are
                   radians(2) // how fast it spins
  );
  
  b.set_velocity(new PVector(-3, 0)); // sets velocity for beyblade. the default velocity is 0 for all beyblades
  b.mass = 3;
  
  bb = new Beyblade(3, new PVector(width*0.2, height/2), 100, 12, 5, radians(1));
  bb.set_velocity(new PVector(100, 0));
  
  
  //creating a prison around the screen that the beyblades can never escape:
  my_prison = new Prison(0, 0, width, height, 1, 1);

  background(0);
  frameRate(30);
}

void draw(){
  background(0);


  //my_prison.calculate_collision(b, bb);

  my_prison.imprison(bb);
  bb.update();

  my_prison.imprison(b);
  //b.update();
  
  

  //b.display();
  bb.display();  
  
  
  stroke(color(0, 255, 0));
  circle(bb.center.x, bb.center.y, 10);
  fill(255);
}

void keyPressed(){  
  frameRate(1);
}
