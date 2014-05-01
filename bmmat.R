# bmmat(y, m)
# Adapted from Walsh's Matlab code
# Calculates Bm for each element of matrix y
bmmat <- function(y, m) {
  c <- dim(y)[1]
  r <- dim(y)[2]
  
}

# function [ out ] = Bm_mat(y,m)
#% calculates Bm for each element of the matrix y
#% vectorization of my old @ called Bm

#[c r] = size(y);
#mvec = zeros([1 1 m+1]);
#mvec(:) = (1/factorial(m-1))*((factorial(m)*(1./((factorial(m-(0:m))').*(factorial(0:m)')))).*((-1).^((0:m)')));
#bigmvec = repmat(mvec,[c r 1]);
#bigy = repmat(y,[1 1 m+1]);
#k = zeros([1 1 m+1]);
#k(:) = 0:m;
#bigk = repmat(k,[c r 1]);
#bigdiff = max(0,bigy-bigk).^(m-1);
#out = sum(bigdiff.*bigmvec,3);



end