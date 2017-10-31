function [fim,endemomentpunktlast,endemomentfordeltlast]=momentet1(npunkt,punkt,nelem,elem,npunktlast,punktlast,elementlengder, nfordeltlast, fordeltlast)

fim=zeros(nelem,2);
endemomentpunktlast=zeros(nelem,2);
for i=1:npunktlast
    %%henter info om last fra punktlastvektoren
    k=round(punktlast(1,i));
   lengde=elementlengder(k);
    %henter ut avstand a og b
    avstandA=punktlast(3,i);
    avstandB=lengde-avstandA;
    
    
    %henter størrelsen på kraften i kN
    kraft=punktlast(2,i);
   
    %henter hvilket element kraften virker på
    element=punktlast(1,i);
    
    %hentervinkel fra vertikalen på kraften 
    vinkel=punktlast(4,i);
    
    %beregner momentet i lokal ende 1
    moment1=-kraft*cos(vinkel*pi/180)*avstandA*avstandB*avstandB/(lengde^2);
    
    %beregner momentet i lokal ende 2
    moment2=kraft*cos(vinkel*pi/180)*avstandA*avstandA*avstandB/(lengde^2);
   
    %beregner fastinnspenningsmomentet for punktlast P i lokal ende 1 og 2
    fim(element,1)=moment1+fim(element,1);
    fim(element,2)=moment2+fim(element,2);
    endemomentpunktlast(element,1)=moment1+endemomentpunktlast(element,1);
    endemomentpunktlast(element,2)=moment2+endemomentpunktlast(element,2);
end
endemomentfordeltlast=zeros(nelem,2);

for i=1:nfordeltlast
    
    
    %henter ut info om fordelt last
    element=fordeltlast(5,i);
    q1=fordeltlast(1,i);
    q2=fordeltlast(2,i);
    lengde=elementlengder(element);
    
    %beregner moment for fordelt last i ende 1
    momentq1=-q1*lengde*lengde/20-q2*lengde*lengde/30;
     %beregner moment for fordelt last i ende 2
    momentq2=q2*lengde*lengde/20+q1*lengde*lengde/30;
    
    fim(element,1)=momentq1+fim(element,1);
    fim(element,2)=momentq2+fim(element,2);
    endemomentfordeltlast(element,1)=endemomentfordeltlast(element,1)+momentq1;
    endemomentfordeltlast(element,2)=endemomentfordeltlast(element,2)+momentq2;
end
end

    