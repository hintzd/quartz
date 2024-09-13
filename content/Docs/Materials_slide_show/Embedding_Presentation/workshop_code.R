#### Loading all libraries and installing if necessary ###
if (!requireNamespace("pacman", quietly = TRUE)) install.packages("pacman")
pacman::p_load(purrr, parallel, future, furrr, tictoc)

#### Outline (1) ####
# -   Loops, Functionals (to replace loops), and Logicals
# -   R function Basics
# -   Structure
# -   Some practice to start
# -   R function's Extended
#     -   `formals()`, `body()`, and `environment()`
#     -   More on Environments
#     -   Default Argument Assignment
#     -   `NULL` Conditional Execution
#     -   `message()`, `warning()`, and `stop()`
#     -   Conditional Execution with `missing()`
#     -   Using the Three Dots Ellipsis, `...`
#     -   Anonymous Functions

#### Outline (2) #####

# -   Functional Programming with `base` R
# -   Function Look Table
# -   Examples
# -   Functional programming with `purrr`
# -   Function Look Table
# -   Examples
# -   Parallel Computing
# -   Parallel Computing with `furrr`
# -   A Note on Parallel Computing
# -   Practice Questions

#### Loops, Functionals, and Logicals ####

##### What is the Difference Between Vectorization and Iteration? #####

# -   If y = 4x + 3, what is y for x = 4?
# -   If $N_{(t + 1)} = N_{t}e^{r\left(1 ~-~ \frac{N_{t}}{K}\right)}$, what is $N$ for $t = 4$ $~~$($N_{1} = 2$, $r = 0.5$, and $K = 30$)?

##### Now for the Math in R #####

# First let's make some data to play with.
vec_dat <- data.frame(x = 1:5, y = NA_real_)
vec_dat
loop_dat <- data.frame(t = 1:5, N = NA_real_)
loop_dat

# What is the difference between vectorization and iteration?

vec_dat$y <- 4*vec_dat$x + 3
vec_dat

loop_dat$N[1] <- 2
for(i in 1:4) {
  loop_dat$N[i + 1] <- loop_dat$N[i]*exp(0.5*(1 - loop_dat$N[i]/30))
}
loop_dat

##### Let's do Something a Little More Complex with a `for` Loop #####

# This is a stupid example, but it creates some data for us.
for(i in 1:20) {
  write.csv(data.frame(ID = paste0("DataLogger-", i),
                       Temperature = runif(30, 10, 20),
                       Wind = runif(30, 0, 15),
                       Battery = "Normal"),
            paste0(getwd(), "/WeatherStation_", i, ".csv"))
}

# Now lets check our work.
list.files(getwd(), pattern = "WeatherStation_")


# -   There are also while and repeat loops, but you shouldn't be writing code in R if you are using them.

##### Now for Apply Functions #####

# This is the code we just wrote.
for(i in 1:20) {write.csv(data.frame(ID = paste0("DataLogger-", i),
                                     Temperature = runif(30, 10, 20), Wind = runif(30, 0, 15),
                                     Battery = "Normal"),paste0(getwd(), "/WeatherStation_", i, ".csv"))}

# What if we want to read in a bunch of data files?
df <- lapply(paste0(getwd(), "/", list.files(getwd(), pattern = ".csv")), read.csv)

lapply(df, function(x) head(x,3))[1:2]

df2 <- do.call(rbind, lapply(paste0(getwd(), "/",
                                    list.files(getwd(), pattern = ".csv")), read.csv))
head(df2)

##### Apply Functions (cont'd) #####

# Create some genetic data.
genetic_data <- data.frame(matrix(data = sample(c("A", "T", "G", "C"), 3000, replace = TRUE),
                                  nrow = 300, ncol = 10))
head(genetic_data)

# I want to know how many A's there are in each column.
apply(genetic_data, 2, table)[1,]

# -   You might want to look at the `pbapply` package if you regularly parallelize your code.

##### Logical Statements (1) #####

if(TRUE) {print("I have to work today.")}

if(FALSE) {print("I have to work today.")
} else {print("It is the weekend!")}

if(FALSE) {print("I have to work today.")
} else if(TRUE) {print("It is the weekend!")}

x <- 10
x == 10
x != 10

column1 <- c(1:10, NA)
column1
any(is.na(column1))
is.numeric(column1)
!is.numeric(column1)

ifelse(TRUE, "cold", "hot")

