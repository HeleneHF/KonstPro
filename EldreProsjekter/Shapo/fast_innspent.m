function fastinn_mom = fast_innspent (last_fordelt,nlast_fordelt,nelem,...
    elementlengder, nlast_punkt,last_punkt,q_amplituder)
%
punktlast = moment_punktlaster (nelem, nlast_punkt, last_punkt,...
    elementlengder);

fordeltlast = moment_fordelt(last_fordelt, nlast_fordelt,...
    elementlengder, nelem, q_amplituder);

fastinn_mom = punktlast + fordeltlast;

end 