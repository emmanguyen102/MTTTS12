### 1. Random variables
 
## There are various built-in functions for random variables with distributions in R

## E.g 1: 100 random numbers from a normal distribution with mean 5, std. dev. 3
set.seed(1)
x <- rnorm(100, 5, 3)
z = pbinom(47, 100, 0.5)

### 2. Drawing density functions and obtaining probabilities/quantiles

a <- seq(-3, 3, by=0.01)
b <- dnorm(a)
plot(a,b, type="l")
mtext("density plot", size=3)

c <- dexp(a[a>0], 2)
plot(a[a>0], c, type="l")

d <-qnorm(0.05) ## quatile of Normal(0,1): 0.05 = P(Z < d)

### 3. Write your own function
fac <- function(n){
   if(n==0)
     return(1)
   
   fact <- 1
   num <- 1
    repeat{
      fact <- fact*num
      num <- num +1
      if (num > n) break
    }
    fact
}

### 4. prior to posterior:
r <- seq(0,100, 1)
prior.d <- r*(100-r)/166650

## For posterior distribution, we have 2 parts: numerator (likelihood * prior) and denominator (marginal distribution)
denom <- 0
for ( k in  1:100) {
  temp <- k^8*(100-r)^14/(166650*100^20)
  denom <- denom + temp
}

numer <- r^8*(100-r)^14/(166650*100^20)

post.d <- numer/denom

plot(r, post.d, type="l", col=2)
lines(r, prior.d, col=3)
 