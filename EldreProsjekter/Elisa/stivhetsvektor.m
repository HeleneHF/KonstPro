function stivhetsvektor=stivhetsvektor(nelem,elem,elementlengder,I_profil,arealmoment)
stivhetsvektor=zeros(nelem,1);
for i=1:nelem
    
    %Henter ut elastitetsmodulen tverrsnittstype annetarealmoment og lengde for aktuelt element. 
    E_modul=elem(3,i);
    lengde=elementlengder(i);
    tverrsnittstype=elem(4,i);
    I=arealmoment(tverrsnittstype);
    
    %Beregner stivheten ved formel EI/L. I inputfilen er e-modul gitt i
    %GPa.
    stivhetsvektor(i)=1000000000*E_modul*I/lengde;
end
end