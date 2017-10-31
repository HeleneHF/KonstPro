function spenning = boyespenning(endemoment, nelem, I, moment_midt, Y)
spenning = zeros(nelem,3);

for i = 1:nelem
    
    %Henter ut maksimal y verdi
    y = Y(i) * 10^-3;
    %regner ut spenning og legger i matrise elementvis
    spenning(i,1) = endemoment(i,1) * y/I(i);
    spenning(i,2) = endemoment(i,2) * y/I(i);
    spenning(i,3) = moment_midt(i,1) * y/I(i);
end 
end