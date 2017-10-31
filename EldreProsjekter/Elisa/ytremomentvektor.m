function vektor=ytremomentvektor(n_ytremoment,npunkt,ytremoment)
vektor=zeros(npunkt,1);

%Lager en vektor npunkt høy for ytre påført moment. 
for i=1:n_ytremoment
    vektor(ytremoment(1,i))=ytremoment(2,i)+vektor(ytremoment(1,i));
end
end
