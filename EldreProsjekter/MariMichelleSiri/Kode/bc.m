function [Kn Bn] = bc(npunkt, punkt, K, b)
Kn=K;
Bn=b;

%Sjekker alle knutepunkt om de er fast opplagret.
for i=1:npunkt
    %Er fast opplagret dersom punkt(i,3)=1
    if punkt(i,3)==1
        %Nuller ut rad og kollone i Kn og Bn for knutepunkter som er 
        %fast opplagret
        Kn(:,i) = zeros(npunkt,1);
        Kn(i,:) = zeros(1,npunkt);
        Kn(i,i) = 1; %Diagonalelement settes lik 1
        Bn(i) = 0;              
    end
end
end