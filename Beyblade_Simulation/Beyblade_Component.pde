

class BeybladeComponent{
  
  // every beyblade is made up of multiple components. This class represents those components
  PVector center;
  float angular_speed; // how many degrees it should rotate by each frame
  ArrayList<Ball> balls; // every component is made up of a bunch of balls
  
  BeybladeComponent(PVector center_, // center of beyblade
                    int length_, // how long the component should be 
                    int ball_num, // how many balls the component should have. 
                    float ball_radius,
                    float angular_speed_
                    )
  {
    this.center = center_;
    this.balls = new ArrayList<Ball>();
    this.angular_speed = angular_speed_;
    for (int x = width/2 - length_/2; x<length_/2 + width/2; x+=length_/ball_num){
      this.balls.add(new Ball(x, height/2, this.center, ball_radius, this.angular_speed));  
    }
  
  }
  
  void display(){
    for (int i = 0; i<this.balls.size(); i++){
      this.balls.get(i).display();
    }
  }
  
  void update(){
    for (int i = 0; i<this.balls.size(); i++){
      this.balls.get(i).move();
    }
  }
}
