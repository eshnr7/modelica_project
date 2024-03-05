// Date       :5.3.24
// @author    :eshnr7(www.github.com/eshnr7)

model ex31

  parameter Real T_i      (unit = "K")         = 273 + 35     "skin/fat temperature";
  parameter Real T_sur    (unit = "K")         = 273 + 10     "surface temperature";
  parameter Real T_inf    (unit = "K")         = 273 + 10     "setting temperature";
  parameter Real L_sf     (unit = "m")         = 3*10^(-3)    "length of skin/fat";
  parameter Real k_sf     (unit = "W/(m*K)")   = .3           "thermal conductivity of skin/fat";
  parameter Real k_ins    (unit = "W/(m*K)")   = .014         "thermal conductivity of insulation";
  parameter Real h_air    (unit = "W/(m^2*K)") = 2            "heat transfer coefficient of air";
  parameter Real h_water  (unit = "W/(m^2*K)") = 200          "heat transfer coefficient of water";
  parameter Real h_r      (unit = "W/(m^2*K)") = 5.9          "radiation heat transfer coefficient";
  parameter Real A        (unit = "m^2")       = 1.8          "area";
  parameter Real s_b_c    (unit = "W/(m^2K^4)")= 5.67*10^(-8) "Stefan-Boltzmann constant";
  parameter Real q        (unit = "W")         = 100          "reducing heat loss rate";
  parameter Real e                             = .95;
  
  Real R_tot    (unit = "K/W")  "total thermal resistance";
  Real L_ins_w  (unit = "m")    "length of insulation in water";
  Real L_ins_a  (unit = "m")    "length of insulation in air";
  Real T_s      (unit = "K")    "skin temperature";
  
equation
   
  R_tot   = (T_i - T_inf)/q;
  L_ins_a = k_ins*(A*R_tot - (L_sf/k_sf) - (1/(h_air + h_r)));
  L_ins_w = k_ins*(A*R_tot - (L_sf/k_sf) - (1/h_water));
  q       = (k_sf*A*(T_i - T_s))/L_sf;
  
annotation(
    Documentation(info = "<html><head></head><body>In Example 1.7, we calculated the heat loss rate from a human body in air and water environments. Now we consider the same conditions except that the surroundings (air or water) are at 10C. To reduce the heat loss rate, the person wears special sporting gear (snow suit and wet suit) made from a nanostructured silica aerogel insulation with an extremely low thermal conductivity of 0.014 W/m &nbsp;K. The emissivity of the outer surface of the snow and wet suits is 0.95. What thickness of aerogel insulation is needed to reduce the heat loss rate to 100 W (a typical metabolic heat generation rate) in air and water? What are the resulting skin temperatures?</body></html>"));
end ex31;
