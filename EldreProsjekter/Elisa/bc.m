function [Kn,Bn]=bc(npunkt, punkt, K, b)
%innf�rer randbetingelser ved hjelp av rotasjonsfj�r. 
Kn=K;
for i=1:npunkt
    if punkt(3,i)==1
        
        Kn(i,i)=1000000*K(i,i)+K(i,i);
    else
    end
    Bn=b;
end
end
