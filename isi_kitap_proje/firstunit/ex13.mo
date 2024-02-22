// Date       :22.2.24
// @author    :eshnr7(www.github.com/eshnr7)

model ex13
  parameter Real P(unit "W")  = 2.5*10^6;
  parameter Real eta_gen      = 0.95;
  parameter Real eta_gb       = 0.93;
  parameter Real D(unit = "m")= 3;
  parameter Real L(unit = "m")= 6;
  final constant Real pi      = 2*Modelica.Math.asin(1.0);
  parameter Real T_sur (unit = "K") = 273 + 20              "surroundings temperatures";
  parameter Real T_inf (unit = "K") = 273 + 25              "air temperatures";
  parameter Real s_b_c (unit = "W/(m^2K^4)") = 5.67*10^(-8) "Stefan-Boltzmann constant";
  parameter Real e                           = 0.83         "emissivity of the nacella";
  parameter Real h (unit = "W/(m^2K")        = 35           "heat transfer coefficient"; 
  Real A(unit = "m^2");
  Real W(unit = "W");
  Real Q(unit = "W");
  Real q_con (unit = "W/m^2")                               "convectional heat flux";
  Real q_rad (unit = "W/m^2")                               "radiative heat flux";
  Real T_s (unit = "K");
equation
  W = P/(eta_gen*eta_gb);
  Q = W - P;
  A = pi*D*L + (pi*D^2)/4;
  q_con = h*(T_s-T_inf);
  q_rad = e*s_b_c*(T_s^4 - T_sur^4);
  Q = A*(q_con + q_rad);
annotation(
    Documentation(info = "<html><head></head><body>The blades of a wind turbine turn a large shaft at a relatively slow speed. The rotational speed is increased by a gearbox that has an efficiency of eta_gb = 0.93. In turn, the gearbox output shaft drives an electric generator with an efficiency of eta_gen = 0.95. The cylindrical nacelle, which houses the gearbox, generator, and associated equipment, is of length L = 6 m and diameter D⫽ 3 m. If the turbine produces P⫽ 2.5 MW of electrical power, and the air and surroundings temperatures are Tinfinity = 25C and Tsur = 20C, respectively, determine the minimum possible operating temperature inside the nacelle. The emissivity of the nacelle is e = 0.83,&nbsp;and the convective heat transfer coefficient is h = 35 W/m2 䡠 K. The surface of the nacelle that is adjacent to the blade hub can be considered to be adiabatic, and solar irradiation may be neglected.</body></html>"));
end ex13;

// T_s is found as 415.78 K when simulate it.
