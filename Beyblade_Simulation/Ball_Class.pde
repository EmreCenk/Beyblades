class Ball {
  float radius;
  PVector coordinate, previous_coordinate; // keeps track of the current coordinate and the coordinate in the previous frame
  PVector velocity;
  float angular_speed; // how many degrees it should rotate by each second
  PVector center_of_rotation; // where the center of the beyblade is
  color colour; // gray by default
  
  Ball(float starting_x, float starting_y, PVector rotation_center, float radius_, float velocity_x, float velocity_y, float angular_speed_) {
    this.coordinate = new PVector(starting_x, starting_y);
    this.velocity = new PVector(velocity_x, velocity_y);
    this.radius = radius_;
    this.center_of_rotation = rotation_center;
    this.angular_speed = angular_speed_;
    this.colour = color(100, 100, 100); // default value
  }
  Ball(float starting_x, float starting_y, PVector center_, float radius_, float velocity_x, float velocity_y, float angular_speed_, color colour_) {
    //this alternate constructor just adds the option of setting the colour when initializing the object

    //call the constructor again to initialize other values:
    this(starting_x, starting_y, center_, radius_, velocity_x, velocity_y, angular_speed_);

    //update colour
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
