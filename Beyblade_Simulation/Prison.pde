



class Prison{
  // this class creates the wall boundaries that balls bounce off of

  float bounciness; // between 0-1. If the bounciness is above 1, the walls will act like trampolines (making the balls speed up after bouncing)
  PVector top_left, bottom_right; // top left and bottom right coordinates of the rectangle the frame will be in
  
  Prison(float x1, float y1, float x2, float y2){
    this.top_left = new PVector(x1, y1);
    this.bottom_right = new PVector(x2, y2);
    this.bounciness = 1; //default value
  }
  Prison(float x1, float y1, float x2, float y2, float bounce_){
    this(x1, y1, x2, y2); //initialize points
    this.bounciness = bounce_; // optional bounciness level
  
  }

  
  void imprison(Beyblade some_beyblade){
    // makes sure ball isn't out of boundaries 
    // makes ball bounce off wall if necesary
    
    if (some_beyblade.center.y < this.top_left.y + some_beyblade.radius){
      //top wall
      some_beyblade.velocity.y *= -1; // reflect along top line
      some_beyblade.center.y = this.top_left.y + some_beyblade.radius;
      some_beyblade.velocity.mult(this.bounciness);
    }
    if (some_beyblade.center.y > this.bottom_right.y - some_beyblade.radius){
      //bottom wall
      some_beyblade.velocity.y *= -1;
      some_beyblade.center.y = this.bottom_right.y - some_beyblade.radius;
      some_beyblade.velocity.mult(this.bounciness);
    }
    
    if (some_beyblade.center.x < this.top_left.x + some_beyblade.radius){
      some_beyblade.velocity.x *= -1;
      some_beyblade.center.x = this.top_left.x + some_beyblade.radius;
      some_beyblade.velocity.mult(this.bounciness);
    }
    
    if (some_beyblade.center.x > this.bottom_right.x - some_beyblade.radius){
      some_beyblade.velocity.x *= -1;
      some_beyblade.center.x = this.bottom_right.x - some_beyblade.radius;
      some_beyblade.velocity.mult(this.bounciness);
    }
    
  }

}
