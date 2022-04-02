

class Beyblade{
  // a beyblade can do everything a beyblade component can do, and more!
  
  ArrayList<BeybladeComponent> components; 
  PVector center;
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
  }
  void display(){
    for (int i = 0; i<this.components.size(); i++){
      this.components.get(i).display();
    }
  }
  
  void update(){
    for (int i = 0; i<this.components.size(); i++){
      this.components.get(i).update();
    }
  }}
