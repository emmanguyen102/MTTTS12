### Question 2: Tack tossing problems
## Suppose that we wish to find out the probability of a tack (nuppineula) 
## landing heads

## a. Set the possible values of theta to be a sequence of length 50 from 0 to 1

theta <- seq(0, 1, length = 50)

par(mfrow = c(2,2)) ## make 4 plots in one page

## b. Let Beta(a,b) be the prior distribution for the probability of a tack
## landing heads (theta). Set a=2, b=3 to specify the prior distribution. Obtain
## the prior distribution density function (pdf) and make a plot of it. Make 
## also the title for the plot such as 'prior' on top of the plot.

a = 2
b = 3
ptheta = dbeta(theta, a, b)
plot(theta, ptheta, type="l")
mtext("prior", side=3)

## c. Suppose that we assume that the total number of heads is modeled as a 
## binomial distribution (n, theta). i.e

## P(data|theta) ~ binom(n, theta): likelihood

## Let n= 10 and  the number of observed heads x = 7
## Find the likelihood and plot it over theta values. Add a label 'likelihood' 
## for the plot.

n = 10
x = 7
py_theta = dbinom(x, n, theta)
plot(theta, py_theta, type="l")
mtext("likelihood", side=3)

## d. Then, multiply the prior by the likelihood and draw this joint probability
## over theta. Give a label to the plot as 'prior x lkhd'

pytheta = ptheta * py_theta
plot(theta, pytheta, type="l")
mtext("prior x lkhd", side=3)

## e. The posterior distribution is found to be a beta distribution with 
## parameters a+x and b+n-x. Draw the posterior density function with a title 
## 'Posterior'

ptheta_y = dbeta(theta, a+x, b+n-x)
plot(theta, ptheta_y, type="l")
mtext("Posterior", side=3)

## g. Here, a discretized version of the posterior can be obtained as follows:
## the joint probabilities obtained in d) / (divided by) sum of the joint 
## probabilities
## Give the name say, 'post.disc' to this discretized version.
## With this discretized version of the posterior, note that we could also 
## obtain fairly good discrete approximation to the posterior means, variances, 
## and probabilities

post.disc = pytheta/sum(pytheta)

## h. Compare the following;
## sum of post.disc multiplied by theta with (a+x)/(n+a+b) = Posterior mean
## sum of post.disc where [theta <=.4] with posterior probability that 
## theta <=.4

sum(post.disc*theta)

post_mean = (a+x) / (n+a+b)
post_mean

sum(post.disc[theta<=.4])
pbeta(.4, a+x, b+n-x)

