
########################################## Step 1: 
num_samples <- 50000
data <- rexp(num_samples, 0.2)
x <- data.frame( Number = seq(1, num_samples , 1), X = sort(data))
plot(x)

########################################## Step 2:

Y <- array(data, dim=c(100,500))

########################################## Step 3:

########## PDF, CDF, mean and standard deviation of first five vectors 
 
for(k in 1:5){

vector <- Y[,k]
#print(vector)

pdata <- rep(0, 100);

for(i in 1:100){
    val=round(vector[i], 0);
    if(val <= 100){
       pdata[val] = pdata[val] + 1/ 100; 
    }
}

xcols <- c(0:99)

plot(xcols, pdata, "o" , xlab=paste("Y[",k,"]"), ylab=paste("f(Y[",k,"])") )

cdata <- rep(0, 100)

cdata[1] <- pdata[1]

for(i in 2:100){
    cdata[i] = cdata[i-1] + pdata[i]
}

plot(xcols, cdata, "o", col="blue", xlab=paste("Y[",k,"]"), ylab=paste("F(Y[",k,"])") );

print(mean(vector))
print(sd(vector))

}

######### Calculating mean and standard deviation of all 500 Y's

Z <- vector(mode="numeric", length=0)
S <- vector(mode="numeric", length=0)

for(k in 1:500){
    
    v <- Y[,k]
    #print(vector)
    Z <- c(Z,mean(v))
    S <- c(S,mean(v))
}

########################################### Step 4:

hist(Z, breaks = c(seq(3.0,7.0,0.2 ) ) )

plot(density(Z), xlab = "Z", ylab = "Probability Density Function of Z" )

plot(ecdf(Z), xlab = "Z", ylab = "Cumulative Distribution Function of Z")

########################################### Step 5:

writeLines("Mean of Z:")
print(mean(Z))
writeLines("Standard Deviation of Z:")
print(sd(Z))

########################################### Step 6:

writeLines("Mean of Original Distribution:")
print(mean(data))
writeLines("Standard Deviation of Original Distribution:")
print(sd(data))

###########################################
warnings()
   
