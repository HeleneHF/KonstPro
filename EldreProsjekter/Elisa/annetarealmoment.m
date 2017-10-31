function arealmoment=annetarealmoment(I_profil, nprofil)
arealmoment=zeros(nprofil,1);

for i=1:nprofil
    %henter ut info fra matrisen I_profil
    tykkelseH=I_profil(5,i);
    tykkelseB=I_profil(4,i);
    hoyde=I_profil(2,i);
    bredde=I_profil(3,i);
    senter=hoyde/2-tykkelseB/2;
    
    if I_profil(1,i)==1
        %regner ut arealmoment hvis tverrsnittet er rektangulært
    arealmoment(I_profil(1,i))=2*tykkelseH*hoyde*hoyde*hoyde/12+2*bredde*tykkelseB*tykkelseB*tykkelseB/12+...
        2*tykkelseB*bredde*senter*senter;
    else
        %regner ut arealmoment hvis tverrsnittet er rørtverrsnitt
        arealmoment(I_profil(1,i))=pi*(hoyde*hoyde*hoyde*hoyde-...
            tykkelseB*tykkelseB*tykkelseB*tykkelseB)/64;
    end
end
end
