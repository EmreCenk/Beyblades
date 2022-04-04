

// constants:
float DEFAULT_MASS = 1.1;
float MASS_TO_LINE_WEIGHT_COEFFICIENT = 0.5; // conversion ratio between mass and stroke weight

class Beyblade{
  
  ArrayList<BeybladeComponent> components; 
  PVector center;
  PVector velocity;
  float radius;
  float angular_speed;
  color colour;
  float mass;
  Beyblade(int component_num, PVector center_, float radius, int ball_num, float thickness, float angular_speed_){    
    
    float rotate_component_by = radians(360/component_num); // angle between each component
    this.components = new ArrayList<BeybladeComponent>();
    this.center = center_;
    for (int i = 0; i < component_num; i++){
      components.add(new BeybladeComponent(this.center, ball_num, radius*2, thickness, angular_speed_));
    }
    
    for (int i = 0; i < component_num; i++){
      components.get(i).rotate_component(rotate_component_by * i);
    }
    
    this.radius = radius;
    this.angular_speed = angular_speed_;
    this.set_velocity(new PVector(0,0));
    this.set_colour(color(255, 255, 255));
    this.mass = DEFAULT_MASS; // default mass
  }
  
  // NOTE: the following are a bunch of setter methods. At this point, after initializing them the first time, you wouldn't need to call them again
  // you could simply say Beyblade.x = 10 etc.
  // HOWEVER, in the name of future-proofing the code, I will be using these setter methods everywhere
  // For instance, using these methods will make it easier to implement  different components having different angular speeds (this is just one of many potential use cases)
  
  void set_angular_speed(float new_speed){
    this.angular_speed = new_speed;
    for (int i = 0; i<this.components.size(); i++){
      this.components.get(i).set_angular_speed(this.angular_speed);
    }
  }
  
  void set_colour(color new_color){
    this.colour = new_color;
    for (int i = 0; i<this.components.size(); i++){
      this.components.get(i).set_color(new_color);
    }
  }
  
  void set_mass(float new_mass){
    this.mass = new_mass;
    for (int i = 0; i<this.components.size(); i++){
      this.components.get(i).line_weight = new_mass * MASS_TO_LINE_WEIGHT_COEFFICIENT;
    }
  }
  void set_center(PVector new_center){
    
    // first we need to shift the entire beyblade to where the new center will be
    // storing actual velocity value:
    PVector real_velocity = new PVector(this.velocity.x, this.velocity.y); // the desired displacement becomes the new temporary velocity
    
    //temporarily changing the velocity to shift the entire beyblade to be around the new center:
    this.set_velocity(new PVector(new_center.x - this.center.x, new_center.y - this.center.y));
    this.move();
    
    // restoring the actual velocity value after we shift the beyblade component to where we want:
    this.set_velocity(real_velocity);
    
    //setting center
    this.center = new_center;
    for (int i = 0; i<this.components.size(); i++){
      this.components.get(i).set_center(this.center);
    }
  }
  void set_velocity(PVector new_velocity){
    this.velocity = new_velocity;
    for (int i = 0; i<this.components.size(); i++){
      this.components.get(i).set_velocity(this.velocity);
    }
  }
  
  void display(){
    for (int i = 0; i<this.components.size(); i++){
      this.components.get(i).display();
    }
  }
  
  void move(){
    // this function is used to move the beyblade each frame
    this.center.add(this.velocity);
    for (int i = 0; i<this.components.size(); i++){
      this.components.get(i).move();
    }
  }}
