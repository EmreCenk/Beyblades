
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

float[] get_coefficients(float x1, float y1, float x2, float y2){
  // takes in 2 points of a line, converts points to y = mx + b format
  float m = (y1-y2)/(x1-x2);
  float b = y1 - m*x1 ;
  return new float [] {m, b};
}


PVector find_intersection(PVector p11, PVector p12, PVector p21, PVector p22){
  // takes in coordinates for 2 lines, finds intersection
  // p11 -> line 1, point 1
  // p12 -> line 1, point 2 ... etc.  
  float m1, b1, m2, b2;
  float[] coefs1 = get_coefficients(p11.x, p11.y, p12.x, p12.y);
  float[] coefs2 = get_coefficients(p21.x, p21.y, p22.x, p22.y);

  m1 = coefs1[0];
  b1 = coefs1[1];
  
  m2 = coefs2[0];
  b2 = coefs2[1];
  
  if (m1 == m2) return null; // they don't intersect
  
  float x = (b2-b1)/(m1-m2);
  float y = m1*x+b1;
  return new PVector(x, y);
}

boolean point_is_on_line(PVector line_point_1, PVector line_point_2, PVector point_to_check){
  float m, b;
  float[] coefs1 = get_coefficients(line_point_1.x, line_point_1.y, line_point_2.x, line_point_2.y);
  m = coefs1[0];
  b = coefs1[1]; 
  return (point_to_check.y == m * point_to_check.x + b 
          && point_to_check.x < max(line_point_1.x, line_point_2.x)
          && point_to_check.x > min(line_point_1.x, line_point_2.x)
          && point_to_check.y < max(line_point_1.y, line_point_2.y)
          && point_to_check.y > min(line_point_1.y, line_point_2.y)
          );
}
