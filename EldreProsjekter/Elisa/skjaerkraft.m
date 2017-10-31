function skjaer=skjaerkraft(nelem,fordeltlast,elementlengder,endemoment,nfordeltlast,punktlast,npunktlast)

skjaer=zeros(nelem,2);


%Beregner skjærkraft på grunn av fordelt last
for i=1:nfordeltlast
    element=fordeltlast(5,i);
    
   
    
    skjaer(element,1)=(endemoment(element,1)+endemoment(element,2)-fordeltlast(1,i)*elementlengder(element)*elementlengder(element)/3-...
        fordeltlast(2,i)*elementlengder(element)*elementlengder(element)/6)/elementlengder(element);
    
    
    skjaer(element,2)=(endemoment(element,1)+endemoment(element,2)+fordeltlast(1,i)*elementlengder(element)*elementlengder(element)/6+...
        fordeltlast(2,i)*elementlengder(element)*elementlengder(element)/3)/elementlengder(element);
 
end

%Beregner skjærkraft på grunn av punktlast. 
for i=1:npunktlast
element=punktlast(1,i);
lengde=elementlengder(element);
arm=lengde-punktlast(3,i);
if punktlast(3,i)==0
    arm=0;
else
end

skjaer(element,1)=(endemoment(element,1)+endemoment(element,2)-punktlast(2,i)*cos(punktlast(4,i)*pi/180)*(arm))/lengde;
skjaer(element,2)=(endemoment(element,1)+endemoment(element,2)+punktlast(2,i)*cos(punktlast(4,i)*pi/180)*punktlast(3,i))/lengde;

end

%Beregner skjærkraft i ubelastede elementer. 
for i=1:nelem
    if skjaer(i,1)==0 || skjaer(i,2)==0
        skjaer(i,2)=(endemoment(i,1)+endemoment(i,2))/elementlengder(i);
        skjaer(i,1)=(endemoment(i,2)+endemoment(i,1))/elementlengder(i);
    else
    end
end
end

    

