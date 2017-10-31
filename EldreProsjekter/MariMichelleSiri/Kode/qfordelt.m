function Q = qfordelt(i, lengde_var, last_fordelt, total_lengde)

%Funksjonen regner ut amplituden paa last i en avstand lengde_var fra
%startpunkt

%Henter amplitude helt i starten
qstart = last_fordelt(i,2);
%Henter amplitude i helt i enden
qslutt = last_fordelt(i,3);
%Regner ut stigningstall for lasten
stigning = (qslutt - qstart)/total_lengde;

%Ut i fra stigningstall regnes Q-verdi ved en variabel lengde
Q = qstart + stigning * lengde_var;
end