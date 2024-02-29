// Date       :29.2.24
// @author    :eshnr7(www.github.com/eshnr7)

model ex21

// parameters for 300K

  parameter Real row_1 (unit = "Kg/m^3") = 2702 "density";
  parameter Real c_p_1 (unit = "J/Kg*K") = 903  "Specific heat";
  parameter Real k_1   (unit = "W/m*K")  = 237  "Thermal conductivity";

// parameters for 700K

  parameter Real c_p_2 (unit = "J/Kg*K") = 1090 "Specific heat";
  parameter Real k_2   (unit = "W/m*K")  = 225  "Thermal conductivity";
  
// parameters for 1000K

  parameter Real row_3 (unit = "Kg/m^3") = 3160 "density";
  parameter Real c_p_3 (unit = "J/Kg*K") = 1195 "Specific heat";
  parameter Real k_3   (unit = "W/m*K")  = 87   "Thermal conductivity";
  
  Real a_1, a_2, a_3 (unit = "m^2/s");
  
equation
  a_1 = k_1/(row_1*c_p_1);
  a_2 = k_2/(row_1*c_p_2);
  a_3 = k_3/(row_3*c_p_3);

end ex21;
