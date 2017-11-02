function [annetarealmoment y_global] = annetarealmoment_iprofil(h,...
    t_bunnflens, t_toppflens, t_steg, b_bunnflens, b_toppflens)
%Regner ut annet arealmoment for et IPE-profil

%diverse arealer og avstander fra lokale arealsentere til midten av
%profilet
a_toppflens = b_toppflens * t_toppflens;
a_bunnflens = b_bunnflens * t_bunnflens;
a_steg = (h - t_toppflens - t_bunnflens) * t_steg;
y_toppflens = h - t_toppflens/2;
y_bunnflens = t_bunnflens/2;
y_steg = h/2;
a_tot = a_toppflens + a_bunnflens + a_steg;


%sjekker om bredden eller tykkelesen til toppflensen er forskjellig fra
%bunnflensen, hvis den er det saa maa arealsenterets plassering regnes ut
%ettersom denne ikke vil ligge i midten av profilet lenger.
if ((t_bunnflens ~= t_toppflens) || (b_bunnflens ~= b_toppflens))
    
    yc = (a_toppflens * y_toppflens + a_bunnflens * y_bunnflens +...
        y_steg*a_steg) / a_tot;
    
    %Henter y til beregning av boyespenning
    if yc > (h - yc)
        y_global = yc;
    else
        y_global = h - yc;
    end
else
    yc = h/2;
    
    %Henter y til beregning av boyespenning
    y_global = yc;
end
    %regner ut annet arealmoment for hver del, legger paa steiners tillegg,
    %og summerer for aa finne totalt annet arealmoment
    am1 = ((t_toppflens^3) * b_toppflens) / 12 +...
        (h - yc - t_toppflens/2)^2 * a_toppflens;
    
    am2 = ((t_bunnflens^3) * b_bunnflens) / 12 +...
        (yc - t_bunnflens/2)^2 * a_bunnflens;
    
    am3 = (((h - t_toppflens - t_bunnflens)^3) * t_steg) / 12 +...
        ((y_steg-yc)^2) * a_steg;
    
    annetarealmoment = (am1 + am2 + am3)*10^-12;
end