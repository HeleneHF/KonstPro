function spenning=boyespenning(endemoment,midtmoment,arealmoment,I_profil,nelement,elem);
spenning=zeros(nelement,3);
for i=1:nelement
    tverrsnittstype=elem(4,i);
    
    %Beregner spenning i ende 1 for element i ved formel s=M*y/I
    spenningende1=endemoment(i,1)*I_profil(2,tverrsnittstype)/(2*arealmoment(tverrsnittstype));
    
    %Beregner spenning i ende 2 for element i 
    spenningende2=endemoment(i,2)*I_profil(2,tverrsnittstype)/(2*arealmoment(tverrsnittstype));
    
    spenningmidt=midtmoment(i)*I_profil(2,tverrsnittstype)/(2*arealmoment(tverrsnittstype));
    
    spenning(i,1)=spenningende1;
    spenning(i,2)=spenningende2;
    spenning(i,3)=spenningmidt;
end
end
