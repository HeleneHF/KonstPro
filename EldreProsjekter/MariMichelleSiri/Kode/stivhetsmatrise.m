function K = stivhetsmatrise(stivhet_vektor, elem, npunkt, nelem)
K = zeros(npunkt,npunkt);

%Stivhetsmatrise for enkelt element
k = [4,2;2,4];

for i = 1:nelem
    %Henter ut knutepunktnummer for bjelkeender
    punkt1 = elem(i,1);
    punkt2 = elem(i,2);

    %Legger til i k-matrisen for hvert element i den globale
    %stivhetsmatrisen
    K(punkt1,punkt1) = K(punkt1,punkt1) + stivhet_vektor(i) * k(1,1);
    K(punkt2,punkt1) = K(punkt2,punkt1) + stivhet_vektor(i) * k(2,1);
    K(punkt1,punkt2) = K(punkt1,punkt2) + stivhet_vektor(i) * k(1,2);
    K(punkt2,punkt2) = K(punkt2,punkt2) + stivhet_vektor(i) * k(2,2);
end