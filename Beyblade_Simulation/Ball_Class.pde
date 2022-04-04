class Ball {
  float radius; // ball radius
  PVector coordinate; // keeps track of the current coordinate
  PVector velocity; // ball velocity
  float angular_speed; // how many degrees it should rotate by each frame
  PVector center_of_rotation; // where the center of the BEYBLADE is (NOT the center for the ball)
  color colour; // gray by default
  
  
  Ball(float starting_x, float starting_y, PVector rotation_center, float radius_, float angular_speed_) {
    this.coordinate = new PVector(starting_x, starting_y);
    this.radius = radius_;
    this.center_of_rotation = rotation_center;
    this.angular_speed = angular_speed_;
    this.colour = color(100, 100, 100); // default value
  }
  
  Ball(float starting_x, float starting_y, PVector rotation_center, float radius_, float velocity_x, float velocity_y, float angular_speed_) {
    //gives option to initialize with velocity
    this(starting_x, starting_y, rotation_center, radius_, angular_speed_); // initializing other values with the other constructor
    this.velocity = new PVector(velocity_x, velocity_y);
  }

  
  void rotate_ball(float angle){
    //rotates ball around center of rotation
    this.coordinate = rotate_around_pivot(this.center_of_rotation, this.coordinate, angle);
  }
  void move() {
    // moves ball according to it's velocity
    this.coordinate.add(this.velocity);
    this.rotate_ball(this.angular_speed);
  }

  void display() {
    //draws ball on screen
    fill(this.colour);
    stroke(this.colour);
    strokeWeight(1);
    circle(this.coordinate.x, this.coordinate.y, this.radius*2);
  }
}
