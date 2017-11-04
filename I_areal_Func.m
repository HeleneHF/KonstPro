function I_areal = I_areal_Func(nTver,profil)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Titel:    I_areal                                                       %
% Funksjon: Leser inn tversnittsdata og regner ut 2.arealmoment for de    %
%           ulike typene, her I- og Rør-Profil.                           % 
% Oppdatert: 2017-11-01                                                   %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

fprintf('Beregner 2.arealmoment for tversnittene...\n'); % Melding til bruker
I_areal = zeros(2,1);

for i = 1: nTver
    %type_profil = profil(i,1) 
    
    if(profil(i,1) == 1)%if(type_profil == 1)        % I-Profil 
        
       h = profil(i,2); 
       t_s = profil(i,3);      % Tykkelse stag [mm]
       b_f = profil(i,4); 
       t_f = profil(i,5);
               
        % Beregner arealer (I-Profil)
        a_f = b_f * t_f;                % Areal flens [mm^2] 
        a_s = (h - 2*b_f) * t_s;         % Arealet av staget [mm^2]
        a_tot = 2*a_f + a_s;            % Totalt tversnittsareal [mm^2]

        % Beregner lokale arealsenter (I-Profil) 
        y_tf = h - (0.5*t_f);  % Lokalt arealsenter bunnflens[mm]
        y_bf = 0.5*t_f;        % Lokalt arealsenter toppflens[mm]
        y_s = 0.5*h;           % Lokalt arealsenter stag[mm]
        y_c = 0.5*h;           % Globalt arealsenter 
        
        % Beregner bidrag fra hver del (I-Profil) 
        A_bf = ((1/12) * (t_f^3 * b_f)) + (y_c - (t_f/2))^2     * a_f;      % bunnflens [mm^4] 
        A_tf = ((1/12) * (t_f^3 * b_f)) + (h - y_c - (t_f/2))^2 * a_f;  % Toppflens [mm^4] 
        A_s  = (1/12)*((h - 2*t_f)^3 * t_s);   % Stag      [mm^4] 
        
        % Totalt 2. Arealmoment (I-Profil)
        I_areal(i,1) = A_tf + A_bf + A_s           % Total 2.Arealmoment I-Profil [mm^4] 
           
        
% RØRTVERSNITT
    elseif(profil(i,1) == 2)
        r = 0.5*profil(i,2);                        % radius [mm]
        t = profil(i,3);                            % Tykkelse [mm]
        I_areal(i,1) = ((pi/4)*(r^4 - (r-t)^4))    % 2. Arealmoment rør.T [mm^4]
                           
% ANNET    
    else
        fprintf('Error: Ugyldig tversnittsnummer'); % Melding til bruker
        I_areal = 0; 
    end
end

fprintf('2.arealmoment beregnet for alle profiltyper\n\n'); % Melding til bruker
end

