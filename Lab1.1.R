## Question 1: Suppose that the posterior distribution you obtain is:
## theta | data ~ Gamma (6, 1/12) so that in R we use rgamma(100, 6, 12), etc.

## a. First, set the theta values as a seqeuence from 0 to 1 spaced with 0.02

theta <- seq(0, 1, by = 0.02)

## b. Draw the posterior density function using the theta values given above

den <- dgamma(theta, 6, 12) 
plot(theta, den, type="l")

## c. Find the posterior probability that theta is greater than 0.3. e.g: P(theta>0.3|X)=?

1 - pgamma(0.3, 6, 12)

## d. A horizontal line defined by c=0.72 cuts the density function at 2 theta values, 
## theta = 0.2001 and theta = 0.7514. Find the probabilities corresponding to these 2 theta values

den_1 <- pgamma(0.2001, 6, 12)
den_2 <- pgamma(0.7514, 6, 12)

## e. In c), when you subtract the smaller probability from the bigger one, this is the percent 
## (probability) coverage for the HPD interval with theta = 0.2001 and theta = 0.7514.
## What percentage HPD interval is obtained here?

HPD_interval_percentage = den_2 - den_1

## f. Generate a random sample of size 100 from this posterior distribution.

x_r <- rgamma(100, 6, 12)

## g. Write your own function which summarizes a data set with mean, median, standard deviation, 
## and 0.025 and 0.975 quantiles.

datasumm <- function(y){
  y_mean <- mean(y)
  y_median <- median(y)
  y_std <- sd(y)
  y_q1 <- quantile(y, 0.025)
  y_q2 <- quantile(y, 0.975)
  list(m =y_mean, v =y_median, s= y_std, q1 = y_q1, q2=y_q2)
}

## h. Using the function you wrote in g), give summary of your random sample generated in f).

datasumm(x_r)

quantile(x_r, c(0.025, 0.975))