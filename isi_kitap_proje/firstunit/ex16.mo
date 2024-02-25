model ex16

  parameter Real W        (unit = "m")       = .1       "cavity of width";
  parameter Real L        (unit = "m")       = .005     "wall thickness";
  parameter Real k        (unit = "W/(m*K)") = .05      "thermal conductivity";
  parameter Real T_1      (unit = "K")       = 273 + 30 "outer surface temperature";
  parameter Real T_f      (unit = "K")       = 273 + 0  "the ice is at fusion temperature";
  parameter Real density  (unit = "Kg/m^3")  = 920      "density";
  parameter Real h_sf     (unit = "Kj/Kg")   = 334      "heat of fusion of the ice";
  
  Real delta_E_st         (unit = "Kj");
  Real E_in               (unit = "Kj");
  Real E_in               (unit = "Kj");
  Real M                  (unit = "Kg");
  Real t_m                (unit = "s");

equation
  M          = density*(W-2*L)^3                        "Mass";
  q_cond     = (k*6*W^2)*(T_1-T_f)/L;
  delta_E_st = h_sf*M;
  E_in       = delta_E_st;
  E_in       = q_cond*t_m;
  
annotation(
    Documentation(info = "<html><head></head><body>Large PEM fuel cells, such as those used in automotive applications, often require internal cooling using pure liquid water to maintain their temperature at a desired level (see Example 1.5). In cold climates, the cooling water must be drained from the fuel cell to an adjoining container when the automobile is turned off so that harmful freezing does not occur within the fuel cell. Consider a mass M of ice that was frozen while the automobile was not being operated. The ice is at the fusion temperature (Tf⫽ 0⬚C) and is enclosed in a cubical container of width W on a side. The container wall is of thickness L and thermal&nbsp;conductivity k. If the outer surface of the wall is heated to a temperature T1 &gt; Tf to melt the ice, obtain an expression for the time needed to melt the entire mass of ice and, in turn, deliver cooling water to, and energize, the fuel cell.<div><br></div><div><br></div><div><div>1. Several complications would arise if the ice were initially subcooled. The storage term would have to include the change in sensible (internal thermal) energy required to take the ice from the subcooled to the fusion temperature. During this process, temperature gradients would develop in the ice.</div><div>2. Consider a cavity of width W= 100 mm on a side, wall thickness L = 5 mm, and thermal conductivity k = 0.05 W/m*K.</div></div><div><br></div><div>The density and latent heat of fusion of the ice are ␳density = &nbsp;920 kg/m3 and hsf = 334 kJ/kg, respectively.</div><div><br></div><div><br></div></body></html>"));
end ex16;
