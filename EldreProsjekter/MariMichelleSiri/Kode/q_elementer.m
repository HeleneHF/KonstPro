function Q = q_elementer(nelem, elementlengder, last_fordelt,...
    nlast_fordelt)
%Funksjonen skal regne ut mellomamplituder paa fordelte laster
%som gaar over flere elementer

Q = zeros(nelem,2);

for i = 1:nlast_fordelt %Gjores for alle fordelte laster i=lastnummer
    
    %Avstand det i-ende elementet har til element nr.1
    %Settes null i starten av hver i-loop
    lengde_til_elem1 = 0;
    
    % Henter startlast
    q1 = last_fordelt(i,2);
    
    %Henter ut antall elementer aktuelle last gaar over
    nelementer_last = last_fordelt(i,1);

    %% Regner ut den totale lengden i-ende last gaar over 
    total_lengde = 0; %settes lik null foor utregning
    
    for k = 1:nelementer_last
        %Henter elementnr fra lastvektor
        elemnr = last_fordelt(i,3 + k);
        %legger sammen lengder
        total_lengde = total_lengde + elementlengder(elemnr);
    end
    
    %% Regner ut amplitudene for hvert elements endepunkter
    %For i-ende last, og j-ende element i last
    for j = 1:nelementer_last%Loper gjennom alle elementer lasten gaar over
        
        %Henter ut elementnummeret
        elemnr=last_fordelt(i,3 + j);
        
        %Henter ut lengden til det aktuelle elementet
        lengde = elementlengder(elemnr);
        
        %Regner ut avstanden til det forste elementet 
        lengde_til_elem1 = lengde_til_elem1+lengde;
        
        %Regner ut q2,
        %som er lastamplitude i motsatt ende av q1, for element
        q2=qfordelt(i, lengde_til_elem1, last_fordelt, total_lengde);
        
        %setter i output-matrise
        Q(elemnr,1) = q1;
        Q(elemnr,2) = q2;
        
        %Setter q1(startamplitude) for neste element
        q1=q2;
    end
end