function [K] = Systemstivhetsmatrise(nelem, elem,stivhet, npunkt)
%{
SYSTEMSTIVHETSMATRISE: Regner ut systemstivhetsmatrisen til konstruksjonen
Først blir den lokalse elemtstivhetsmatrisen til hvert element regnet ut, 
før den blir plassert på rett plass i den store systemstivhetsmatrisen K.
Output: Matrise K, npunkt x npunkt stor
   
%}


% lager en tom stivhetsmatrise K med like mange rader og kolonner som 
% konstrusjonen har knutepunkt 
K = zeros(npunkt);

% Lager den faste matrisen vi må multiplisere med EI/l per element for å
% finne elementstivhetsmatrisene for hvert enkelt element
mat1 = [4 2; 2 4];

%looper gjennom hvert element  i konstruksjonen
for n = 1: nelem
    
   % henter frem endepunkene der de lokale frihetsgradene til bjelke n er
    lok_fri_1 = elem(n,1);
    lok_fri_2 = elem(n,2);
    
    % Lager tom elementstivhetsmatrise for hvert element
    k_lokal = zeros(2);
    
    % looper gjennom ogfyller inn elementstivhetsmatrisen til hvert element med
    % riktig verdi (mest for test)
    for i = 1:2;
        for j = 1:2;    
         
            k_lokal(i,j) = (stivhet(n)) * mat1(i,j);
            
        end
    end
    
    % fyller inn i den store stivhetsmatrisen K
    K(lok_fri_1, lok_fri_1)= K(lok_fri_1, lok_fri_1) + k_lokal(1,1);
    K(lok_fri_1, lok_fri_2)= K(lok_fri_1, lok_fri_2) + k_lokal(1,2);
    K(lok_fri_2, lok_fri_1)= K(lok_fri_2, lok_fri_1) + k_lokal(2,1);
    K(lok_fri_2, lok_fri_2)= K(lok_fri_2, lok_fri_2) + k_lokal(2,2);
                 
end    

end

