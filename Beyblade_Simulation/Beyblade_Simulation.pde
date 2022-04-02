


Ball my_ball;
void setup(){
  size(1000, 600);
  my_ball = new Ball(width/2.0, height/2.0, new PVector(0,0), 10.0, -5.0, 1.0, 10);
  background(0);
}

void draw(){
  background(0);

  my_ball.move();
  my_ball.display();
}
