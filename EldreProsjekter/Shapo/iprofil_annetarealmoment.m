function annetarealmoment_y_global = iprofil_annetarealmoment(h,...
    t_bunnf,t_toppf,t_steg,b_bunnf,b_toppf)

areal_topp = t_toppf * b_toppf;
areal_bunn = t_bunnf * b_bunnf;
areal_steg = (h - t_toppf - t_bunnf) * t_steg;

y_toppf = h - (t_toppf/2);
y_bunnf = t_bunnf/2;
y_steg = h/2;

arealtot = areal_topp + areal_bunn + areal_steg;

if ((t_bunnf ~= t_toppf) || (b_bunnf ~= b_toppf))
    
    yc = (areal_topp * y_toppf + areal_bunn * y_bunnf + areal_steg *...
        y_steg)/arealtot;
    
    if yc >  (h - yc)
    y_global = yc;
    
else 
    y_global = h - yc; 
end 

else 
    yc = h/2;
    y_global = yc;
    
end 

arealm1 = ((t_toppf^3) * b_toppf) /12 + (h-yc-t_toppf/2)^2 * areal_topp;

arealm2 = ((t_bunnf^3) * b_bunnf) /12 + (yc - t_bunnf/2)^2 * areal_bunn;

arealm3 = (((h - t_toppf - t_bunnf)^3) * t_steg) / 12 + ((y_steg - yc)^2)...
    *areal_steg; 

annetarealmoment_y_global = (arealm1 + arealm2 + arealm3)*(10^12);

end