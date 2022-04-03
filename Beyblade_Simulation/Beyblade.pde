

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
    this.mass = 1.1; // default mass
  }
  
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
  
  void set_center(PVector new_center){
    
  
    // storing actual velocity value:
    PVector real_velocity = new PVector(this.velocity.x, this.velocity.y);
    
    //temporarily changing the velocity to shift the entire beyblade to be around the new center:
    this.set_velocity(new PVector(new_center.x - this.center.x, new_center.y - this.center.y));
    this.update();
    this.set_velocity(real_velocity);
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
  
  void update(){
    this.center.add(this.velocity);
    for (int i = 0; i<this.components.size(); i++){
      this.components.get(i).update();
    }
  }}
