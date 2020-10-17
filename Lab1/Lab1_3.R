### Question 3: Continuing the setup of the problem 2, consider different 
## choices of priors as follows:

## a. Change the prior parameters to a=2, b=2. Then, draw the prior density
## and the posterior density on one page

a=2
b=2
x=7 ## number of observed heads
n=10 ## number of exchangable trials

theta = seq(0,1, length=50)

# Prior distribution
ptheta = dbeta(theta, a, b)


# Likelihood
py_theta = dbinom(x, n, theta)

# Prior dsitribution multiples likelihood
pytheta = py_theta * ptheta

ptheta_y = dbeta(theta, a+x, b+n-x)

par(mfrow = c(2,2))

plot(theta, ptheta, type="l")
mtext("Prior", side=3)

plot(theta, py_theta, type="l")
mtext("Likelihood", side=3)

plot(theta, pytheta, type ="l")
mtext("Prior x likelihood", side =3)

plot(theta, ptheta_y, type="l")
mtext("Posterior", side =3)


## b. Repeat a) with a=2, b= 9. What do you find from the plots?

a=2
b=9
x=7 ## number of observed heads
n=10 ## number of exchangable trials

theta = seq(0,1, length=50)

# Prior distribution
ptheta = dbeta(theta, a, b)


# Likelihood
py_theta = dbinom(x, n, theta)

# Prior dsitribution multiples likelihood
pytheta = py_theta * ptheta

ptheta_y = dbeta(theta, a+x, b+n-x)

par(mfrow = c(2,2))

plot(theta, ptheta, type="l")
mtext("Prior", side=3)

plot(theta, py_theta, type="l")
mtext("Likelihood", side=3)

plot(theta, pytheta, type ="l")
mtext("Prior x likelihood", side =3)

plot(theta, ptheta_y, type="l")
mtext("Posterior", side =3)