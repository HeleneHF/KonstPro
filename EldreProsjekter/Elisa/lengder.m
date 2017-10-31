function svar=lengder(punkt,elem,nelem)


svar=zeros(nelem,1);

% Beregner elementlengder
for i=1:nelem
   dx = punkt(1,elem(1,i))-punkt(1,elem(2,i));
   dy = punkt(2,elem(1,i))-punkt(2,elem(2,i));
   svar(i) = sqrt(dx*dx + dy*dy);
end


end
