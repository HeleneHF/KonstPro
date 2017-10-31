function [fim] = fastmoment(nelem, nlast,last, lengder)
%{
FASTMOMENT:
OUTPUT: nelem x 2 - matrise med verdien til fastinnspenningesmomentet til
hvert element i hver ende. Element 3 fastinnspenningsmoment i ende 2 finner
man f.eks i (3,2)
%}

fim = zeros(nelem,2);   %Danner matrise med nuller med nelem rader og 2 kolonner(da vi har to ender)

for i = 1:nlast
    if last(i,1) == 1   %Vil si at det er punktlast
        storrelse = last(i,4) * cos(last(i,5));     %Finner lastens størrelse
                        %i [kN], vinkel i radianer
        L = lengder(last(i,2));     %Finner lengden på elementet i [m]
        Avstand1 = last(i,3) * L ;  %Finner avstand fra lokal ende 1 i [m]
        Avstand2 = L - Avstand1 ;   %Finner avstand fra lokal ende 2 i [m]
        M1 = -(storrelse * Avstand1 * (Avstand2)^2)/(L^2);  %Bruker formel hentet fra kompendiet
        M2 = (storrelse * Avstand2 * (Avstand1)^2)/(L^2);
       
        fim(last(i,2),1) = fim(last(i,2),1) + M1;  %Plasserer momentene på rett plass
        fim(last(i,2),2) = fim(last(i,2),2) + M2;
        
    elseif last(i,1) == 2       %Vil si at det er jevnt fordelt last
        storrelse = last(i,4);  %Finner lastens størrelse i [kN/m]
        L = lengder(last(i,2)); %Finner elementets lengde
        M1 = -((1/12)*storrelse*(L^2)); %Her er formel fra tabell 8.3 i kompendiet brukt
        M2 = -M1;
        fim(last(i,2),1) = fim(last(i,2),1)+M1;     %Plasserer momentene på rett plass
        fim(last(i,2),2) = fim(last(i,2),2)+M2;
        
    elseif last(i,1) == 3       %Vil si at det er lineært fordelt last
        storrelse = last(i,4);  %Lasten størrelse i [kN/m]
        L = lengder(last(i,2));
        M1 = -(1/30) * (L^2) * storrelse;
        M2 = (1/20) * (L^2) * storrelse;
        if last(i,3) == 1
            fim(last(i,2),1) = fim(last(i,2),1) - M2;
            fim(last(i,2),2) = fim(last(i,2),2) - M1;
            
        else fim(last(i,2),1) = fim(last(i,2),1) + M1;
            fim(last(i,2),2) = fim(last(i,2),2) + M2;
        end
    end
end
        
end

