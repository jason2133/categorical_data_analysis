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

num1expect <- chisq.test(num1again)$expected
num1expect

chisq.test(num1again) #Pearson's chi-square test


library(DescTools)
GTest(num1again) # LR Test

# c
fisher.test(num1again)                        #Fisher's exact test
fisher.test(num1again, alternative="greater") #Fisher's exact test (one-sided)  


# Num 2
# a
num2again <- matrix(c(9, 44, 13, 10, 11, 52, 23, 22, 9, 41, 12, 27), ncol=3)
num2again <- data.frame(num2again, row.names=c("some high school", "high school graduate", "some college", "college graduate"))
colnames(num2again) <- c("low", "middle", "high")
num2again

# a
chisq.test(num2again) # Chi-Squared Test

library(DescTools)
GTest(num2again) # LR Test

# b
# 기대도수, 표준화잔차

# 기대도수
# Estimated Expected Frequencies
num2expect <- chisq.test(num2again)$expected
num2expect

# 표준화잔차
# Standardized Pearson Residuals
num2residual <- chisq.test(num2again)$stdres
num2residual

# c
# OR from the cells at the 4 corners
oddsratio(matrix(c(9, 11, 9, 44, 52, 41, 13, 23, 12, 10, 22, 27), nrow=3), method='wald', conf=0.95, correct=FALSE)

# 3
# a
num3 <- matrix(c(9, 44, 13, 10, 11, 52, 23, 22, 9, 41, 12, 27), ncol=3)
num3

library(vcdExtra)

CMHtest(num3, rscores=c(1, 2, 3, 4), cscores = c(1, 2, 3)) #M-test
sqrt(4.7489)
1-pnorm(2.179197)

# b
library(vcdExtra)
CMHtest(num3, rscores=c(10, 20, 30, 40), cscores = c(-1, 0, 1)) #M-test
sqrt(4.7489)
1-pnorm(2.179197)

# Change X
# 변화가 없다

# c
library(vcdExtra)
CMHtest(num3, rscores=c(1, 3, 5, 10), cscores = c(1, 5, 10)) #M-test
sqrt(6.0867)
1-pnorm(2.467124)


# 4
# a
# OR 6
# AG Conditional OR
library(epitools)

# Department 1
oddsratio(c(512, 313, 89, 19), method="wald", conf=0.95, correct=FALSE) #Wald test and CI for Odds Ratio(OR)

# Department 2
oddsratio(c(353, 207, 17, 8), method="wald", conf=0.95, correct=FALSE) #Wald test and CI for Odds Ratio(OR)

# Department 3
oddsratio(c(120, 205, 202, 391), method="wald", conf=0.95, correct=FALSE) #Wald test and CI for Odds Ratio(OR)

# Department 4
oddsratio(c(138, 279, 131, 244), method="wald", conf=0.95, correct=FALSE) #Wald test and CI for Odds Ratio(OR)

# Department 5
oddsratio(c(53, 138, 94, 299), method="wald", conf=0.95, correct=FALSE) #Wald test and CI for Odds Ratio(OR)

# Department 6
oddsratio(c(22, 351, 24, 317), method="wald", conf=0.95, correct=FALSE) #Wald test and CI for Odds Ratio(OR)

# b
# AG Marginal OR
oddsratio(c(1198, 1493, 557, 1278), method="wald", conf=0.95, correct=FALSE) #Wald test and CI for Odds Ratio(OR)

# c
# AG Conditional OR
# Male : 2
# Female : 4

# AG Marginal OR
# Male

# Simpson's Paradox
# 심프슨의 역설


