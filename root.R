# Paul Fletcher-Hill
# Sieve-GARCH
# April 2014

# Packages
library(fBasics)
library(fGarch)
library(np)
library(splines)

# Sources
source("./repmat.R")
source("./garchOut.R")
source("./data.R") # stock, mbs, bond
source("./bspline.R")

# Main Function
# Setup options
options.display <- "iter"
options.tolFun <- 1e-6
options.tolX <- 1e-6
options.tolCon <- 1e-6
options.maxFunEvals <- 50000
options.maxIter <- 50000
options.algorithm <- "sqp"

# Estimate standard GARCH(1,1)
stock.garch <- garchFit(~garch(1,1), data=stock)
stock.mu <- as.numeric(coef(stock.garch)['mu']) # c_i
stock.omega <- as.numeric(coef(stock.garch)['omega']) # w_i
stock.beta1 <- as.numeric(coef(stock.garch)['beta1']) # theta_i
stock.alpha1 <- as.numeric(coef(stock.garch)['alpha1']) # gamma_i

mbs.garch <- garchFit(~garch(1,1), data=mbs)
bond.garch <- garchFit(~garch(1,1), data=bond)

# Setup Sieve parameters for news impact curve estimation
m <- 3
j <- 2
# Stock
stock.max = floor(max(residuals(stock.garch)*2^j) + sd(residuals(stock.garch)*2^j))
stock.min = min(floor(min(residuals(stock.garch)*2^j) - sd(residuals(stock.garch)*2^j)), 0)
stock.ks = seq(stock.min, stock.max, 1) # stock.min ... stock.max

# Quadratic initialization
p1 <- quantile(residuals(stock.garch)*2^j, .01)
p99 <- quantile(residuals(stock.garch)*2^j, .99)
xq <- t(seq(p1, p99, .001))
fq <- stock.alpha1*(xq^2) # Element-wise power
bspline(xq, c(), stock.ks, j, m, 0)

xq1 <- seq(p1, p99, .001)
fq1 <- stock.alpha1*(xq^2)
mod <- lm(fq1 ~ bs(xq1, knots=stock.ks))



