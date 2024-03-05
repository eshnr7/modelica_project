// Date       :5.3.24
// @author    :eshnr7(www.github.com/eshnr7)

model ex32

  parameter Real T_inf  (unit = "K")        = 273 + 25    "setting temperature";
  parameter Real h      (unit = "W/m^2*K")  = 100         "heat transfer coefficient of air";
  parameter Real L      (unit = "m")        = 8*10^(-3)   "lenght of aluminum substrate";
  parameter Real k      (unit = "W/m*K")    = 239         "from Table A.1 (350K), thermal conductivity of pure aluminum";
  parameter Real R_tc   (unit = "(m^2*K)/W")= 0.9*10^(-4) "the max possible value of thermal resistance form Table 3.2";
  parameter Real q_c    (unit = "W/m^2")    = 10^4        "heat dissipation";
  
  Real T_c  (unit = "K");
  
equation
  
  T_c = T_inf + q_c/(h + 1/((R_tc)*(L/k)*(1/h)));
  
  annotation(
    Documentation(info = "<html><head></head><body>A thin silicon chip and an 8-mm-thick aluminum substrate are separated by a 0.02-mm-thick epoxy joint. The chip and substrate are each 10 mm on a side, and their exposed surfaces are cooled by air, which is at a temperature of 25C and provides a convection coefficient of 100 W/m2 K. If the chip dissipates 104 W/m2 under normal conditions, will it operate below a maximum allowable temperature of 85C?</body></html>"));
end ex32;
