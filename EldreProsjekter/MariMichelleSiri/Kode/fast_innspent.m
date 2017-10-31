function fim = fast_innspent(last_fordelt, nlast_fordelt, nelem,...
    elementlengder, nlast_punkt, last_punkt, q_amplituder)

%Henter ut fastinnspeningsmomenter fra punktlaster
punktlast = moment_punktlaster(nelem, nlast_punkt, last_punkt,...
    elementlengder);

%henter ut fastinnspenningsmomenter fra fordelte laster
fordeltlast = moment_fordelt(last_fordelt, nlast_fordelt,...
    elementlengder, nelem, q_amplituder);

%Legger sammen de ovrige
fim=punktlast+fordeltlast;
end