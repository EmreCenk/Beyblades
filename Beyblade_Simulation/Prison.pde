



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
