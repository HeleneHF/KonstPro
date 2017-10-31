function moment = moment_fordelt(last_fordelt, nlast_fordelt,...
    elementlengder, nelem, q_amplituder)

%I denne funksjonen regnes momentbidragene fra alle de lineaere lastene ut
%Det er snakk om fastinnspeningsmomenter


moment = zeros(nelem,2);
  
    %% Regner ut momenter fra fordelte laster og setter i matrise
    %
    for i = 1:nlast_fordelt
        
        %Antall elementer lasten gaar over
        nelementer_last = last_fordelt(i,1);
        
        %For lastnr i, og elementnr j i last
        for j = 1:nelementer_last
        
        %Henter elementnummer
        elemnr = last_fordelt(i,3+j);
        
        %Henter laststorrelser
        q1 = q_amplituder(elemnr,1);
        q2 = q_amplituder(elemnr,2);
        
        %Henter elementets lengde
        lengde = elementlengder(elemnr,1);
        
        %Fastinnspeningsmomentene fra lineaert fordelte laster regnes 
        %ut som to trekantlaster
            %Moment ende 1, to trekanter
            m12_1 = (-1/20) * q1 * lengde^2;
            m12_2 = (-1/30) * q2 * lengde^2;
            %Moment ende 2, to trekanter
            m21_1 = (1/30) * q1 * lengde^2;
            m21_2 = (1/20) * q2 * lengde^2;
        
        %Deretter settes disse momentene inn i en matrise.
        moment(elemnr,:) = [m12_1 + m12_2 , m21_1 + m21_2];
        
        end%ufores for alle elementene lasten gaar over
    end%utfores for alle laster
end