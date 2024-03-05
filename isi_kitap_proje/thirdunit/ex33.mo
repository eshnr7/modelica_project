// Date       :5.3.24
// @author    :eshnr7(www.github.com/eshnr7)

model ex33

  parameter Real T_sur  (unit = "K")          = 273 + 20        "surface temperature";
  parameter Real T_inf  (unit = "K")          = 273 + 20        "setting temperature";
  parameter Real s_b_c  (unit = "W/(m^2K^4)") = 5.67*10^(-8)    "Stefan-Boltzmann constant";
  parameter Real h      (unit = "W/m^2*K")    = 100             "heat transfer coefficient of air";
  parameter Real G      (unit = "W/m^2")      = 700             "solar irradiation";
  parameter Real e                            = .9              "emissivity";
  parameter Real L      (unit = "m")          = 1               "length";
  parameter Real eta                          = .553 - .001*307 "efficiency";
  parameter Real w      (unit = "m")          = .1              "wide of solar panel";
  
  Real P                (unit = "W") "produced electric power, formula: P = eta*0.83*G*L*w";
  
equation
  
  P = eta*0.83*G*L*w;
  
  annotation(
    Documentation(info = "<html><head></head><body>A photovoltaic panel consists of (top to bottom) a 3-mm-thick ceria-doped glass (kg  1.4 W/m K), a 0.1-mm-thick optical grade adhesive (ka  145 W/m K), a very thin layer of silicon within which solar energy is converted to electrical energy, a 0.1-mm-thick solder layer (ksdr  50 W/m K), and a 2-mm-thick aluminum nitride substrate (kan  120 W/m K). The solar-to-electrical conversion efficiency within the silicon layer ␩ decreases with increasing silicon temperature, Tsi, and is described by the expression ␩  a – bTsi, where a  0.553 and b  0.001 K1. The temperature T is expressed in kelvins over the range 300 K Tsi  525 K. Of the incident solar irradiation, G 700 W/m2, 7% is reflected from the top surface of the glass, 10% is absorbed at the top surface of the glass, and 83% is transmitted to and absorbed within the silicon layer. Part of the solar irradiation absorbed in the silicon is converted to thermal energy, and the remainder is converted to electrical energy. The glass has an emissivity of ␧  0.90, and the bottom as well as the sides of the panel are insulated. Determine the electric power P produced by an L  1-m-long, w  0.1-m-wide solar panel for conditions characterized by h  35 W/m2K and Tinf = Tsur =  20C.</body></html>"));
end ex33;
