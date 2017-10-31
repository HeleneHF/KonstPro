function endemoment=endeM(npunkt,punkt,nelem,elem,elementlengder,rot,fim,stivhetsvektor)
endemoment=zeros(nelem,2);


for i=1:nelem
    
    %Henter globalt punktfor element i
    punkt1=elem(1,i);
    punkt2=elem(2,i);
    
    %Henter rotasjon for lokalt punkt 1 og 2
    rotasjon1=rot(punkt1);
    rotasjon2=rot(punkt2);
    %Endemoment for element i ende 1
    endemoment(i,1)=fim(i,1)+(4*rotasjon1+2*rotasjon2)*stivhetsvektor(i);
    
    %Endemoment for element i ende 2
    endemoment(i,2)=fim(i,2)+(2*rotasjon1+4*rotasjon2)*stivhetsvektor(i);
end
end

