function S = endeM(npunkt,punkt,nelem,elem,rot,fim,elemStiv)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Titel:    Endemoment                                                    %
%Funksjon:                                                               %
%Oppdatert: 2017-11-02                                                   %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

S = zeros(nelem,2); 
momentRotasjon1 = zeros(nelem,2);

const = [4 2 ; 2 4]; 

for i = 1:nelem
    KPkt1 = elem(i,1); 
    KPkt2 = elem(i,2); 
   
    %k_i = const*elemStiv(i); % [Nmm]
    rot1 = rot(KPkt1); 
    rot2 = rot(KPkt2); 
    %R = [rot1; rot2]; 
    
    %S_i_bar_1 = fim(i,1); 
    %S_i_bar_2 = fim(i,2); 

    %S_i_bar = [S_i_bar_1; S_i_bar_2]    
    %elemStiv(i)
    momentRotasjon1(i,:) = elemStiv(i)*[4*rot1 + 2*rot2; 
                                    2*rot1 + 4*rot2];
    %momentRotasjon2 = k_i*R                             
    S(i,:) = fim(i,:) + momentRotasjon1(i,:);  
    %S(i,:) = momentRotasjon1 + S_i_bar;
    %fim(i,:)
end

fprintf('Endemomenter regnet ut.\n'); % Melding til bruker

end

%     % S(i,:) = fim(i,:) + momentRotasjon(i,:);
%     % S_i = k_i*v_i + S_i_bar; % [Nmm]
%     % S(i,1:2) = S_i;          % [Nmm]  
%     % v_i = [v_i_1; v_i_2]
%     % S_i_bar = [fim(i,1); fim(i,2)]; % [Nmm]

%% Old Mari
% function [endemoment, moment_rotasjon] = endeM(nelem, elem,...
%     bjelkestivhet, rot, fim)
% 
% endemoment = zeros(nelem,2);%Totale enemoment
% moment_rotasjon = zeros(nelem,2);%Bjelkeendemoment skapt av rotasjon
%     %Skal brukes i beregning av skjear kraft
%     bjelkestivhet2 = zeros(nelem+1,1); 
%     bjelkestivhet2(1:2,:) = bjelkestivhet(:,:)*10^(-3);
%     
% for i = 1:nelem
%     
%     %Henter ut knutepunktnummer for element
%     punkt1 = elem(i,1);
%     punkt2 = elem(i,2);
%     
%     %Henter ut rotasjon
%     vinkel1 = rot(punkt1);
%     vinkel2 = rot(punkt2);
%     %bjelkestivhet(i) = bjelkestivhet(i)*10^(-3)
%     %Beregner belkeendemoment fra rotasjoner
%     bjelkestivhet2(i)
%     moment_rotasjon(i,:) = bjelkestivhet2(i) *...
%         [4 * vinkel1 + 2 * vinkel2, 2 * vinkel1 + 4 * vinkel2]
% 
%     %Bjelkeendemomentene fra rotasjoner settes i matrise, sammen med
%     %fastinnspenningsmomentene
%     endemoment(i,:) = fim(i,:)*10^(-3) + moment_rotasjon(i,:);
% end
% end