# Make some data.
df2 <- data.frame(ID = "DataLogger-20", Temperature = runif(30, 10, 20),
                  Wind = runif(30, 0, 15), Battery = "Normal")

head(df2)
df2$WindClass <- ifelse(df2$Wind >= 10, "Windy", "Still")

##### Logical Statements (2) #####

#### Lets Try Some Exercises ####

##### Q1 #####
###### Question ######
# Read in the 20 "Weather Station" data files with a for loop and combine into one dataframe.

# This is the code from before to make the data.
for(i in 1:20) {
  write.csv(data.frame(ID = paste0("DataLogger-", i), Temperature = runif(30, 10, 20),
                       Wind = runif(30, 0, 15), Battery = "Normal"), paste0(getwd(), "/WeatherStation_", i, ".csv"))}

###### Answer ######


##### Q2 #####
###### Question ######
# Now modify your for loop to omit any files that contain an NA.
# This is the code from before to make the data.
for(i in 1:20) {
  write.csv(data.frame(ID = paste0("DataLogger-", i), Temperature = runif(30, 10, 20),
                       Wind = runif(30, 0, 15), Battery = "Normal"), paste0(getwd(), "/WeatherStation_", i, ".csv"))}

###### Answer ######



##### Q3 #####
###### Question ######
# Use an apply function to perform a Shapiro-Wilk test on each column of the data set created below (dat) to determine if the data in each column is normally distributed.

dat <- data.frame(A = rnorm(100, 10, 5), B = rpois(100, 10), C = rnorm(100, 50, 10),
                  X = runif(100, 0, 100), Y = rbeta(100, 1, 2), Z = rnorm(100, 0, 1))

###### Answer ######


##### Q4 #####
###### Question ######
# Make a column in the data created below (a subset of the weather station data) for week. If X (this is the row ID or day of the month) is 1-7 Week should be 1, days 8-14 = week 2, 15-21 = week 3, 22-28 = week 4, and days 28-30 should be assigned a value of NA.
# Make some data.
df2 <- data.frame(X = 1:30, ID = "DataLogger-20", Temperature = runif(30, 10, 20),
                  Wind = runif(30, 0, 15), Battery = "Normal")

###### Answer ######



#### R Function Basics ####
##### Function Structure #####
# Like a grammatically correct sentence, functions require a function name, argument and a returned object

##### Lets Write Some Functions #####
i <- function(x) x^2 # same as `i <- function(x) print(x^2)`
i(3)
j <- function(x) return(x^2)
j(3)

k <- function(x) {X = x^2; Y = x^3}
k(3) # nothing is printed to the screen, last assignment is returned as an invisible()
paste("k(3):", k(3))
k_val = k(3); k_val

l <- function(x) {X = x^2; Y = x^3; Z = x^4; invisible(x+1)}
l(3)
paste("l(3):", l(3))

m <- function(x){X = x^2; invisible(x+1); Y = x^3}
paste(m(3))

##### Functions need a object call, for example, `x` or a `return(x)` in order to return output from `x` to the global environment #####

##### Function `formals()`, `body()` and `environment()` #####

f <- function(x) x^2
f
formals(f) #> $x
body(f) #> x^2
environment(f) # <environment: R_GlobalEnv>

##### More on Environments #####

k <- function() list(ls(),environment())
k() # k() has its own environment
list(ls()[1:5],environment())
# all other environments sit on top of the global environments 

# - Environments are important to understand as they relate to **Lexical scoping**

##### Lexical Scoping #####
f1 <- function(){L = 1; L}
f1()
L # Error: object 'L' not found

K = 3
f2 <- function() {K} 
f2() # Functions can access the global environment

f3 <- function() {L <<- 10} 
f3() # returns L to the parent environment
L    # now we also prints L from global environment

remove(L)
f4 <- function(){L = 100; f3(); L}
f4()
L
# Avoid using `<<-` when possible!!

##### Default Argument Assignment #####

f <- function(a = 1) a
f()

##### `NULL` Conditional Execution (1) #####

f <- function(a, b = NULL) c(a,b)
f(1)
f(1,2)

##### `message()`, `warning()`, and `stop()` #####

message("notify the user, although we are not indicating any problems")

warning("notify the user of something potentially problematic")

stop("A condition has been met that is problematic enough to warrant forcing an error.")

##### `NULL` Conditional Execution (2) #####

