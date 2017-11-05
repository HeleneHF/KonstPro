function S = endeM(npunkt,punkt,nelem,elem,rot,fim,EI_L)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Titel:    endeM                                                         %
%Funksjon: Regner ut endemomentet p� alle bjelkene ved � regne momentet  %
%          som f�lge av rotasjonen og legge til fastinnspenningsmomente  %
%Oppdatert: 2017-11-05                                                   %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
S = zeros(2,1);  

for i = 1:nelem
    KPkt1 = elem(i,1);      
    KPkt2 = elem(i,2); 
    
    v = [rot(KPkt1); rot(KPkt2)];   % Rotasjonene p� dette elementet
    k = EI_L(i)*[4 2; 2 4];         % lokal stivhetsmatrise
    rot_ledd = k*v;                 % Momentbidraget fra rotasjonene
    S_bar = [fim(i,1); fim(i,2)];   % Fastinnspenningsmomentene
    S_i = rot_ledd + S_bar;
    
    S(i,1) = S_i(1,1); 
    S(i,2) = S_i(2,1);  
end

    