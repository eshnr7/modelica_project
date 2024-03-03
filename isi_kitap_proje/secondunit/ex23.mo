// Date       :3.3.24
// @author    :eshnr7(www.github.com/eshnr7)

model ex23
  parameter Real q_dot (unit = "W/m^3") = 1000 "heat generation";
  parameter Real k (unit = "W/m*K") = 40; 
  parameter Real row (unit = "kg/m^3") = 1600;
  parameter Real cp (unit = "kJ/kg*K") = 4; 
  parameter Real A (unit = "m^2") = 10; 
  parameter Real L (unit = "m") = 1; 
  
  Real x; 
  Real dT_dx;
  Real q_flow;
  
equation  
  dT_dx = -300 - 100*x; 
  q_flow = -k *A* dT_dx;
  x = L; // Change the x value to see the amount of heat at any given length.
end ex23;
