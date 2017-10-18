function [I_areal] = I_areal(nTver,profil)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Titel:    andreArealmoment                                              %
% Funksjon: Leser inn tversnittsdata og regner ut 2.arealmoment for dem   %
% Oppdatert: 2017-10-17                                                   %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% AaMoment: [nTver x 1]-matrise, inneholder 2. arealmoment for alle 
%           tversnittene som er lest inn fra inputfilen     

fprintf('Beregner annet arealmoment for tversnittene...\n')

for i = 1: nTver
    % I-PROFIL
    if(profil(i,1) == 1) 
        % Henter informasjon (I-Profil)
            h  = profil(i,2);   % Tversnittshøyde
            b_bf = profil(i,3); % Bredde brunnflens
            b_tf = profil(i,4); % Bredde toppflens
            t_s = profil(i,5);  % Tykkelse stag
            t_bf = profil(i,6); % Tykkelse bunnflens
            t_tf = profil(i,7); % Tykkelse toppflens
        
        % Beregner arealer (I-Profil)
            a_bf = b_bf * t_bf; % Areal bunnflens 
            a_tf = b_tf * t_tf; % Areal toppflens
            a_s = (h - b_bf - b_tf) * t_s;  % Arealet av staget
            a_tot = a_bf + a_tf + a_s;      % Totalt tversnittsareal 

        % Beregner lokale arealsenter (I-Profil) 
            y_tf = h - (t_tf/2);
            y_bf = t_bf/2; 
            y_s = h/2; 

        % Beregner globalt arealsenter (I-Profil)
            if ((t_bf ~= t_tf) || (b_bf ~= b_tf))
                y_c = (1/a_tot) * ((a_tf * y_ts) + (a_ts * y_ts)+ .... 
                        (a_s * y_s));
                    
                    if (y_c >= (h - y_c))
                        y_global = y_c;
                    else
                        y_global = h - y_c; % USIKKER PÅ HVA JEG SKAL MED DEG
                    end
                    
            elseif (((t_bf == t_tf) && (b_bf == b_tf)))
                y_c = h/2; 
                y_global = y_c;             % USIKKER PÅ HBA JEG SKAL MED DEG
            else
               fprintf('Error');            % FYLL PÅ EN FORNUFTIG FEILMELDING HER
            end
        
        % Beregner bidrag fra hver del (I-Profil) 
        A_bf = ((1/12) * (t_bf^3 * b_bf)) + (y_c - (t_bf/2))^2 * a_bf;
        A_tf = ((1/12) * (t_tf^3 * b_tf)) + (h - y_c - (t_tf/2))^2 * a_tf; 
        A_s = (1/12)*((h - t_tf - t_bf)^3 * t_s) + (y_s - y_c)^2* a_s;  
        
        % Totalt 2. Arealmoment (I-Profil)
        I_areal(i,1) = A_tf + A_bf + A_s;   % Total 2.Arealmoment I-Profil
           
    % RØRTVERSNITT
    elseif(profil(i,1) == 2)
        D = profil(i,2);        % Ytre diameter 
        t = profil(i,3);        % Tykkelse
        I_areal(i,1) = (pi/64) * (D^4 - (D-t)^4); % 2. Arealmoment rør.T
        
    % ANNET    
    else
        fprintf('Error: Ugyldig tversnittsnummer')
        I_areal = 0; 
    end
end

fprintf('Annet arealmoment beregnet for alle profiltyper\n\n')
end

