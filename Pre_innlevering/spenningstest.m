function testSigma = spenningstest(sigma)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Titel:    spenningstest                                                 %
% Funksjon: Finner den makstimale spenningen (i absoluttverdi) og tester  %
%           om denne er i område 30%-70% av flytespenningen. Gir beskjed  %
%           til brukeren om tversnittet er sterkt nok og eventuelt hva    %
%           som er galt.                                                  %
%           til riktig knutepunkt                                         %
% Oppdatert: 2017-11-04                                                   %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
testSigma = false;       % Antar at tversnittet ikke er stekt nok

sigma_flyt = 320;   % Flytespenningen [MPa]
sigma_max = max(max(abs(sigma)));   % Den største absolutte bøyespenninga

fprintf('\nMaksimal skjærspenning:\t %f\n', sigma_max);

    if (sigma_max < 0.7*sigma_flyt) && (sigma_max > 0.3*sigma_flyt)
        testSigma = true;
        fprintf('Maksimal skjærspenning er innenfor grensene\n'); 
        

    elseif (sigma_max >= 0.7*sigma_flyt)
        fprintf('Maksimal skjærspenning er over flytspenningen\n');
        testSigma = false; 

    elseif (sigma_max > 0.7*sigma_flyt)
        fprintf('Maksimal skjærspenning er på over maksgrensen på 70');
        fprintf('prosent av flytespenningen\n'); 
        testSigma = false;

    elseif (sigma_max < 0.3*sigma_flyt)
        fprintf('Maksimal skjærspenning er under 30 prosent av flytespenningen.\n');
        testSigma = false;
    end

end

