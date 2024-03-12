// Date       :12.3.24
// @author    :eshnr7(www.github.com/eshnr7)

model ex34

  parameter Real D      (unit = "m")    = 14*10^(-9)  "carbon nanotube diameter";
  parameter Real T_inf  (unit = "K")    = 300         "water of silicon nitride's temperature";
  parameter Real T_s    (unit = "K")    = 308.4       "temperature of the sensing island";
  parameter Real w_pt   (unit = "m")    = 1*10^(-6)   "width of the platinum line";
  parameter Real t_pt   (unit = "m")    = .2*10^(-6)  "thickness of the platinum line";
  parameter Real w_sn   (unit = "m")    = 3*10^(-6)   "width of the silicon nitride beams";
  parameter Real t_sn   (unit = "m")    = .5*10^(-6)  "thickness of the silicon nitride beams";
  parameter Real q      (unit = "W")    = 11.3*10^(-6)"electrical power";
  parameter Real L      (unit = "m")    = 250*10^(-6) "length";
  parameter Real s      (unit = "m")    = 5*10^(-6)   "distance between square islands";
// properties: 
  parameter Real k_pt   (unit = "W/mK") = 71.6        "Table A.1, platinum (325K, assumed)";
  parameter Real k_sn   (unit = "W/mK") = 15.5        "Table A.2, silicon  nitride (325K, assumed)";

  final constant Real pi                = 2*Modelica.Math.asin(1.0);
  
  
  Real A_pt     (unit = "m^2")    "Area of the platinum";
  Real A_sn     (unit = "m^2")    "Area of the silicon nitride beams";
  Real A_cn     (unit = "m^2")    "cross-sectional area of the carbon nanotube";
  Real R_t_sup  (unit = "K/W")    "thermal resistance of each support";
  Real q_s      (unit = "W")      "Heat loss";
  Real q_h      (unit = "W")      "Heat loss";
  Real T_h      (unit = "K")      "temperature of the heated island";
  Real k_cn     (unit = "W/mK")   "thermal conductivity of the carbon nanotube";
  
equation

  A_pt    = w_pt*t_pt;
  A_sn    = w_sn*t_sn - A_pt;
  
  A_cn    = (pi*D^2)/4;
  
  R_t_sup = (((k_pt*A_pt)/L) + ((k_sn*A_sn)/L))^(-1);
  
  q_s     = 2*(T_s - T_inf)/R_t_sup;
  q_h     = q - q_s; 
  
  T_h     = T_inf + .5*q_h*R_t_sup;

  q_s     = ((T_h - T_s)*(k_cn*A_cn))/(s);
end ex34;
