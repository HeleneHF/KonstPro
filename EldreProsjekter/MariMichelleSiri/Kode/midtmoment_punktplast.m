function moment = midtmoment_punktplast(nlast_punkt, elementlengder,...
    nelem, last_punkt, endemoment)

moment = zeros(nelem,1);

for i = 1:nlast_punkt
    %Henter data for aktuell last, symboler skal vaere tilsvarende de i
    %tabellen i marinkompendiet.
    elemnr = last_punkt(i,1);
    L = elementlengder(elemnr);
    a = last_punkt(i,3);
    b = L - a;
    P = cos(last_punkt(i,4) * pi/180) * last_punkt(i,2);
    
    %Moment fra punktlasten i posisjonen lasten befinner seg
    m1 = - P * a * b/L;
    %Moment fra endemomenter der punktlasten befinner seg
    m2 = (-endemoment(elemnr,1) * (L - a) + endemoment(elemnr,2) * a)/L;
    
    moment(elemnr,1) = m1 + m2 + moment(elemnr,1);
end
end 