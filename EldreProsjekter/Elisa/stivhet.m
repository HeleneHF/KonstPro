function K=stivhet(nelem,elem,elementlengder,npunkt,I_profil,stivhetsvek)
%lager ferdig vektor npunktXnpunkt stor.
K=zeros(npunkt,npunkt);

for i=1:nelem
    punkt1=elem(1,i);
    punkt2=elem(2,i);
    tverrsnitt=elem(4,i);
    
    %henter tversnittsdata E-modul og lengde av element i
    I=I_profil(2,elem(4,i));
    E_modul=elem(3,i);
    lengde=elementlengder(i);
    
    %Beregner stivhet til element i ved formel EI/L
   
    
    %Legger elementene i den lokale stivhetsmatrisen i den globale
    %stivhetsmatrisen. 
    K(punkt1,punkt1)=K(punkt1,punkt1)+4*stivhetsvek(i);
    K(punkt1,punkt2)=K(punkt1,punkt2)+2*stivhetsvek(i);
    
    K(punkt2,punkt1)=K(punkt2,punkt1)+2*stivhetsvek(i);
    K(punkt2,punkt2)=K(punkt2,punkt2)+4*stivhetsvek(i);
    
    
end
end
