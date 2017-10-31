function moment = moment_punktlaster(nelem, nlast_punkt, last_punkt,...
    elementlengder)
%Denne funksjonen skal regne ut fastinnspenningsmomenter skapt av
%punktlaster

moment = zeros(nelem,2);

for i = 1:nlast_punkt
    %Gir storrelser fra punktlast-matrisen en variabel
        %Elementnummer
        elementnr = last_punkt(i,1);
        %Laststorrelse
        last = last_punkt(i,2);
        %Elementlengde
        total_lengde = elementlengder(elementnr);
        %Lastens avstand fra knutepunkt 1
        avstand_a = last_punkt(i,3);
        %Lastens avstand fra knutepunkt 2
        avstand_b = total_lengde - avstand_a;
        %Punktlastens vinkel i forhold til normalen [grader]
        last_vinkel = last_punkt(i,4);
    
    
    %Regner ut storrelse paa moment i ende 1 fra formel -P*a^2*b/l
    m_a = -last * cos(last_vinkel * pi/180) * avstand_a * avstand_b^2/...
        total_lengde^2;
    %Regner ut storrelse paa moment i ende 2 fra formel P*b^2*a/l
    m_b = last * cos(last_vinkel * pi/180) * avstand_a^2 * avstand_b/...
        total_lengde^2;
    
    %setter momentene inn i vektor
    moment(elementnr,1) = moment(elementnr,1) + m_a;
    moment(elementnr,2) = moment(elementnr,2) + m_b;
end
end