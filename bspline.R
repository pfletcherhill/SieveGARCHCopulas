# B-Spline
library(splines)

# Sample from http://stackoverflow.com/questions/15837763/b-spline-confusion
# Uses bs() function
set.seed(1)
n <- 400
x <- 0:(n-1)/(n-1)
f <- 0.2*x^11*(10*(1-x))^6+10*(10*x)^3*(1-x)^10
y <- f + rnorm(n, 0, sd = 2)
mod <- lm(y ~ bs(x, knots = seq(0.1, 0.9, by = 0.1)))
pdat <- data.frame(x = seq(min(x), max(x), length = 100))
pdat <- transform(pdat, yhat = predict(mod, newdata = pdat))
ylim <- range(pdat$y, y) ## not needed, but may be if plotting CIs too
plot(y ~ x)
lines(yhat ~ x, data = pdat, lwd = 2, col = "red")

# Bspline function
# Adapted from Walsh's Matlab code
bspline <- function(xdata, b, ks, j, m, pl) {
  N <- length(xdata)
  KS <- repmat(ks, N, 1)
  xdatarep <- (2^j)*repmat(xdata, 1, length(ks))
  bases <- (2^(j/2))*bmrep(xdatarep - KS + m/2, m)
  
  if (length(b) <= 0) {
    fitted <- c()
  } else {
    fitted <- bases*b
  }
}
