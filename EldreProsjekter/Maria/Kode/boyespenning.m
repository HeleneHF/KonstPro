function [spenning] = boyespenning(I_elem,elem,nelem,profil,endemoment,midtmom )
%{
BOYESPENNING: Regner ut bøyespenningene for elementene, 
gitt i [kN/m^2] = [kPa].
%}
spenning=zeros(nelem,3);

for i=1:nelem
    if elem(i,4)==1
        I=I_elem(i);
        Y=(profil(1,3))/2;
        M1=endemoment(i,1);     % Finner endemomentet i ende 1
        M2=endemoment(i,2);     % Finner endemomentet i ende 2
        M3=midtmom(i,1);        % Finner midtmomentet
        
        % Regner ut bøyespenningene
        Spenning1=(M1*Y)/I; 
        Spenning2=(M2*Y)/I;
        Spenning3=(M3*Y)/I;
        
    % Plasserer bøyespenningene på rett sted
    spenning(i,1)=Spenning1;
    spenning(i,2)=Spenning2;
    spenning(i,3)=Spenning3;
    
    else
        I=I_elem(i);
        Y=(profil(2,2))/2; 
        M1=endemoment(i,1);     % Finner endemomentet i ende 1
        M2=endemoment(i,2);     % Finner endemomentet i ende 2
        M3=midtmom(i,1);        % Finner midtmoment
            
        % Regner ut bøyespenningene
        Spenning1=(M1*Y)/I;
        Spenning2=(M2*Y)/I;
        Spenning3=(M3*Y)/I;
    
     % Plasserer bøyespenningene på rett sted
    spenning(i,1)=Spenning1;
    spenning(i,2)=Spenning2;
    spenning(i,3)=Spenning3;
    end
end
end

