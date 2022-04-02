
PVector polar_to_cartesian(float r, float theta){
  // converts polar coordinates to cartesian
  PVector cart = new PVector();  
  cart.x = r*cos(theta);
  cart.y = r*sin(theta);
  return cart;
}


PVector rotate_around_pivot(PVector pivot, PVector point, float theta){
  float tempX = point.x - pivot.x;
  float tempY = point.y - pivot.y;
  float current_angle = atan2(tempY, tempX);
  
  PVector rotated_p = polar_to_cartesian(dist(0, 0, tempX, tempY), current_angle - theta);
  
  rotated_p.x += pivot.x;
  rotated_p.y += pivot.y;
  return rotated_p;

}
