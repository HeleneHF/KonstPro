% Sletter alle variabler
clear all
format SHORTENG %Short engineering

% -----Leser input-data-----
[npunkt, punkt, nelem, elem, last_punkt, last_moment, last_fordelt,...
    nlast_punkt, nlast_fordelt, nmoment, nprofil, profil] = lesinput();

% -----Regner lengder til elementene-----
elementlengder = lengder(punkt,elem,nelem);

%regner ut mellomamplituder paa de lastene som gaar over flere
%elementer
q_amplituder = q_elementer(nelem, elementlengder, last_fordelt,...
    nlast_fordelt);

%----Regner ut fast innspenningsmomenter----
fim = fast_innspent(last_fordelt, nlast_fordelt, nelem, elementlengder,...
    nlast_punkt, last_punkt, q_amplituder);

%Sorterer ytre moment etter knutepunkt
moment_ytre = moment_ytremoment(npunkt, nmoment, last_moment);


% ------Oppretter lastvektor----------
b = lastvektor(fim, moment_ytre, nelem, npunkt, elem);


% ------Setter opp vektor for elementenes EI/L, I og Y----
    %Y er tverrsnittenes lengste avstan til arealsenter
[bjelkestivhet, I, Y] = stivhet_vektor(elem, elementlengder, nelem,...
    npunkt, profil);


% ------Setter opp systemstivhetsmatrisen-------
K = stivhetsmatrise(bjelkestivhet, elem, npunkt, nelem);

% ------Innfoerer randbetingelser-------
[Kn, Bn] = bc(npunkt, punkt, K, b);
     

% -----Loser ligningssytemet -------
rot = Kn\Bn;


% -----Finner endemoment for hvert element -------
[endemoment, moment_rotasjon] = endeM(nelem, elem, bjelkestivhet, rot, fim);


% %Regner ut momenter paa 'midten' av bjelker med fordelt last og under
% %punktlast naar det er tilfellet.
% moment_midt = beregn_midtmoment(endemoment, nelem, nlast_fordelt,...
%     last_fordelt, q_amplituder, elementlengder, nlast_punkt, last_punkt);
% 
% %Regner ut maks boyespenning for endemomenter og midtmoment
% spenning = boyespenning(endemoment, nelem, I, moment_midt, Y);
% 
% 
% %Henter ut det maksimale momentet og hvilket element det befinner seg paa.
% %Dette er en viktig storrelse da den er dimmensjonerende
% [maxmomentvec, plasseringer] = max(abs(spenning));
% [maxmoment, id] = max(maxmomentvec);
% max_elem_nummer = plasseringer(id);
% 
% 
% %Regner ut skjaerkraft for hver ende elementvis
% skjarkrafter = skjaer(nelem, moment_rotasjon,elementlengder...
%     ,nlast_punkt,last_punkt,nlast_fordelt,last_fordelt,q_amplituder...
%     );
% 
% 
% % %Skriver ut resulatatene til filen rusultat.txt
% filid1=fopen('resultat.txt','w');
% 
% fprintf(filid1,'----< RESULTATER >----\n\n');
% fprintf(filid1,...
%     'Maksimal boyespenning: %6.3f[MPa]\nPaa elementnummer: %i\n\n',...
%     maxmoment*10^-6,max_elem_nummer);
% 
% for i = 1:nelem
%     
%     %Moment paa midten som ikke har ytre last er ikke 0, men ikke
%     %dimmensjonerende. De skrives de ut som 'ikke dimmensjonerende'
%     if moment_midt(i,1) == 0
%     dimmensjon_sp = 'Ikke dimmensjonerende';
%     dimmensjon_M = 'Ikke dimmensjonerende';
%     else
%     dimmensjon_sp = num2str(spenning(i,3) * 10^-6);
%     dimmensjon_M = num2str(moment_midt(i,1) * 10^-3);
%     end
%     
% fprintf(filid1,....
%     ['Element %i\n\n Momenter\n Ende 1: %6.3f[kNM]\n Ende 2:'...
%     ' %6.3f[kNM]\n Midten: %s[kNM]\n Boyespenning\n Ende 1:'...
%     ' %6.3f[MPA]\n Ende 2: %6.3f[MPA]\n Midten: %s[MPA]'...
%     '\nSkjaerkraft\n Ende 1: %6.3f[kN]\n Ende 2:'...
%     ' %6.3f[kN]\n\n'],i,...
%     endemoment(i,:) * 10^-3, dimmensjon_M,...
%     spenning(i,1:2) * 10^-6, dimmensjon_sp, skjarkrafter(i,:)*10^-3);
% end
% disp('Resultater ligger i tekstdokumentet resultat.txt')