function endemoment = endeM(nelem,elem,rot,fim,stivhet)
%{
ENDEM: Regner ut endemomentet

%}

k = [4 2; 2 4];
endemoment = zeros(nelem,2); % Danner matrise med nuller

for i = 1:nelem
R = [rot(elem(i,1));rot(elem(i,2))];
% Danner en rotasjonsmatrise ut i fra rotasjonene til hvert knutepunkt

K1 = (stivhet(i)) * k;      % Gir oss stivhetsmatrise

mom = [fim(i,1);fim(i,2)];  % Gir oss fastinnspentmomentmatrise
EM = (K1*R) + mom;          % Ganger stivhetsmatrise med rotasjonsmatrisen og plusser på tall fra FIMmatrise
% Dette gir oss da summen av endemomentene i den lokale enden på elementet

endemoment(i,1) = EM(1);    % Her plasseres endemomentene på rett plass i endemomentmatrisen
endemoment(i,2) = EM(2);
end
end

