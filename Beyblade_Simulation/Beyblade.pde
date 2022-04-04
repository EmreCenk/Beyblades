

// constants:
float DEFAULT_MASS = 1.1;
float MASS_TO_LINE_WEIGHT_COEFFICIENT = 0.5; // conversion ratio between mass and stroke weight

class Beyblade{
  
  ArrayList<BeybladeComponent> components; // all beyblades are made up of BeybladeComponents
  PVector center; // center of beyblade
  PVector velocity;
  float radius;
  float angular_speed;
  color colour;
  float mass;
  
  Beyblade(int component_num, PVector center_, float radius, int ball_num, float thickness, float angular_speed_){    
    
    float rotate_component_by = radians(360/component_num); // angle between each component
    this.components = new ArrayList<BeybladeComponent>();
    this.center = center_;
    
    // initializing the components
    for (int i = 0; i < component_num; i++){
      components.add(new BeybladeComponent(this.center, ball_num, radius*2, thickness, angular_speed_));
    }
    
    // rotating the components so they are evenly spaced out:
    for (int i = 0; i < component_num; i++){
      components.get(i).rotate_component(rotate_component_by * i);
    }
    
    // setting other fields:
    this.radius = radius;
    this.angular_speed = angular_speed_;
    this.set_velocity(new PVector(0,0));
    this.set_colour(color(255, 255, 255));
    this.mass = DEFAULT_MASS; // default mass
  }
  
  // NOTE: the following are a bunch of setter methods. It is possible to have all the classes have pointers in their fields instead of having local copies.
  // That way, you could simply say Beyblade.x = 10 etc.
  // HOWEVER, in the name of future-proofing the code, I will be using these setter methods everywhere
  // In general, having these methods will make it easier to implement many ideas
  // For instance, using these methods will make it easier to implement  different components having different angular speeds (this is just one of many potential use cases)
  
  void set_angular_speed(float new_speed){
    this.angular_speed = new_speed; // sets the angular speed for the beyblade
    
    // making sure components of the beyblade are aware of the change:
    for (int i = 0; i<this.components.size(); i++)
      this.components.get(i).set_angular_speed(this.angular_speed);
    
  }
  
  void set_colour(color new_color){
    this.colour = new_color; // sets the colour for the beyblade
    
    // making sure components of the beyblade are aware of the change:
    for (int i = 0; i<this.components.size(); i++)
      this.components.get(i).set_color(new_color);
    
  }
  
  void set_mass(float new_mass){
    this.mass = new_mass; // sets the mass for the beyblade
    
    // making sure components of the beyblade are aware of the change:
    for (int i = 0; i<this.components.size(); i++)
      this.components.get(i).line_weight = new_mass * MASS_TO_LINE_WEIGHT_COEFFICIENT; // the heavier a beyblade is, the thicker the lines are drawn
    
  }
  
  void set_center(PVector new_center){
    
    // Here, not only do we need to shift the center, but we also have to shift every single component the same distance
    // to do so, we will temporarily change the velocity to the desired displacement, then move the components by velocity
    
    // storing actual velocity value:
    PVector real_velocity = new PVector(this.velocity.x, this.velocity.y); // the desired displacement becomes the new temporary velocity
    
    //temporarily changing the velocity to the desired displacement (relative to the center):
    this.set_velocity(new PVector(new_center.x - this.center.x, new_center.y - this.center.y));
    this.move(); // moving the whole beyblade so that it is around the new center
    
    // restoring the actual velocity value
    this.set_velocity(real_velocity);
    
   // now we can do the regular drill:
    this.center = new_center;
    for (int i = 0; i<this.components.size(); i++)
      this.components.get(i).set_center(this.center);
    
  }
  
  void set_velocity(PVector new_velocity){
    this.velocity = new_velocity;
    for (int i = 0; i<this.components.size(); i++)
      this.components.get(i).set_velocity(this.velocity);
    
  }
  
  void display(){
    for (int i = 0; i<this.components.size(); i++)
      this.components.get(i).display();
    
  }
  
  void move(){
    // this function is used to move the beyblade each frame
    this.center.add(this.velocity);
    for (int i = 0; i<this.components.size(); i++){
      this.components.get(i).move();
    }
  }
}
