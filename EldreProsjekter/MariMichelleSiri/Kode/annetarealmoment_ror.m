function [annetarealmoment y] = annetarealmoment_ror(d,t)
%regner ut annet arealmoment for et ror med diameter d og tykkelse t

%finner radius
r = d/2;
%regner ut annet arealmoment
annetarealmoment = ((pi*(r^4 - (r-t)^4))/4)*10^-12;
y=r;% y skal brukes til aa beregne boyespenning senere
end
