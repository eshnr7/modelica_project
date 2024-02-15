class ex12
  Real e = 0.8;
  Real T_surface = 200+273;
  Real T_sur = 25+273;
  Real sigma = 5.67*10^(-8);
  Real h = 15;
  Real pi = 3.14;
  Real D = 0.07;
  Real q_per_length;
  
equation
  q_per_length = h*pi*D*(T_surface-T_sur) + e*pi*D*sigma*(T_surface^4 - T_sur^4);
   
end ex12;
