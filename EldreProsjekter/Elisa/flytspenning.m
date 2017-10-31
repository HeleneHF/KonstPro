function toleranse=flytspenning(spenning,nelem)

toleranse=zeros(nelem,3);
%Oppgir spenningens andel flytspenningen i %.
for i=1:nelem
    toleranse(i,1)=100*spenning(i,1)/320000000;
    
    toleranse(i,2)=100*spenning(i,2)/320000000;
    
    toleranse(i,3)=100*spenning(i,3)/320000000;
end
end