k <- function(a,b) a^(b)
f <- function(a, b = NULL) {
  if(is.null(b)){
    warning("{warning()} b is missing, just returning `a`")
    return(a)
  } 
  if(a < 0 && b == 1/2){
    stop("{stop()} can't take the sqrt of a negative number")
  } else {
    message("{message()} function completion without conditional execution")
    a^(b)
  }
}
k(1) # error without user defined error handling 
f(1) # here we see the `NULL` Conditional Execution
f(-2,1/2)
f(3,2)

##### Conditional Execution with `missing()` #####

f <- function(a, b, c) {
  if(missing(c)) {
    return(sum(a,b))
  }
  if(!missing(c)) {
    return(sum(a,b,c))
  }
}
f(1,2)
f(1,2,3)

##### `...` dot-dot-dot (1) #####
f1 <- function(x, ...){...length()}
f1(1)      # 0 argument passed to `...`
f1(1,2)    # 1 arguments passed to `...`
f1(1,2,3)  # 2 arguments passed to `...`

f2 <- function(x, ...){list(...)}
f2(1,2,3) # `1` passed to `x`, `2` and `3` passed to `...`


rnorm
random_num_gen <- function(x, ...) {
  rnorm(x, ...)
}

set.seed(1); random_num_gen(5)
set.seed(1); random_num_gen(5, mean = 3, sd = 1.5)

# - The `...` argument is also known as an Ellipsis or simply dot-dot-dot.

##### `...` dot-dot-dot (2) #####

# mean and median defined with `...`
f3 <- function(x, ...){
  out <- list(mean(x, ...), median(x, ...))
  out
}

(k = c(1:8,NA))
f3(x=k, na.rm = TRUE)                                        # Works 
f3(x=k, na.rm = TRUE, random_message = "Save the bees")      # Works 

# matrix not defined with "..."
f4 <- function(x, ...){
  out <- list(mean(x, ...), median(x, ...), matrix(x,...))
  return(out)
}

f4(x=k, na.rm = TRUE)                                        # Fails
list(mean(k,na.rm = TRUE),median(k,na.rm = TRUE),matrix(k))

# `...` has pros and cons, for more info see [here](https://adv-r.hadley.nz/functions.html#fun-dot-dot-dot)

##### `...` dot-dot-dot (3) #####

# So why does `f5` work?

defined_arguments <- function(...){
  f <- list(...);out = lapply(f,function(x) names(formals(x)))
  names(out) = as.character(substitute(list(...)))[-1];out
}

defined_arguments(matrix, data.frame, as.data.frame) # which are defined with `...` ?
(k = c(1:3,NA))

matrix(k, na.rm = TRUE)
data.frame(k, na.rm = TRUE)
as.data.frame(k,na.rm = TRUE)

f5 <- function(x, ...){
  out <- list(mean(x, ...), median(x, ...), as.data.frame(x,...))
  return(out)
}
f5(x=k, na.rm = TRUE)

##### Anonymous Functions #####
# "An Anonymous Function (also known as a lambda expression) is a function definition that is not bound to an identifier. That is, it is a function that is created and used, but never assigned to a variable" (see [link](https://coolbutuseless.github.io/2019/03/13/anonymous-functions-in-r-part-1/))

# `base` R anonymous function syntax:
function(x) x * 2
sapply(1:5,function(x) x * 2)

# `purrr`’s anonymous function syntax:
~ .x * 2
\(x) x*2
purrr::map_dbl(1:5,~ .x * 2)
purrr::map_dbl(1:5,\(x) x*2)

#### Functional Programming with `base` R ####
##### Functional Programming with `base` R #####
##### `base` R Examples (1) #####
###### `apply` ######
(X <- cbind(x1 = 3, x2 = c(4:1, 2:5)))

apply(X, 1, mean) # row-wise 
apply(X, 2, mean) # col-wise

(J = array(rep(1,12), c(2, 2, 3)))
apply(J, c(1), sum)
apply(J, c(2), sum)
apply(J, c(3), sum)
apply(J, c(1,2), sum)
apply(J, c(1,3), sum)

###### `sapply` ######

(Y <- list(a = 1:10, beta = exp(-3:3)))
sapply(Y, quantile)

###### `lapply` ######

(Y <- list(a = 1:10, beta = exp(-3:3)))

lapply(Y, quantile)

###### `vapply` ######
try2 <- function(x,m){tryCatch({x}, error =function(e) {finally = print(m)})}
(Y <- list(a = 1:10, beta = exp(-3:3)))

try2(vapply(Y,quantile),"Error:`FUN.VALUE` is missing")
vapply(Y,quantile,seq(0, 1, 0.25))

