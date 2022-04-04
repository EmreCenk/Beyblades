


float VELOCITY_LOSS = 10;

float[] elastic_collision_1d(float m1, float v1, float m2, float v2){
  // using physics to simulate equations  
  // conservation of momentum: m1*v1 + m2*v2 = m1*v1' + m2*v2'
  // conservation of kinetic energy (assuming no energy is lost): m1*(v1^2) + m2*(v2^2) = m1*(v1'^2) + m2*(v2'^2)
  // Note: I'm not sure if momentum and kinetic energy is treated differently when the objects are spinning
  // As a result, I will be treating the beyblades as if they are non-spinning objects

  float new_v2, new_v1;
  float p_i = m1 * v1 + m2 * v2; // initial momentum
  float Ek_i = m1 * v1 * v1 + m2 * v2 * v2; // initial kinetic energy
  float[] v2_final_options = solve_quadratic(m2 + (m2*m2)/m1, -2*p_i*m2/m1, p_i*p_i/m1 - Ek_i); // the result of a page of algebra and 15+ minutes of my life

  //one of the answers will be inadmissible, the following if statement
  if (v2_final_options[0] == v2) new_v2 = v2_final_options[1];
  else new_v2 = v2_final_options[0];
  
  new_v1 = (p_i - m2 * new_v2)/m1;
  return new float[] {new_v1, new_v2};
}


void elastic_collision(Beyblade beyb1, Beyblade beyb2){
  // calculates what would happen if 2 beyblades collided
  // if this function has been called, we are sure that the 2 beyblades are intersecting at some point
  
  // note: since this is 2d we have to do each component individually :(
  float [] x_components = elastic_collision_1d(beyb1.mass, beyb1.velocity.x, beyb2.mass, beyb2.velocity.x);  
  float [] y_components = elastic_collision_1d(beyb1.mass, beyb1.velocity.y, beyb2.mass, beyb2.velocity.y);
  
  beyb1.set_velocity(new PVector(x_components[0], y_components[0]).mult(0.99));
  beyb2.set_velocity(new PVector(x_components[1], y_components[1]).mult(0.99));

  
  
  beyb1.set_angular_speed(max(beyb2.angular_speed*0.95, 0));
  beyb2.set_angular_speed(max(beyb2.angular_speed*0.95, 0));
  //beyb2.set_velocity(new PVector(new_v2x, 0));
  //beyb1.set_velocity(new PVector(new_v1x, 0));

}
