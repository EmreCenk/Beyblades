



class Prison{
  // this class creates the wall boundaries that balls bounce off of

  float bounciness; // between 0-1. If the bounciness is above 1, the walls will act like trampolines (making the balls speed up after bouncing)
  float angular_loss; // between 0-1. Represents what percent of angular speed is preserved when a wall is hit
  PVector top_left, bottom_right; // top left and bottom right coordinates of the rectangle the frame will be in
  
  Prison(float x1, float y1, float x2, float y2){
    this.top_left = new PVector(x1, y1);
    this.bottom_right = new PVector(x2, y2);
    this.bounciness = 1; //default value
    this.angular_loss = 1;
  }
  
  Prison(float x1, float y1, float x2, float y2, float bounce_, float angular_loss_){
    this(x1, y1, x2, y2); // initialize all other fields
    this.bounciness = bounce_; // optional bounciness level
    this.angular_loss = angular_loss_; // optional angular loss
  }
  
  void calculate_collision(Beyblade b1, Beyblade b2){
    // checks if 2 beyblades are colliding. If they are, it does the necesary collision calculations
    BeybladeComponent c1, c2;
    for (int i = 0; i < b1.components.size(); i++){
      c1 = b1.components.get(i);
      for (int j = 0; j < b2.components.size(); j++){
        c2 = b2.components.get(j);
        if (line_segments_intersect(c1.balls.get(0).coordinate, c1.balls.get(c1.balls.size() - 1).coordinate,
                                    c2.balls.get(0).coordinate, c2.balls.get(c2.balls.size() - 1).coordinate)){
          b1.set_colour(color( round(random(0, 255)), round(random(0, 255)), round(random(0, 255))));
          b2.set_colour(color( round(random(0, 255)), round(random(0, 255)), round(random(0, 255))));
          b1.set_velocity(b1.velocity.mult(-1));
          b2.set_velocity(b2.velocity.mult(-1));
          return;
        }
      }
    }
    
  }
  
  void imprison(Beyblade some_beyblade){
    // makes sure ball isn't out of boundaries 
    // makes ball bounce off wall if necesary\
    // note: this function treats all beyblades as circles (the math was easier and there were less calculations don't judge me lol)
    
    if (some_beyblade.center.y < this.top_left.y + some_beyblade.radius){
      //top wall
      some_beyblade.velocity.y *= -1; // reflect along top line
      some_beyblade.center.y = this.top_left.y + some_beyblade.radius;
      some_beyblade.velocity.mult(this.bounciness);
    }
    else if (some_beyblade.center.y > this.bottom_right.y - some_beyblade.radius){
      //bottom wall
      some_beyblade.velocity.y *= -1;
      some_beyblade.center.y = this.bottom_right.y - some_beyblade.radius;
      some_beyblade.velocity.mult(this.bounciness);
      some_beyblade.set_angular_speed(some_beyblade.angular_speed * this.angular_loss);
    }
    
    if (some_beyblade.center.x < this.top_left.x + some_beyblade.radius){
      // left wall
      some_beyblade.velocity.x *= -1;
      some_beyblade.center.x = this.top_left.x + some_beyblade.radius;
      some_beyblade.velocity.mult(this.bounciness);
      some_beyblade.set_angular_speed(some_beyblade.angular_speed * this.angular_loss);

    }
    
    else if (some_beyblade.center.x > this.bottom_right.x - some_beyblade.radius){
      // right wall
      some_beyblade.velocity.x *= -1;
      some_beyblade.center.x = this.bottom_right.x - some_beyblade.radius;
      some_beyblade.velocity.mult(this.bounciness);
      some_beyblade.set_angular_speed(some_beyblade.angular_speed * this.angular_loss);

    }
    
  }

}
