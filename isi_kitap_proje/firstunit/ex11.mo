model ex11_model
  constant Real heat_coefficient = 1.7; 
  constant Real delta_T = 250; 
  constant Real length = 0.15;
  constant Real area = 0.5*1.2;
  Real heat_flux;
  Real heat_loss;
equation
  heat_flux = heat_coefficient * delta_T / length;
  heat_loss = heat_flux*area;  
end ex11_model;
