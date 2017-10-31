function [midtmom] = midtmoment(endemoment,nlast,last,nelem,elemlengder)
%{
MIDTMOMENT: Her finner vi momentet under punktlastene, momentet midt p� bjelker med
jevnt fordelt last, samt st�rste moment p� bjelker med line�rt fordelt
last
%}
midtmom = zeros(nelem,1);   % Danner en matrise med nuller i rett st�rrelse

for i = 1:nlast
    if last(i,1) == 1   % Sjekker om det er punktlast
        if last(i,3) > 0
        element = last(i,2);        % Henter ut hvilket element den virker p�
        L = elemlengder(element);   % Finner elementets lengde
        avstand1 = last(i,3) * L;   % Finner avstanden fra lokal ende 1
        avstand2 = L-avstand1;      % Finner avstanden fra lokal ende 2
        F = (cos(last(i,5))) * last(i,4);   % Finner kraften til lasten
        
        midt1 = (F*avstand1*avstand2) / L;    % Gir oss momentet direkte under den
        %Henter ut momentet underpunktlasten ut i fra endemomentene
        midt2 = ((endemoment(element,1)*avstand2) - (endemoment(element,2)*avstand1)) / L;
        %Finner det totale momentet under lasten og setter det p� rett sted
        midtmom(element,1) = midt1 + midt2 + midtmom(element,1);
            % Merk: Dette er ikke midtmomentet, men momentet under der
            % punktlasten virker, som jo er det relevante � se p�
        end
        
    elseif last(i,1) == 2     % Sjekker om det er jevnt fordelt last
      element=last(i,2);    % Finner elementnummer
        L=elemlengder(element);  % Finner lengde p� elementet
        F=last(i,4);        % Finner kraften til lasten
        
        midt1= ((F*(L^2)) / 8);   % Regner ut midtmoment i henhold til Irgens formler
        
        % Finner midtmoment ut i fra endemomentene
        midt2= ((endemoment(element,1))-(endemoment(element,2))) / 2; 
        
        % Finner totatlt midtmoment og plasserer det p� rett sted
        midtmom(element,1) = midt1 + midt2 + midtmom(element,1);


    elseif last(i,1) == 3  % Sjekker om det er line�rt fordelt last
        element=last(i,2); % Finner elementnummer
        L=elemlengder(element);     % Finner lengde p� elementet
        F=last(i,4);        % Finner lastens kraft
        
        midt1=(F*(L^2)) / (9*sqrt(3));
             % Merk at dette ikke helt er p� midten, men da vi er noe begrenset i
             % v�re midler tok vi formelen ut fra Irgens formelsamling og den
             % oppgir bare momentet p� L/sqrt(3), som jo er NESTEN p� midten
        
        midt2= -(abs(endemoment(element,1))-abs(endemoment(element,2)))/2;
        % Finner midtmomentet ut i fra endemomentene
        
        midtmom(element,1)=midt1 + midt2 + midtmom(element,1);
        % Finner totalt moment og plasserer det p� rett sted
    end
end
end