function b=lastvektor(fim,npunkt,punkt,nelem,elem,ytre_momentvektor)
b=zeros(npunkt,1);

%Trekker fastinnspenning for hvert punkt fra ytre momentvektor.
for i=1:nelem
    knutepunkt1=elem(1,i);
    knutepunkt2=elem(2,i);
  b(knutepunkt1)=b(knutepunkt1)-fim(i,1);
  b(knutepunkt2)=b(knutepunkt2)-fim(i,2);
end

b=b+ytre_momentvektor;

end

    
    