



class Prison{
  // this class creates the wall boundaries that beyblades bounce off of

  float bounciness; // between 0-1. Represents what percent of velocity is preserved when a wall is hit. If the bounciness is above 1, the walls will act like trampolines (making the balls speed up after bouncing)
  float angular_loss; // between 0-1. Represents what percent of angular speed is preserved when a wall is hit
  PVector top_left, bottom_right; // top left and bottom right coordinates of the rectangle the frame will be in
  
  Prison(float x1, float y1, float x2, float y2){
    this.top_left = new PVector(x1, y1);
    this.bottom_right = new PVector(x2, y2);
    this.bounciness = 1; //default value
    this.angular_loss = 1; //default value
  }
  
  Prison(float x1, float y1, float x2, float y2, float bounce_loss, float angular_loss_){
    // gives option to initialize with bounciness and angular loss
    this(x1, y1, x2, y2); // initialize all other fields
    this.bounciness = bounce_loss; // optional bounciness level
    this.angular_loss = angular_loss_; // optional angular loss
  }
  
  void calculate_collision(Beyblade b1, Beyblade b2){
    // checks if 2 beyblades are colliding. If they are, it does the necesary collision calculations
    BeybladeComponent c1, c2;
    
    // looping through the pairs of components in each beyblade: 
    for (int i = 0; i < b1.components.size(); i++){
      c1 = b1.components.get(i);
      for (int j = 0; j < b2.components.size(); j++){
        c2 = b2.components.get(j);
        
        //checks to see if the two components are intersecting:
        if (line_segments_intersect(c1.balls.get(0).coordinate, c1.balls.get(c1.balls.size() - 1).coordinate,
                                    c2.balls.get(0).coordinate, c2.balls.get(c2.balls.size() - 1).coordinate)){

          elastic_collision_2d(b1, b2); // fancy physics simulation
          return; // if one of them are colliding then you don't need to check other pairs
        }
      }
    }
    
  }
  
  void imprison(Beyblade some_beyblade){
    // makes sure ball isn't out of boundaries 
    // makes ball bounce off wall if necesary
    // note: this function treats all beyblades as circles 
    // (technically they're not all circles, but this approach is surprisingly good and doesn't take up too much resources)
    
    if (some_beyblade.center.y < this.top_left.y + some_beyblade.radius){
      //top wall
      some_beyblade.set_velocity(new PVector(some_beyblade.velocity.x, -some_beyblade.velocity.y)); // reflect along top line
      some_beyblade.set_center(new PVector(some_beyblade.center.x, this.top_left.y + some_beyblade.radius)); //shift beyblade
      some_beyblade.set_velocity(some_beyblade.velocity.mult(this.bounciness)); //change velocity
      
    }
    else if (some_beyblade.center.y > this.bottom_right.y - some_beyblade.radius){
      //bottom wall
      some_beyblade.set_velocity(new PVector(some_beyblade.velocity.x, -some_beyblade.velocity.y)); // reflect along line
      some_beyblade.set_center(new PVector(some_beyblade.center.x, this.bottom_right.y - some_beyblade.radius));
      some_beyblade.set_velocity(some_beyblade.velocity.mult(this.bounciness));
      some_beyblade.set_angular_speed(some_beyblade.angular_speed * this.angular_loss);
    }
    
    if (some_beyblade.center.x < this.top_left.x + some_beyblade.radius){
      // left wall
      some_beyblade.set_velocity(new PVector(-some_beyblade.velocity.x, some_beyblade.velocity.y)); // reflect along line
      some_beyblade.set_center(new PVector(this.top_left.x + some_beyblade.radius, some_beyblade.center.y));
      some_beyblade.set_velocity(some_beyblade.velocity.mult(this.bounciness)); 
      some_beyblade.set_angular_speed(some_beyblade.angular_speed * this.angular_loss);

    }
    
    else if (some_beyblade.center.x > this.bottom_right.x - some_beyblade.radius){
      // right wall
      some_beyblade.set_velocity(new PVector(-some_beyblade.velocity.x, some_beyblade.velocity.y)); // reflect line
      some_beyblade.set_center(new PVector(this.bottom_right.x - some_beyblade.radius, some_beyblade.center.y));
      some_beyblade.set_velocity(some_beyblade.velocity.mult(this.bounciness)); 
      some_beyblade.set_angular_speed(some_beyblade.angular_speed * this.angular_loss);

    }
    
  }

}
