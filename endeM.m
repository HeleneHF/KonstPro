function S = endeM(npunkt,punkt,nelem,elem,rot,fim,EI_L)
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% %Titel:    endeM                                                         %
% %Funksjon: Regner ut endemomentet på alle bjelkene ved å regne momentet  %
% %          som følge av rotasjonen og legge til fastinnspenningsmomente  %
% %Oppdatert: 2017-11-05                                                   %
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

S = zeros(nelem,2); 
momentRotasjon1 = zeros(nelem,2);

for i = 1:nelem
    KPkt1 = elem(i,1); 
    KPkt2 = elem(i,2); 
   
    rot1 = rot(KPkt1); 
    rot2 = rot(KPkt2); 
    
    momentRotasjon1(i,:) = EI_L(i)*[4*rot1 + 2*rot2; 
                                    2*rot1 + 4*rot2];
    S(i,:) = momentRotasjon1(i,:) + fim(i,:);   

end

fprintf('Endemomenter regnet ut.\n'); % Melding til bruker

end

