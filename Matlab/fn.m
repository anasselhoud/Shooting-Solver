function dw=fn(z,y,c,a,Ru)

dw = zeros(2,1) ; 

dw(1) = y(2) ;
dw(2) =  (a^2 - 1/(Ru*tanh(z) - 1i*c) * Ru * 2 * tanh(z) * (1 - tanh(z)^2)) * y(1) ;
end
