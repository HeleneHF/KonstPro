function [npunkt, punkt, nelem, elem, npunktlast, punktlast, nfordeltlast, fordeltlast, n_ytremoment, ytremoment,I_profil,nprofil]=lesinput()


%       %i = heltall (integer)       %f : desimaltall (flyt-tall)


%åpner inputfila
filid = fopen('input2.txt','r');


%Leser hvor mange punkt det er
npunkt = fscanf(filid,'%i',[1 1]);
sizeA=[3,npunkt];

% LESER INN XY-KOORDINATER TIL KNUTEPUNKTENE
% Nodenummer tilsvarer radnummer i "Node-variabel"
% x-koordinat lagres i første kolonne, y-koordinat i 2.kolonne
% Grensebetingelse lagres i kolonne 3, fast innspent=1 og fri rotasjon=0
punkt = fscanf(filid,'%i %i %i',sizeA);


%Leser hvor mange element det er
nelem = fscanf(filid,'%i',[1 1]);


%Leser konnektivitet: sammenheng elementender og knutepunktnummer. Og EI for elementene
% Elementnummer tilsvarer radnummer i "Elem-variabel"
% Knutepunktnummer for lokal ende 1 lagres i kolonne 1
% Knutepunktnummer for lokal ende 2 lagres i kolonne 2
% E-modul for materiale lagres i kolonne 3
% Tverrsnittstype lagres i kolonne 4, I-profil=1 og rørprofil=2  
elem = fscanf(filid,'%i %i %f %i',[4,nelem]);


%Les hvor mange laster som virker. 
npunktlast = fscanf(filid,'%i',[1 1]);


%Leser informasjon om punktlast.
punktlast=fscanf(filid,'%f %f %f %f',[4 npunktlast]);

%Leser antall fordelte laster 
nfordeltlast=fscanf(filid,'%i',[1 1]);

%Leser størrelse og beligenhet på fordelte laster.
fordeltlast=fscanf(filid,'%f %f %f %f %f',[5 nfordeltlast]);

%Leser antall ytre påførte moment. 
n_ytremoment=fscanf(filid,'%i',[1 1]);

%Leser størrelse og beligenhet ytre moment. 
ytremoment=fscanf(filid,'%g %f %f %f',[2 n_ytremoment]);

%Leser antall typer tverrsnittsprofiler. 
nprofil=fscanf(filid, '%i',[1 1]);

%Leser informasjon om tverrsnittene. 
I_profil=fscanf(filid,'%g %f %f %f %f',[5,nprofil]);
% LUKKER INPUT-FILEN
fclose(filid);



end
