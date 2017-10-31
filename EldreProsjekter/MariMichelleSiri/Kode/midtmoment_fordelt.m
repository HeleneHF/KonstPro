function moment = midtmoment_fordelt(endemoment, nelem, nlast_fordelt,...
    last_fordelt, q_amplituder, elementlengder)

moment = zeros(nelem,1);

%Lineaert fordelte laster er oppgitt som elementer de gaar over, der er
%derfor nodvendig med to forlokker

for i = 1:nlast_fordelt
    %Antall elementer aktuell last gaar over
    nelementer_last = last_fordelt(i,1);
    
    %i=lastnr, j=elementnr i last
   for j = 1:nelementer_last
       %Henter data om aktuell last
       
        %Elementnummer
        elemnr = last_fordelt(i,j + 3);
        %Lasintensitet i ende 1
        q1 = q_amplituder(elemnr,1);
        %Lasintensitet i ende 2
        q2 = q_amplituder(elemnr,2);
        %Lengde
        L = elementlengder(elemnr);
       
       if q1 == q2%Rektanulaer
           
           %For rektangulaer last er denne eksakt
           m1 = -q1 * L^2/8;
           
       else%Trapes
           
          %Tilnaerming. Splitter lasten opp i to trekantlaster, blir ikke
          %eksakt, men blir litt storre enn maksimalt moment
           m1 = -q1*L^2/(9 * sqrt(3))-q2 * L^2/(9 * sqrt(3));
       
       end
       %m2 er moment paa midten skapt av endemomenter
       m2 = -(endemoment(elemnr,1) - endemoment(elemnr,2))/2;
              
       %Sumerer saa disse momentene og setter dem elementvis i vektor
       moment(elemnr,1) = moment(elemnr,1) + m1 + m2;  
   end
end
end