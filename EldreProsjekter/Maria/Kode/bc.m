function [Kn, Bn] = bc_final (npunkt, punkt, K, b)
%{
BC:Innf�rer grensebetingelser for knutepunktsrotasjonene. Tar utgangspunkt
i systemstivhetsmatrisen og lastvektoren, og "nuller ut" det som ikke skal
med pga. grensebetingelser
%}

Kn = K; % Setter Kn lik systemstivhetsmatrisen
Bn = b; % Setter Bn lik lastvektoren

randbetingelse = (punkt(:,3)); % Henter ut informasjon om fast innspent eller rotasjonsfri

for i = 1:npunkt
    if randbetingelse(i) == 1 % Hvis det er fast innspent
        Kn(:,i) = 0;    % Nuller ut radene, slik spesifisert i oppgave
        Kn(i,:) = 0;    % Nuller ogs� ut kolonnene
        Kn(i,i) = 1;    % Setter diagonalelementet lik et vilk�rlig tall
        Bn(i) = 0;      % Lastvektoren m� ogs� nulles ut her, for dette knutepuntket
    end
end

end

