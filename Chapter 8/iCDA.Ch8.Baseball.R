############
# Chapter 8
############

###Baseball Data
Baseball <- read.table("Baseball.csv",sep=",", header=TRUE)
Baseball

fit <- glm(nij/(nij+nji) ~ -1 + Boston + NewYork + Tampa + Toronto + Baltimore, family=binomial, weights=nij+nji, data=Baseball)
summary(fit)
