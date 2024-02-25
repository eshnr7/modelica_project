// Date       :25.2.24
// @author    :eshnr7(www.github.com/eshnr7)

model ex15

  parameter Real W     (unit = "m")          = 0.05         "width";
  parameter Real H     (unit = "m")          = 0.05         "height";
  parameter Real T_sur (unit = "K")          = 273 + 25     "surroundings temperatures";
  parameter Real T_inf (unit = "K")          = 273 + 25     "air temperatures";
  parameter Real T_c   (unit = "K")          = 273 + 56.4   "saturated vapor condition";
  parameter Real s_b_c (unit = "W/(m^2K^4)") = 5.67*10^(-8) "Stefan-Boltzmann constant";
  parameter Real Eg_dot(unit = "W")          = 11.25        "thermal generation rate"; 
  parameter Real e                           = 0.88         "emissivity of the fuel cell";
  Real A               (unit = "m^2")                       "Area";
  Real q_conv          (unit = "W")                         "convectional heat flux";
  Real q_rad           (unit = "W/m^2")                     "radiative heat flux";
  Real h               (unit = "W*s^0.8/m^2.8*K*V^0.8")    "heat transfer coefficient";
  Real V               (unit = "m/s");
  
equation
  A = 2*W*H                                                 "area calculation, there are two surface";
  q_rad = e*A*s_b_c*(T_c^4 - T_sur^4);
  q_conv + q_rad = Eg_dot;
  h = 10.9 * V;
  V = (q_conv / (10.9*A*(T_c - T_inf)))^1.25;
  
end ex15;
