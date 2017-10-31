function [V] = skjearkrefter(nelem,elemlengder, nlast, last,endemoment)
%{
Denne funksjonen finner skj�rkreftene til bjelkene ut i fra momentene. 
Skrives ut som en matrise med to kolonner og like mange rader som det er
elementer
%}
V = zeros(nelem, 2);    % Danner matrise med nuller

for i = 1:nelem             % G�r gjennom alle elementene
    M1 = endemoment(i,1);   % Finner endemomentet i lokal ende 1
    M2 = endemoment(i,2);   % Finner endemomentet i lokal ende 2
    L = elemlengder(i);     % Finner lengden til bjelken
    skjearende = (M1 + M2) / L; % Finner endemomentene sitt bidrag til skj�rkraften
    V1 = skjearende;        % Setter skj�r i ende 1 lik endebidraget
    V2 = skjearende;        % Setter skj�r i ende 2 lik endebidraget
    
    for j = 1:nlast         % G�r gjennom lastene
        if last(j,2) == i   % Sjekker om lasten virker p� det aktuelle elementet
        if last(j,1) == 1   % Sjekker om laster en punktlast
            if last(j,3) > 0% Tar ikke med laster som virker i knutepunkt
            
            F = last(j,4) * cos(last(j,5)); % Finner lastens kraft
            avstand1 = last(j,3) * L;       % Finner avstand til lokal ende 1
            avstand2 = L - avstand1;        % Finner avstand til lokal ende 2
            V1 = -V1 + (F * avstand2) / L;  % Legger til skj�rkraften
            V2 = -V2 - (F * avstand1) / L;  % Legger til skj�rkraften
            end
            
        elseif last(j,1) == 2   % Sjekker om det er jevnt fordelt last
            
            A = (last(j,4) * L) / 2;% Finner opplager 1
            B = A;                  % Finner opplager 2
            skjear1 = - A;          % Finner skj�rkraft 1
            skjear2 = B;            % Finner skj�rkraft 2
            
            V1 = V1 - skjear1; % Legger kreftene til p� rett sted
            V2 = V2 - skjear2;
             
        elseif last(j,1) == 3   % Sjekker om det er line�rt fordelt last
          
            if last(j,3) == 1   % Sjekker om den virker i lokal ende 1
                A = (last(j,4) * L) / 3;        % Regner ut opplager 1
                B = ((last(j,4) * L) / 2) - A;  % Regner ut opplager 2
                skjear1 = - (((last(j,4) * L) / 2) - B);    % Finner skj�rkraft1
                skjear2 = B;                    % Finner skj�rkraft2
            elseif last(j,3) == 2               % Sjekker om den virker i lokal ende 2
                B = (last(j,4) * L) / 3;        % Finner opplager 2
                A = ((last(j,4) * L) / 2) - B;  % Finner opplager 1
                skjear2 = (((last(j,4) * L) / 2) - A);  % Finner skj�rkraft 2
                skjear1 = - A;   % Finner skj�rkraft 1
            end
            
            V1 = V1 + skjear1;  % Legger til kreftene p� rett sted
            V2 = V2 + skjear2;
        end
        end
            V(i,1) = - V1;   % Plasserer kreftene p� rett plass i matrisen
            V(i,2) = - V2;
            
    end 

end

