function [I_areal,y_global] = I_areal(nTver,profil)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Titel:    I_areal                                                       %
% Funksjon: Leser inn tversnittsdata og regner ut 2.arealmoment for de    %
%           ulike typene, her I- og Rør-Profil.                           % 
% Oppdatert: 2017-11-01                                                   %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

fprintf('Beregner 2.arealmoment for tversnittene...\n'); % Melding til bruker
I_areal = zeros(2,1);


for i = 1: nTver
    y_global = 0; 
% I-PROFIL
    if(profil(i,1) == 1) 
        % Henter informasjon (I-Profil)
            h  = profil(i,2);       % Tversnittshøyde
            t_bf = profil(i,3);     % Tykkelse brunnflens
            t_tf = profil(i,4);     % Tykkelse toppflens
            t_s = profil(i,5);      % Tykkelse stag
            b_bf = profil(i,6);     % Bredde bunnflens
            b_tf = profil(i,7);     % Bredde toppflens
        
        % Beregner arealer (I-Profil)
            a_bf = b_bf * t_bf;             % Areal bunnflens 
            a_tf = b_tf * t_tf;             % Areal toppflens
            a_s = (h - b_bf - b_tf) * t_s;  % Arealet av staget
            a_tot = a_bf + a_tf + a_s;      % Totalt tversnittsareal 

        % Beregner lokale arealsenter (I-Profil) 
            y_tf = h - (0.5*t_tf);
            y_bf = 0.5*t_bf; 
            y_s = 0.5*h; 

        % Beregner globalt arealsenter (I-Profil)
            if ((t_bf ~= t_tf) || (b_bf ~= b_tf))
                  y_c = (1/a_tot) * ((a_tf * y_tf) + (a_bf * y_bf)+ .... 
                        (a_s * y_s)); 
                    
                    if (y_c >= (h - y_c))
                        y_global = y_c;
                    else
                        y_global = h - y_c; 
                    end
                    
            elseif (((t_bf == t_tf) && (b_bf == b_tf)))
                y_c = h/2; 
                y_global = y_c;            
            
            else
               fprintf('Error');            
            end
        
        % Beregner bidrag fra hver del (I-Profil) 
        A_bf = ((1/12) * (t_bf^3 * b_bf)) + (y_c - (t_bf/2))^2 * a_bf;      % bunnflens
        A_tf = ((1/12) * (t_tf^3 * b_tf)) + (h - y_c - (t_tf/2))^2 * a_tf;  % Toppflens
        A_s = (1/12)*((h - t_tf - t_bf)^3 * t_s) + (y_s - y_c)^2* a_s;      % Stag
        
        % Totalt 2. Arealmoment (I-Profil)
        I_areal(i,1) = A_tf + A_bf + A_s;   % Total 2.Arealmoment I-Profil
           
        
% RØRTVERSNITT
    elseif(profil(i,1) == 2)
        r = 0.5*profil(i,2);                        % radius
        t = profil(i,3);                            % Tykkelse 
        I_areal(i,1) = ((pi/4)*(r^4 - (r-t)^4));    % 2. Arealmoment rør.T
        y_global = r;
                   
        
% ANNET    
    else
        fprintf('Error: Ugyldig tversnittsnummer'); % Melding til bruker
        I_areal = 0; 
    end
end

fprintf('2.arealmoment beregnet for alle profiltyper\n\n'); % Melding til bruker
end

