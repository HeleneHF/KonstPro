
%{
RAMMEANALYSE: Analyserer en konstruksjon med gitte profiler og laster ved 
hjelp av en rekke underfunksjoner. Skriver ut rotasjonene i knutepunkene
og endemomentene i knutepunkene til konstruksjonen

%}

% Sletter alle variabler
clear all


% -----Leser input-data-----
[npunkt, punkt, nelem, elem, nprofil, profil, nlast, last] = lesinput();


% -----Regner lengder til elementene i [m]-----
[elemlengder] = lengder(punkt,elem,nelem);


% -----Regner ut annet areamlmoment for hvert element i [m^4] -----
[I_elem] = annet_arealmoment(nelem, elem, profil,nprofil );


% -----Regner stivhet til alle elementene i [kN * m]-----
[stivhet] = boyestivhet(nelem, elemlengder, elem, I_elem);



% ------Fastinnspenningsmomentene i [kNm]------
[fim] = fastmoment(nelem,nlast,last,elemlengder);


% ------Setter opp lastvektor i [kNm]-------
[b] = lastvektor(fim,npunkt,nelem,elem,nlast,last);


% ------Setter opp systemstivhetsmatrisen i [kNm]-------
[K] = Systemstivhetsmatrise(nelem,elem,stivhet,npunkt);


% ------Innfoerer randbetingelser-------
[Kn, Bn] = bc(npunkt, punkt, K, b);
     

% -----Løser ligningssytemet-------
rot = Kn \ Bn ;


% -----Finner endemoment for hvert element [kNm] -------
[endemoment] = endeM(nelem,elem,rot,fim,stivhet);

% -----Finner midtmoment/største moment for hvert element [kNm] -----
[midtmom] = midtmoment(endemoment,nlast,last,nelem,elemlengder);

% -----Finner bøyespenningpå utsatte steder [kN/m^2]=[kPa]-----
[spenning] = boyespenning(I_elem,elem,nelem,profil,endemoment,midtmom );


%-----Skriver ut rotasjene i de forskjellige punktene og endemomentene for
%elementene -----
output(rot,npunkt,endemoment,nelem)