function I_areal = I_areal(nTver,profil)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Titel:    I_areal                                                       %
% Funksjon: Leser inn tversnittsdata og regner ut 2.arealmoment for de    %
%           ulike typene profiltypene, her I- og R�r-Profil.              % 
% Oppdatert: 2017-11-01                                                   %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

I_areal = zeros(2,1);

for i = 1: nTver
    y_global = 0; 
% ------------------------- I-PROFIL --------------------------------------
    if(profil(i,1) == 1) 
        % Henter informasjon 
           h  = profil(i,2);        % Tversnittsh�yde [mm]
            t_bf = profil(i,3);     % Tykkelse brunnflens [mm]
            t_tf = profil(i,4);     % Tykkelse toppflens [mm]
            t_s = profil(i,5);      % Tykkelse stag [mm]
            b_bf = profil(i,6);     % Bredde bunnflens [mm]
            b_tf = profil(i,7);     % Bredde toppflens [mm]
        
        % Beregner arealer (I-Profil)
            a_bf = b_bf * t_bf;             % Areal bunnflens [mm^2] 
            a_tf = b_tf * t_tf;             % Areal toppflens [mm^2]
            a_s = (h - b_bf - b_tf) * t_s;  % Arealet av staget [mm^2]
            a_tot = a_bf + a_tf + a_s;      % Totalt tversnittsareal [mm^2]

        % Beregner lokale arealsenter (I-Profil) 
            y_tf = h - (0.5*t_tf);  % [mm]
            y_bf = 0.5*t_bf;        % [mm]
            y_s = 0.5*h;            % [mm]

        % Beregner globalt arealsenter (I-Profil)
            if ((t_bf ~= t_tf) || (b_bf ~= b_tf))
                  y_c = (1/a_tot) * ((a_tf * y_tf) + (a_bf * y_bf)+ .... 
                        (a_s * y_s)); % [mm]
                    
                    if (y_c >= (h - y_c))
                        y_global = y_c;     % [mm]
                    else
                        y_global = h - y_c; % [mm]
                    end
                    
            elseif (((t_bf == t_tf) && (b_bf == b_tf)))
                y_c = h/2; 
                y_global = y_c;             % [mm]
            
            else
               fprintf('Error');            
            end
        
        % Beregner bidrag fra hver del (I-Profil) 
        A_bf = ((1/12) * (t_bf^3 * b_bf)) + (y_c - (t_bf/2))^2 * a_bf;      % bunnflens [mm^4] 
        A_tf = ((1/12) * (t_tf^3 * b_tf)) + (h - y_c - (t_tf/2))^2 * a_tf;  % Toppflens [mm^4] 
        A_s = (1/12)*((h - t_tf - t_bf)^3 * t_s) + (y_s - y_c)^2* a_s;      % Stag      [mm^4] 
        
        % Totalt 2. Arealmoment (I-Profil)
        I_areal(i,1) = A_tf + A_bf + A_s;   % Total 2.Arealmoment I-Profil [mm^4] 
           
        
% ------------------------- R�RTVERSNITT ----------------------------------
    elseif(profil(i,1) == 2)
        r = 0.5*profil(i,2);                        % radius [mm]
        t = profil(i,3);                            % Tykkelse [mm]
        I_areal(i,1) = ((pi/4)*(r^4 - (r-t)^4));    % 2. Arealmoment r�r.T [mm^4]
        y_global = r;                               % [mm]
                   
        
% ------------------------- ANNET -----------------------------------------    
    else
        fprintf('Error: Ugyldig tversnittsnummer'); 
        I_areal = 0; 
    end
end

fprintf('2.arealmoment beregnet for alle profiltyper\n'); 
end

