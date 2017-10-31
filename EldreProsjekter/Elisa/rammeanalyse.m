function rammeanalyse()
% Sletter alle variabler
format shortEng
clear all


% -----Leser input-data-----
[npunkt punkt nelem elem npunktlast punktlast nfordeltlast fordeltlast, n_ytremoment, ytremoment,I_profil,nprofil] = lesinput();


% -----Regner lengder til elementene-----
elementlengder=lengder(punkt,elem,nelem);

%----Regner ut annet arealmoment-------
arealmoment=annetarealmoment(I_profil,nprofil);

% ----Beregner stivheten til element 1 til i---
stivhetsvek=stivhetsvektor(nelem,elem,elementlengder,I_profil,arealmoment);

% ------Beregner fastinnspenningsmomentene for punktlast og fordelt last------
[fim,endemomentpunktlast,endemomentfordeltlast]=momentet1(npunkt,punkt,nelem,elem,npunktlast,punktlast,elementlengder, nfordeltlast, fordeltlast);

% -----Lager en tre momentvektor------
ytre_momentvektor=ytremomentvektor(n_ytremoment,npunkt,ytremoment);

% ------Setter opp lastvektor-------
b=lastvektor(fim,npunkt,punkt,nelem,elem,ytre_momentvektor);


% ------Setter opp systemstivhetsmatrisen-------
K=stivhet(nelem,elem,elementlengder,npunkt,I_profil,stivhetsvek);


% ------Innfoerer randbetingelser-------
[Kn,Bn] = bc(npunkt, punkt, K, b);
     

% -----Løser ligningssytemet -------
rot = Kn\Bn;


% -----Finner endemoment for hvert element -------
endemoment=endeM(npunkt,punkt,nelem,elem,elementlengder,rot,fim,stivhetsvek);

% ---Finner midtmomentet for fordelt last og under punktlast for element i-
midtmoment=midt_moment(fim,endemomentpunktlast,endemomentfordeltlast...
    ,punktlast,nelem,npunktlast,elementlengder,nfordeltlast,fordeltlast,endemoment);

%----Beregner bøyespenning på grunn av moment-----
spenning=boyespenning(endemoment,midtmoment,arealmoment,I_profil,nelem,elem);

format long
%---Beregner spenningenes prosentandel på flytspenning til materialet.---
toleranse=flytspenning(spenning,nelem);

%Beregner skjærkraft for hvert enkelt element
skjaer=skjaerkraft(nelem,fordeltlast,elementlengder,endemoment,nfordeltlast,punktlast,npunktlast);

% ----Skriver ut hva rotasjonen ble i de forskjellige nodene-------
disp('Rotasjonane i de ulike punkta:')
disp(rot);
disp(fim);
disp('Endemoment for de ulike elementene punkt 1 og 2');
disp(endemoment);


nummer=1;
% -----Skriver ut hva momentene ble for de forskjellige elementene-------
for i=1:nelem
    p=midtmoment(i);
    X=sprintf('----Element %i-----',nummer);
    disp(X);
    disp('Endemoment ende 1 og 2 [kNm]');
    disp(endemoment(i,1:2)/1000);
 
   if p==0
    disp('Midtmoment');
    disp('ikke dimensjonerende');
   else
       disp('Midtmoment [kNm]');
       disp(midtmoment(i)/1000);
   end
  
    
    disp('Rotasjon lokal ende 1');
    disp(rot(elem(1,i)))
    disp('Rotasjon lokal ende 2');
    disp(rot(elem(2,i)))
    disp('Spenning ende 1 2 og midt ');
    disp(spenning(i,1));
    disp(spenning(i,2));
    disp(spenning(i,3));
    nummer=nummer+1;
end 

for i=1:nelem
     T=['Element',num2str(i)];
        disp(T);
    for j=1:3
    if toleranse(i,j)>70 || toleranse(i,j)<-70
        T=['Element',num2str(i)];
        disp(T);
        disp('Flytespenningsgrense overstiges');
    else
        disp('Flytespenningsgrense overstiges ikke')
    end
    end
end
disp(toleranse);
disp(endemoment);
disp(midtmoment);
disp(skjaer);
max=0;
min=0;
for i=1:nelem
    for j=1:3
        if toleranse(i,j)>max
            max=toleranse(i,j);
          
        else
        end
    end
end
for i=1:nelem
    for j=1:3
        if toleranse(i,j)<min
            min=toleranse(i,j);
          
        else
        end
    end
end
disp(max);
disp(min);
end

