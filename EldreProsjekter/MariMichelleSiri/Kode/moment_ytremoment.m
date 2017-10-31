function moment = moment_ytremoment(npunkt, nmoment, last_moment)
moment = zeros(npunkt,1);

for i = 1:nmoment
    %ingen utregning, her settes bare de ytre momentene inn i en vektor,
    %knutepunktsvis
    moment(last_moment(i,1)) = moment(last_moment(i,1)) + last_moment(i,2);
end