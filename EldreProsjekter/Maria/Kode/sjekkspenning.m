function sjekkspenning(spenning,flyt,nelem)
%{
SKJEKKSPENNING: Sjekker om bøyespenningene overskrider 70% av flytspenningen
%}

for i=1:nelem
    if abs(spenning(i,1)) > (flyt*70)/100
        disp ('Ikke okei')
    elseif abs(spenning(i,2)) > (flyt*70)/100
        disp ('Ikke okei')
    elseif abs(spenning(i,3)) > (flyt*70)/100
        disp ('Ikke okei')
    else disp('WOOOHOOO')
    end
end