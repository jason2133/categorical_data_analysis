install.packages("PropCIs")
install.packages("epitools")
install.packages("vcd")
install.packages("vcdExtra")
install.packages("DescTools")

# Num 1
num1 <- matrix(c(21, 8, 2, 9), ncol = 2)
num1

# a

# proportions(D)
prop.test(num1, conf.level=0.95, correct=FALSE) #Wald test and CI for diff props(D)

# Relative Risk (RR)
library(epitools)
riskratio(c(9, 8, 2, 21), method="wald", conf=0.95, correct=FALSE) #Wald test and CI for Relative Risk(RR)

# OR (Odds Ratio)
oddsratio(c(21, 2, 8, 9), method="wald", conf=0.95, correct=FALSE) #Wald test and CI for OR

# b
num1again <- matrix(c(21, 8, 2, 9), ncol=2)
num1again <- data.frame(num1again, row.names=c("Surgery", "Radiation Therapy"))
colnames(num1again) <- c("Controlled", "Not Controlled")
num1again

chisq.test(num1again) #Pearson's chi-square test

library(DescTools)
GTest(num1again) # LR Test

# c
fisher.test(num1again)                        #Fisher's exact test
fisher.test(num1again, alternative="greater") #Fisher's exact test (one-sided)  


# Num 2
# a
num2again <- matrix(c(9, 4, 13, 10, 11, 52, 23, 22, 9, 41, 12, 27), ncol=3)
num2again <- data.frame(num2again, row.names=c("some high school", "high school graduate", "some college", "college graduate"))
colnames(num2again) <- c("low", "middle", "high")
num2again

# a
chisq.test(num2again)

library(DescTools)
GTest(num2again) # LR Test

