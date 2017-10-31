function midtmoment = beregn_midtmoment(endemoment, nelem,...
    nlast_fordelt, last_fordelt, q_amplituder, elementlengder,...
    nlast_punkt, last_punkt)

%Legger sammen 'midtmoment' fra fordelt last og punktlast elementvis i
%vektor. Det forutsettes at punktlast og fordelt last ikke er paa samme
%bjelke

midt_punkt = midtmoment_punktplast(nlast_punkt, elementlengder,...
    nelem, last_punkt, endemoment);

midt_fordelt = midtmoment_fordelt(endemoment, nelem, nlast_fordelt,...
    last_fordelt, q_amplituder, elementlengder);

midtmoment = midt_punkt + midt_fordelt;
%Positivt fortegn vil tilsvare strekkside mot venstre eller oppover.
end