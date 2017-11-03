function [stivhet, I, Y] = stivhet_vektor(elem, elementlengder, nelem,...
    npunkt, profil)
%Regner ut stivheten (EI/L), I, Y for hvert element
%I er annet arealmoment
%Y er lengste avsttand til arealsenteret i et tverrsnitt
%I og Y skal brukes senere i koden og er derfor gunstige aa hente ut

stivhet=zeros(npunkt,1);%EI/L skal lagres her
I = zeros(nelem,1);
Y = zeros(nelem,1);

for i = 1:nelem
    %E-modul
    E = elem(i,3) * 10^9;
    %Lengde element
    L = elementlengder(i,1);
    %Tverrsnittstype
    tverr_type = elem(i,4);
    if profil(tverr_type,1) == 0%hvis det er et rorprofil:
        %Henter I og Y fra funksjon
        [I(i), Y(i)] = annetarealmoment_ror(profil(tverr_type, 2),...
            profil(tverr_type,3));
    else%hvis det er I-profil:
        %Henter annet arealmoment og Y fra funksjon
        [I(i), Y(i)] = annetarealmoment_iprofil(profil(tverr_type, 2),...
            profil(tverr_type,3),profil(tverr_type,4),...
            profil(tverr_type,5),profil(tverr_type,6),...
            profil(tverr_type,7));
    end
    %Regner ut og lagrer stivhet i vektor
    stivhet(i,1) = E*I(i)/L;
end
end