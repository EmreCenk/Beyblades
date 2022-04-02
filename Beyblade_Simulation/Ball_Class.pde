class Ball {
  float radius;
  PVector coordinate, previous_coordinate; // keeps track of the current coordinate and the coordinate in the previous frame
  PVector velocity;
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
    this(starting_x, starting_y, rotation_center, radius_, angular_speed_);
    this.velocity = new PVector(velocity_x, velocity_y);
  }

  Ball(float starting_x, float starting_y, PVector rotation_center, float radius_, float angular_speed_, color colour_) {
    //gives option to init with colour

    //call the constructor again to initialize other values:
    this(starting_x, starting_y, rotation_center, radius_, angular_speed_);
    this.colour = colour_;
  }


  //void add_to_velocity(PVector addition){
  //  // increases velocity by x_add and y_add in the x and y components respectively
  //  this.velocity.add(addition);
  //}

  void move() {
    this.coordinate.add(this.velocity);
    this.coordinate = rotate_around_pivot(this.center_of_rotation, this.coordinate, this.angular_speed);
  }

  void display() {
    fill(this.colour);
    stroke(this.colour);
    circle(this.coordinate.x, this.coordinate.y, this.radius*2);
  }
}
