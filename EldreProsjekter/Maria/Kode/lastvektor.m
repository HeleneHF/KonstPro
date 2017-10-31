function [b] = lastvektor(fim,npunkt,nelem,elem,nlast,last)
%{
LASTVEKTOR: Beregner momentene fra lastene og fastinnspenningsmomentet i
hver av knutepunkte.
OUTPUT: vektor, med verdier momentene pga. lasten i hvert knutepunkt
%}

b = zeros(npunkt,1);

for j = 1:nelem      ;       %Går gjennom alle elementene
    
    b(elem(j,1),1) = b(elem(j,1),1)-fim(j,1);     %Legger sammen fastinnspenningsmomentetene i knutepunktet
    b(elem(j,2),1) = b(elem(j,2),1)-fim(j,2); 
        
end

for k = 1:nlast                   % Går igjennom lastmatrisen
   if last(k,1) == 4              % Finner hvilke knutepunkter hvor det virker moment
      knp = last(k,2);            % Knutepunkt
      strl = last(k,4);           % Størrelse moment i knutepunkt i [kNm]
      b(knp,1) = b(knp,1)+strl;   % Legger til ev. ytre moment som virker i knutepunkter
   end
end

end