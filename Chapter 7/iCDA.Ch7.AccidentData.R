############
# Chapter 7
############

###Automobile Accidents and Seat Belts

Accidents <- read.table("http://www.stat.ufl.edu/~aa/cat/data/Accidents2.dat", header=TRUE)
Accidents # 16 cell counts in the contingency table

G <- Accidents$gender; L <- Accidents$location
S <- Accidents$seatbelt; I <- Accidents$injury


fit <- glm(count ~ G*L*S + G*I + L*I + S*I, family=poisson, data=Accidents)
summary(fit) # e.g. G*I represents G + I + G:I
deviance(fit) #G2
fitted(fit) #expected freq
sum(abs(Accidents$count - fitted(fit)))/(2*sum(Accidents$count)) #Dissimilarity index


fit2 <- glm(count ~ G*L+G*S+L*S+G*I+L*I+S*I,family=poisson, data=Accidents)
summary(fit2)
deviance(fit2) #G2
fitted(fit2) #expected freq
sum(abs(Accidents$count - fitted(fit2)))/(2*sum(Accidents$count)) #Dissimilarity index


#Logit model, treating Injury as a response and the others as predictor variables
Injury <- read.table("http://www.stat.ufl.edu/~aa/cat/data/Injury_binom.dat", header=TRUE) # Injury_binom data file at text website
Injury

G <- Injury$gender; L <- Injury$location; S <- Injury$seatbelt
fit2 <- glm(yes/(no+yes) ~ G + L + S, family=binomial, weights=no+yes, data=Injury)
summary(fit2)

