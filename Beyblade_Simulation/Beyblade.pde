

class Beyblade{
  
  ArrayList<BeybladeComponent> components; 
  PVector center;
  PVector velocity;
  float radius;
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
    
    this.velocity = new PVector(0,0);
    this.radius = radius;
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
