// Date       :3.3.24
// @author    :eshnr7(www.github.com/eshnr7)

model ex22

  parameter Real k_p    (unit = "W/m")      = 36.0        "thermal conductivity of the particle";
  parameter Real row_p  (unit = "kg/m^3")   = 3970        "density of the particle";
  parameter Real cp_p   (unit = "kJ/kg*K")  = .765        "specific heat";
  parameter Real fi                         = .05         "volume friction";
  
// properties for T = 300K from Table A.6
  parameter Real k_bf   (unit = "W/m*K")    = .613        "thermal conductivity of the water";
  parameter Real row_bf (unit = "kg/m^3")   = 997         "density of the water";
  parameter Real cp_bf  (unit = "kJ/kg*K")  = 4.179       "specific heat";
  parameter Real mi_bf  (unit = "N*s/m^2")  = 855*10^(-6) "viscosity";

  Real k_nf   (unit = "W/m")      "nanofluid thermal conductivity";
  Real row_nf (unit = "kg/m^3")   "density of the nanofluid";
  Real cp_nf  (unit = "kJ/kg*K")  "specific heat";
  Real mi_nf  (unit = "N*s/m^2")  "dynamic viscosity";
  Real a_nf   (unit = "m^2/s")    "thermal diffusivity";
  
  
equation

  k_nf = ((k_p + 2*k_bf + 2*fi*(k_p - k_bf))/(k_p + 2*k_bf - fi*(k_p - k_bf)))*k_bf;
  
  row_nf = row_bf*(1-fi) + row_p*fi; //by using conservation of mass principle
  
  row_nf*cp_nf = row_bf*(1-fi)*cp_bf + row_p*fi*cp_p;// by using the conservation of energy principle
  mi_nf = mi_bf*(1+2.5*fi); // from the statements
  
  a_nf = k_nf/(row_nf*cp_nf*1000);





end ex22;
