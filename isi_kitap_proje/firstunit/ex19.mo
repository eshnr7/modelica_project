model ex19
  // Date       :28.2.24
  // @author    :eshnr7(www.github.com/eshnr7)
  parameter Real T_sur(unit = "K") = 273 + 30;
  parameter Real T_inf(unit = "K") = 273 + 20;
  parameter Real a = .8;
  parameter Real e = .5;
  parameter Real G_lamp(unit = "W/m^2") = 2000;
  parameter Real s_b_c(unit = "W/(m^2K^4)") = 5.67*10^(-8) "Stefan-Boltzmann constant";
  // First section parameters
  //*1  parameter Real h_1    (unit = "W/m^2*K") = 15;
  // Second section parameters
  parameter Real T(unit = "K") = 273 + 50;
  //*2
  Real absorption(unit = "W/m^2");
  Real q_conv(unit = "W/m^2");
  Real q_rad(unit = "W/m^2");
  //*1  Real T      (unit = "K");
  Real h_2(unit = "W/m^2*K");
  //*2
equation
  absorption = a*G_lamp;
//*1  q_conv     = h_1*(T-T_inf);
//*1  q_rad      = e*s_b_c*(T^4 - T_sur^4);
  q_conv = h_2*(T - T_inf);
//*2
  q_rad = e*s_b_c*(T^4 - T_sur^4);
//*2
  absorption - q_conv - q_rad = 0;
// Lines with "//*1" at the beginning were used for the first part. For the second part, override "//*2 at the end"
  annotation(
    Documentation(info = "<html><head></head><body>Find: 1. Cure temperature for h = 15 W/m2 K. 2. Effect of airflow on the cure temperature for 2 ⱕ h ⱕ 200 W/m2 䡠 K. Value of h for which the cure temperature is 50C.</body></html>"));
end ex19;
