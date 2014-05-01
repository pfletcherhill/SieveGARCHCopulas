# Data
# Date Range: March 20th, 2007 through December 31st, 2010

# Fama-French Factor
stock <- read.table("./data/fama-french.txt", header=F)
names(stock) <- c("date", "mkt.rf", "smb", "hml", "rf")
stock <- stock$mkt.rf

# Mortgage-backed security market returns
# Barclay's MBS Index
mbs <- read.table("./data/mbb.txt", header=F)
names(mbs) <- c("index")
mbs <- log(mbs$index[-1]/mbs$index[-length(mbs$index)]) # Log Differences

# Barclay's Bond Index
bond <- read.table("./data/agg.txt", header=F)
names(bond) <- c("index")
bond <- log(bond$index[-1]/bond$index[-length(bond$index)]) # Log Differences
