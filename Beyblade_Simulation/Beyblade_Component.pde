

class BeybladeComponent{
  
  // every beyblade is made up of multiple components. This class represents those components
  PVector center;
  float angular_speed; // how many degrees it should rotate by each frame
  ArrayList<Ball> balls; // every component is made up of a bunch of balls
  float line_weight;
  PVector velocity;
  
  BeybladeComponent(PVector center_, // center of beyblade
                    int ball_num, // how many balls the component should have. 
                    float length_, // how long the component should be 
                    float ball_radius,
                    float angular_speed_
                    )
    {
    this.center = center_;
    this.angular_speed = angular_speed_;
    this.balls = new ArrayList<Ball>();
    for (float x = this.center.x - length_/2.0; x<length_/2.0 + this.center.x; x+=length_/ball_num)
      this.balls.add(new Ball(x, this.center.y, this.center, ball_radius, this.angular_speed));  
    
     this.line_weight = ball_radius / 2; //default value
  }
  
  void display(){
    for (int i = 0; i<this.balls.size(); i++){
      this.balls.get(i).display();
    }
    strokeWeight(this.line_weight);
    line(this.balls.get(0).coordinate.x, this.balls.get(0).coordinate.y, this.balls.get(this.balls.size() - 1).coordinate.x, this.balls.get(this.balls.size() - 1).coordinate.y);

  }
  
  void set_velocity(PVector new_velocity){
    this.velocity = new_velocity;
    for (int i = 0; i<this.balls.size(); i++){
      this.balls.get(i).velocity = this.velocity;
    }
  }
  
  void set_angular_speed(float new_speed){
    this.angular_speed = new_speed;
    for (int i = 0; i<this.balls.size(); i++){
      this.balls.get(i).angular_speed = this.angular_speed;
    }
  }
  
  void set_color(color new_color){
    for (int i = 0; i<this.balls.size(); i++){
      this.balls.get(i).colour = new_color;
    }
  }
  
  void rotate_component(float angle){
    for (int i = 0; i<this.balls.size(); i++){
      this.balls.get(i).rotate_ball(angle);
    }
  }
  
  void update(){
    for (int i = 0; i<this.balls.size(); i++){
      this.balls.get(i).move();
    }
  }

}
