



void elastic_collision(Beyblade beyb1, Beyblade beyb2){
  // calculates the inelastic collisions using gr 12 physics
  // Note: I'm not sure if momentum and kinetic energy is treated differently when the objects are spinning
  // As a result, I will be treating the beyblades as if they are non-spinning objects
  
  // conservation of momentum: m1*v1 + m2*v2 = m1*v1' + m2*v2'
  // conservation of kinetic energy: m1*(v1^2) + m2*(v2^2) = m1*(v1'^2) + m2*(v2'^2)
  
  // we know m1, m2, v1, v2
  // we don't know v1' and v2'
  // we have 2 unknowns and 2 equations.
  // lets solve this system and find the final velocities
  // note: since this is 2d we have to do each component individually :(
  float new_v1x, new_v2x;
  
  float m1 = beyb1.mass;
  float m2 = beyb2.mass; 
  PVector v1 = beyb1.velocity;
  PVector v2 = beyb2.velocity;
  
  // x component:
  float initial_momentum_x = v1.x * m1 + v2.x * m2;
  float initial_kinetic_energy_x = m1 * pow(v1.x, 2) + m2 * pow(v2.x, 2);
  float a1 = initial_momentum_x;
  float b1 = initial_kinetic_energy_x;
  // after a whole page of algebra, the following is what I derived as the solution for the new v2 in the x component
  
  float[] new_v2x_options = solve_quadratic(m1*m2-m2, 2*a1*m2, a1*a1-m1*b1);
  if (new_v2x_options[0] != v2.x) new_v2x = new_v2x_options[0];
  else new_v2x = new_v2x_options[1];
  new_v1x = (a1 - new_v2x*m2)/m1; // plug into initial equation
  
  //// y component:
  //float initial_momentum_y = v1.y * m1 + v2.y * m2;
  //float initial_kinetic_energy_y = m1 * pow(v1.y, 2) + m2 * pow(v2.y, 2);
  //float a2 = initial_momentum_y;
  //float b2 = initial_kinetic_energy_y;
  
  //float[] new_v1y_options = solve_quadratic(m1*m2-m2, 2*a2*m2, a2*a2-m1*b2);
  //if (new_v2x_options[0] != v2.x) new_v2x = new_v2y_options[0];
  //else new_v2y = new_v2y_options[1];
  //float new_v1y = (a2 - new_v2y*m2)/m1; // plug into initial equation
  
  beyb1.set_velocity(new PVector(beyb1.velocity.x*1.2, 0));
  //beyb2.set_velocity(new PVector(new_v2x, 0));
  println(beyb1.velocity);
  println(beyb2.velocity);
  println(beyb1.center);
  println();
}
