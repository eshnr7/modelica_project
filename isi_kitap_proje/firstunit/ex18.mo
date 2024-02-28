// Date       :28.2.24
// @author    :eshnr7(www.github.com/eshnr7)

model ex18

  parameter Real T_h    (unit = "K")   = 1000         "hot side temperature";
  parameter Real T_c    (unit = "K")   = 300          "cold side temperature";
  parameter Real q_in   (unit = "W")   = 2500*10^6;
  
// First section parameters (clean)

  parameter Real R_h_1  (unit = "K/W") = 8*10^(-8)    "hot side resistance";
  parameter Real R_c_1  (unit = "K/W") = 2*10^(-8)    "cold side resistance";
  
// Second section parameters (fouled)

  parameter Real R_h_2  (unit = "K/W") = 9*10^(-8)    "hot side resistance";
  parameter Real R_c_2  (unit = "K/W") = 2.2*10^(-8)  "cold side resistance";

  Real R_tot_1 (unit = "K/W");
  Real R_tot_2 (unit = "K/W");
  Real eta_m_1                                        "efficiency of clean condition";
  Real eta_m_2                                        "efficiency of fouled condition";
  
equation

  R_tot_1 = R_h_1 + R_c_1;
  R_tot_2 = R_h_2 + R_c_2;
  
  eta_m_1 = 1 - (T_c/(T_h - q_in*R_tot_1));
  eta_m_2 = 1 - (T_c/(T_h - q_in*R_tot_2));    

annotation(
    Documentation(info = "<html><head></head><body><div>In a large steam power plant, the combustion of coal provides a heat rate of qin ⫽ 2500 MW at a flame temperature of Th ⫽ 1000 K. Heat is rejected from the plant to a river flowing at Tc ⫽ 300 K. Heat is transferred from the combustion products to the exterior of large tubes in the boiler by way of radiation and convection, through the boiler tubes by conduction, and then from the interior tube surface to the working fluid (water) by convection. On the cold side, heat is extracted from the power plant by condensation of steam on the exterior condenser tube surfaces, through the condenser tube walls by conduction, and from the interior of the condenser tubes to the river water by convection. Hot and cold side thermal resistances account for the combined effects of conduction, convection, and radiation and, under design conditions, they are Rt,h ⫽ 8 ⫻ 10⫺8 K/W and Rt,c ⫽ 2 ⫻ 10⫺8 K/W, respectively. 1. Determine the efficiency and power output of the power plant, accounting for heat transfer effects to and from the cold and hot reservoirs. Treat the power plant as an internally reversible heat engine.</div><div>2. Over time, coal slag will accumulate on the combustion side of the boiler tubes. This fouling process increases the hot side resistance to Rt,h ⫽ 9 ⫻ 10⫺8 K/W. Concurrently, biological matter can accumulate on the river water side of the condenser tubes, increasing the cold side resistance to Rt,c ⫽ 2.2 ⫻ 10⫺8 K/W. Find the efficiency and power output of the plant under fouled conditions.</div></body></html>"));
end ex18;
