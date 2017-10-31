function skjarkrefter = skjaer(nelem, moment_rotasjon, elementlengder,...
    nlast_punkt, last_punkt, nlast_fordelt, last_fordelt, q_amplituder)

%Funsjonen skal regne ut skjaerkrefter elementvis ved ender
%Positivt fortegn vil ha skjaerretning med urviseren

skjarkrefter = zeros(nelem,2);
for i = 1:nelem 
%Regner ut -(Mij+Mji)/L for hvert element
Q_1 = -(moment_rotasjon(i,1) + moment_rotasjon(i,2)) / elementlengder(i,1);
%Legger til i matrise
skjarkrefter(i,:) = skjarkrefter(i,:) + [Q_1, Q_1];
end

% Regner ut Q0 for elementer med punktlast
for i = 1:nlast_punkt
    
    %Henter nodvendig data:
    P = cos(last_punkt(i,4) * pi/180) * last_punkt(i,2);%Laststyrke
    a = last_punkt(i,3);%Avstand fra ende 1
    elemnr = last_punkt(i,1);%Elementnummer
    L = elementlengder(elemnr,1);%Lengde paa element

    if a>0 && a<L%Vil ikke aa ha med laster som virker i knutepunkt
    
        %Skjaerkrefter i hver ende, regnes ut med momentlikevekt
        Q_01 = [P*((L-a)/L) , -P*(a/L)];
    
    else
        Q_01 = zeros(1,2);%Null ut dersom kraft er i knutepunkt
    end

    %Legger til skjaerkrefter i matrisen
    skjarkrefter(elemnr,:) = skjarkrefter(elemnr,:) + Q_01;
end

%Regner ut Q0 for elementer med fordelt last
for i = 1:nlast_fordelt%Antall laster lopes gjennom
    for j = 1:last_fordelt(i,1)%elementer per last lopes gjennom
        
      %Henter nodvendig data
      elemnr = last_fordelt(i,j + 3);%Elementnummer
      amplitude1 = q_amplituder(elemnr,1);%Lastintensitet i ende 1
      amplitude2 = q_amplituder(elemnr,2);%Lastintensitet i ende 2
      L = elementlengder(elemnr,1);%Lengde paa element
      
      %Regner ut skjaerkraft i hver ende med momentlikevekt
      Q_02 = L*[(1/3)*amplitude1+(1/6)*amplitude2 , ...
          -(1/3)*amplitude2-(1/6)*amplitude1];
      
      %Legger til skjaerkrefter i matrisen
      skjarkrefter(elemnr,:) = skjarkrefter(elemnr,:) + Q_02;

    end
end
end