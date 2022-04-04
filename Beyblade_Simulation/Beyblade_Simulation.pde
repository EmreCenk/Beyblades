


/*
Beyblade Simulation
By: Emre Cenk

If you don't know, beyblades are basically spinning discs that battle each other.
The winner will be the beyblade that spins the longest.

In the demo I included 3 beyblades, but since I used oop, you can battle infintely many beyblades with infinitely many designs, masses, colours, angular speeds ... and many more!


For the most recent version of this project: https://github.com/EmreCenk/Beyblades
*/


///////////////////////////////

/*
Naming conventions:

All classes are CamelCase
All objects are snake_case
All global constants are CAPITALIZED_LIKE_THIS
*/



ArrayList<Beyblade> beyblades; // will store all beyblades in this simulation
Prison my_prison;
Beyblade beyblade_1, beyblade_2, beyblade_3;

/*
Creating your own beyblade class:
b = new Beyblade(3, // amount of components
                 new PVector(width*0.7, height/2), //center
                 100, // radius of beyblade
                 12, // ball num
                 5, // how thick the components are
                 radians(10) // how fast it spins
);

//velocity and mass aren't passed into the constructor (they have default values):
b.set_velocity(new PVector(-10, -5)); // You must use this setter method to set velocity. DO NOT USE b.velocity = new PVector(1,1);
b.set_mass(3); // same rule goes for mass
  
*/
void setup(){
  size(1000, 600);
  beyblades = new ArrayList<Beyblade>();
  
  // our first beyblade:
  beyblade_1 = new Beyblade(32, new PVector(width*0.9, height * 0.8), 100, 12, 5, radians(15));
  beyblade_1.set_velocity(new PVector(-3, -3)); // when initializing the velocity for the first time, you must use this setter method to set velocity. I repeat: DO NOT USE b.velocity = new PVector(1,1); (this is more of a note to myself than anything lol)
  beyblade_1.set_mass(3); // setting the mass
  beyblade_1.set_colour(color(255, 100, 0)); // setting the colour
  beyblades.add(beyblade_1); // we need to add every beyblade to the beyblades arraylist to make sure they are rendered in the draw function

  // initializing the second beyblade:
  beyblade_2 = new Beyblade(13, new PVector(width*0.5, height*0.8), 100, 12, 5, radians(10));
  beyblade_2.set_velocity(new PVector(4, 1));
  beyblade_2.set_mass(10);
  beyblade_2.set_colour(color(100, 255, 100));
  beyblades.add(beyblade_2);

  //initializing the third beyblade
  beyblade_3 = new Beyblade(5, new PVector(width*0.1, height*0.8), 100, 12, 5, radians(12));
  beyblade_3.set_velocity(new PVector(0.5, -1));
  beyblades.add(beyblade_3);
  // for the third beyblade, a mass or or colour isn't specified so the default values are given to the beyblade
  
  //creating a prison around the screen that the beyblades can never escape:
  my_prison = new Prison(0, 0, width, height, 1, 1);

  frameRate(60);
}

void draw(){
  background(0);
  
  // looping through all pairs of beyblades:
  for (int i = 0; i < beyblades.size(); i++){
    for (int j = i + 1; j < beyblades.size(); j++){
        //checking for collisions on all pairs of beyblades:
        my_prison.calculate_collision(beyblades.get(i), beyblades.get(j));
    }
    my_prison.imprison(beyblades.get(i)); // make sure the beyblade doesn't escape the prison boundaries. The beyblades will live a long life of suffering within these 4 walls :)
  }
  
  for (int i = 0; i < beyblades.size(); i++){
    //after all calculations are done, move and draw the beyblades
    beyblades.get(i).move(); // moving the beyblade each frame
    beyblades.get(i).display(); // drawing beyblade onto screen
  }
  

}