###### `tapply` ######
W <- warpbreaks; head(W,3) 

# contingency table 
tapply(W$breaks, subset(W, select = -breaks), sum) 

##### `base` R Examples (2) #####
###### `do.call` ######
(Z <- lapply(rep(2,2), function(x) data.frame(x=rnorm(x))))

do.call(cbind, Z)

###### `mapply` ######

abs_dif <- function(x,y) abs(x-y)
mapply(abs_dif, c(2,10), c(2,30))

mapply(sum, c(1,2,3,5), c(1,2,3,10),c(1,2,3,15))

###### `Map` ######
abs_dif <- function(x,y) abs(x-y)
Map(abs_dif, c(2,10), c(2,30))

Map(sum, c(1,2,3,5), c(1,2,3,10),c(1,2,3,15))


###### `Reduce` ###### 
set.seed(1)
(L <- purrr::map(1:3, ~ sample(1:3, 5, replace = T)))

intersect(c(1,2,3), c(1,2,4)) # demo of intersect()
Reduce(intersect,L)

# -   "\[1\] 3 2" indicates that among the three random samples generated, the numbers 3 and 2 are the only ones that appear at least once in all three vectors.

#### Functional Programming with `purrr` ####
##### Functional Programming with `purrr` #####
##### `purrr` Examples #####
###### `map` ######
set.seed(0); 1:5 |> map(rnorm, n = 4)

# You can also use an anonymous function
set.seed(0); 1:5 |> map(\(x) rnorm(n=4, mean = x, sd = 1))
set.seed(0); 1:5 |> map(~ rnorm(n=4, mean = .x, sd = 1))

###### `map2` ######
x <- list(1, 1, 1)
y <- list(10, 20, 30)

map2(x, y, \(x, y) x + y)

###### `pmap` ######
x <- list(1, 1, 1)
y <- list(10, 20, 30)
z <- list(100, 200, 300)

pmap(list(x, y, z), sum)

set.seed(0); list(1:2,1:2,1:2) |> pmap(\(x,y,z) rhyper(3, m = x, n = y, k = z))
# These numbers represent the number of white balls drawn in each of the 3 draws from the urn

###### `reduce` ######
set.seed(1)
(L <- purrr::map(1:3, ~ sample(1:3, 5, replace = T)))

purrr::reduce(L,intersect)

#### Parallel Computing ####
##### Parallel Computing with `furrr` #####
fib_n <- function(n) {
  if ((n == 0) | (n == 1)) 
    return(1)
  else
    return(fib_n(n-1) + fib_n(n-2))
}

library(furrr) # library(furrr) loads future by default
library(tictoc)

future::plan(multisession, workers = 1)
tic()
num <- 1:30 |> future_map(fib_n)
toc() # 4.151 sec elapsed


future::plan(multisession, workers = 2)
tic()
num <- 1:30 |> future_map(fib_n)
toc() # 2.174 sec elapsed


##### A Note on Parallel Computing #####

## A Note on Parallel Computing

# > Parallel Computing is not a magic bullet. Performance depends on Overhead of Parallelization, Task Granularity, and whether or not the task is sequential

# - Sequential Tasks, generally speaking, are not capable of being parallized, though they can be *"functionally parallized"*; meaning given a function, `seq_func`, the internals of 
# `seq_func` **cannot** not be parallized, but the call to `seq_func` **can** be parallized. 
# - We will illustrate this concept with Random Walks


##### Random Walks #####

library(furrr)
library(tictoc)

nworkers = parallel::detectCores() - 1 # select nworkers to amount of cores - 1 
random_walk <- function(steps) {
  position <- numeric(steps) # Initialize the position vector
  position[1] <- 0 # Start at the origin
  for (i in 2:steps) {                   # Simulate each step of the walk
    if (runif(1) < 0.5) {
      position[i] <- position[i - 1] + 1 # Move forward
    } else {
      position[i] <- position[i - 1] - 1 # Move backward
    }
  }
  return(position)
}

steps = 10000; n_random_walks = 300 # Define the number of steps and walks

future::plan(multisession, workers = 1) # setting num of cores/workers
tic() # Measure time taken to execute the random walk
set.seed(1); walks = future_map(1:n_random_walks , ~random_walk(steps),.options = furrr_options(seed = TRUE)) 
toc() # 3.088 sec elapsed

