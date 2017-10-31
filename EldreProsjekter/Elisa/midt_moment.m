function midtmoment=midt_moment(fim,endemomentpunktlast,endemomentfordeltlast...
    ,punktlast,nelem,npunktlast,elementlengder,nfordeltlast,fordeltlast,endemoment)

%lager tom matrise for midtmomentet.
midtmoment=zeros(nelem,1);

for i=1:nfordeltlast
    %henter element og lengde på element
  
    element=fordeltlast(5,i);
    lengde=elementlengder(element);
    %beregner midtmomentet på grunn av fastinnspenningsmomentene
    midtmomentendepunktsmoment=(-endemoment(element,1)+endemoment(element,2))/2;
    
    mU=0;
    mJ=0;
    if fordeltlast(1,i)==fordeltlast(2,i)
        %beregner momentet midt på om lasten er jevnt fordelt
        mJ=-fordeltlast(1,i)*lengde*lengde/8;
    else
        %beregner midtmomentet om lasten er ujevnt fordelt
    mU=((-fordeltlast(1,i)*lengde*lengde)/(9 * sqrt(3))-(fordeltlast(2,i)*lengde*lengde)/(9 * sqrt(3)));
    end
    
    midtmoment(element)=mJ+mU+midtmomentendepunktsmoment+midtmoment(element);
    
end

for i=1:npunktlast
    %henter elementnummer lengde og hvor lasten virker
  element=punktlast(1,i);
  lengde=elementlengder(element);
  lengdeA=punktlast(3,i);
  vinkel=punktlast(4,i);
  kraft=punktlast(2,i)*cos(vinkel*pi/180);

  
  %beregner momentet i det punktet lasten befinner seg
  mP=-kraft*lengdeA*(lengde-lengdeA)/lengde;
  
  %beregner momentet ved lengdeA på grunn av endemoment ved last
  mE = (-endemoment(element,1)*(lengde-lengdeA)+endemoment(element,2)*lengdeA)/lengde;

  midtmoment(element)=mP+mE+midtmoment(element);
end
end

    
    