tic()
future::plan(multisession, workers = nworkers) # setting num of cores/workers
set.seed(1);walks = future_map(1:n_random_walks , ~random_walk(steps),.options = furrr_options(seed = TRUE)) 
toc() # 1.713 sec elapsed

pdf("random_walks.pdf")
invisible(
  lapply(1:10, function(i) 
    plot(walks[[i]],type = "l", ylab = "Position", xlab = "Step",
         main = paste("Random Walk",i)))
  );dev.off()

##### Our First 10 Random Walks Plots #####

# see random_walks.pdf

##### Bootstraps in Parallel #####

boot <- function(x, B = 5000, m, theta.f, w = 1, rdist, ...) {
  plan(multisession, workers = w) # Set up for parallel execution
  b_indices <- 1:B # vector of indices for bootstrapping iterations
  iterate_func <- function(b) { # apply for each bootstrap iteration
    if (m == "p") {
      d.b <- rdist(...) # parametric bootstrap
    } else if (m == "np") {
      d.b <- x[sample(1:length(x), replace = TRUE)] # nonparametric bootstrap
    } else {
      stop("possible arguments for m is 'p' (parametric) or 'np' (nonparametric)")
    }
    theta.f(d.b)
  }
  # future_map_dbl to apply iterate_func over each index in parallel with proper seeding
  t.s <- future_map_dbl(b_indices, iterate_func, .options = furrr_options(seed = TRUE))
  samp.o(t.s) # Summarize the bootstrap results
}
samp.o = function(t.s) {
  round(c(mean=mean(t.s),sd=sd(t.s),lower=quantile(t.s, 0.025, names = F),
          upper= quantile(t.s, 0.975, names = F)),digits=6)}

library(purrr)
library(future)
library(tictoc)


theta.f = function(d.b) {p = sum(d.b)/n; p/(1-p)} 
set.seed(1); n = 800000; y = 480; B = 5000
data <- c(rep(1, y), rep(0, n-y)); phat <- sum(data)/n

tic()
(b_p_future <- boot(data, B = B, m = "p", theta.f = theta.f, w = 1,
                    rdist = rbinom, n = n, size = 1, prob = phat))
toc() # 49.859 sec elapsed

tic()
(b_p_future = boot(data, B = B, m = "p", theta.f = theta.f, w = 9,
                   rdist = rbinom, n = n, size = 1, prob = phat))
toc() # 8.014 sec elapsed

#### Its Time for Some More Exercises ####
##### Q5 #####
###### Question ######

# Write an R function named `is_positive` that takes a single numeric input and returns `TRUE` if the number is positive, and `FALSE` otherwise.

is_positive <- function(x) {
  
}

###### Answer ######


##### Q6 #####
###### Question ######

# Create a function named `sqrt_safe` that computes the square root of a number. If the input is negative, the function should stop execution and return an error message `"Cannot take square root of a negative number."`

sqrt_safe <- function(x) {
  
}

###### Answer ######


##### Q7 #####
###### Question ######

# Write a function named `find_first_negative` that takes a numeric vector and returns the position of the first negative number. If there are no negative numbers, return `NA`.

find_first_negative <- function(vec) {
  
}

###### Answer ######


##### Q8 #####
###### Question ######
# Create a function named `halve_until_less_than_one` that takes a single numeric argument and keeps halving it until it is less than 1, then returns the result. Keep track of the number of times the input is halved; print the function output as `list(result = x, nsteps = count)`

halve_until_less_than_one <- function(x) {
  
}

###### Answer ######


##### Q9 #####
###### Question ######
# Write a function named `scale_columns` that takes a matrix and scales (normalizes) each column to have a mean of 0 and a standard deviation of 1. Use the given dataframe `M`

set.seed(1)
M <- as.data.frame(
  lapply(c(400,400), function(x) data.frame(x=rgamma(x, shape =2, scale = 2)))
)

scale_columns <- function(mat) {
  
}

###### Answer ######


##### Q10 #####
###### Question ######
# Using the purrr package, write a function that takes a list of numeric vectors and returns a list of their means. Use `purrr::map`.

set.seed(1)
(K <- lapply(rep(4,3), rnorm))

library(purrr)
calc_means <- function(list_of_vectors) {
  
}

###### Answer ######


##### Q11 #####
###### Question ######
# Create a function named `multiply_and_add` that takes an arbitrary number of numeric vectors. It should multiply each vector by its index in the argument list and then sum all the results into a single number.

multiply_and_add <- function(...) {
  
}

###### Answer ######
