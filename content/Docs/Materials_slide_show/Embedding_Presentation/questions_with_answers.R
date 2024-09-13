##### Q1 #####
###### Question ######
# Read in the 20 "Weather Station" data files with a for loop and combine into one dataframe.

# This is the code from before to make the data.
for(i in 1:20) {
  write.csv(data.frame(ID = paste0("DataLogger-", i), Temperature = runif(30, 10, 20),
                       Wind = runif(30, 0, 15), Battery = "Normal"), paste0(getwd(), "/WeatherStation_", i, ".csv"))}

###### Answer ######
# This is the code from before to make the data.
for(i in 1:20) {
  write.csv(data.frame(ID = paste0("DataLogger-", i), Temperature = runif(30, 10, 20),
                       Wind = runif(30, 0, 15), Battery = "Normal"), paste0(getwd(), "/WeatherStation_", i, ".csv"))}

for(i in seq_along(list.files(getwd(), pattern = "WeatherStation_"))) {
  tmp <- read.csv(paste0(getwd(), "/", list.files(getwd(), pattern = ".csv"))[i])
  if(i == 1) {weather_dat <- tmp
  } else {weather_dat <- rbind(weather_dat, tmp)}}

##### Q2 #####
###### Question ######
# Now modify your for loop to omit any files that contain an NA.
# This is the code from before to make the data.
for(i in 1:20) {
  write.csv(data.frame(ID = paste0("DataLogger-", i), Temperature = runif(30, 10, 20),
                       Wind = runif(30, 0, 15), Battery = "Normal"), paste0(getwd(), "/WeatherStation_", i, ".csv"))}

###### Answer ######
# This is the code from before to make the data.
for(i in 1:20) {
  write.csv(data.frame(ID = paste0("DataLogger-", i), Temperature = runif(30, 10, 20),
                       Wind = runif(30, 0, 15), Battery = "Normal"), paste0(getwd(), "/WeatherStation_", i, ".csv"))}

# Use this code to put some NA's into the "Weather Station" files.
write.csv(data.frame(ID = "DataLogger-7", Temperature = c(runif(28, 10, 20), NA, NA),
                     Wind = c(runif(28, 0, 15), NA, NA), Battery = c(rep("Normal", 28), "Low", "Low")),
          paste0(getwd(), "/WeatherStation_7.csv"))


# This is the code from before to make the data.
for(i in 1:20) {
  write.csv(data.frame(ID = paste0("DataLogger-", i), Temperature = runif(30, 10, 20),
                       Wind = runif(30, 0, 15), Battery = "Normal"), paste0(getwd(), "/WeatherStation_", i, ".csv"))}

# Use this code to put some NA's into the "Weather Station" files.
write.csv(data.frame(ID = "DataLogger-7", Temperature = c(runif(28, 10, 20), NA, NA),
                     Wind = c(runif(28, 0, 15), NA, NA), Battery = c(rep("Normal", 28), "Low", "Low")),
          paste0(getwd(), "/WeatherStation_7.csv"))

for(i in seq_along(list.files(getwd(), pattern = "WeatherStation_"))) {
  tmp <- read.csv(paste0(getwd(), "/", list.files(getwd(), pattern = ".csv"))[i])
  if(!any(is.na(tmp))) {
    if(i == 1) {weather_dat <- tmp
    } else {weather_dat <- rbind(weather_dat, tmp)}}}


##### Q3 #####
###### Question ######
# Use an apply function to perform a Shapiro-Wilk test on each column of the data set created below (dat) to determine if the data in each column is normally distributed.

dat <- data.frame(A = rnorm(100, 10, 5), B = rpois(100, 10), C = rnorm(100, 50, 10),
                  X = runif(100, 0, 100), Y = rbeta(100, 1, 2), Z = rnorm(100, 0, 1))

###### Answer ######
dat <- data.frame(A = rnorm(100, 10, 5), B = rpois(100, 10), C = rnorm(100, 50, 10),
                  X = runif(100, 0, 100), Y = rbeta(100, 1, 2), Z = rnorm(100, 0, 1))

apply(dat, 2, shapiro.test)

##### Q4 #####
###### Question ######
# Make a column in the data created below (a subset of the weather station data) for week. If X (this is the row ID or day of the month) is 1-7 Week should be 1, days 8-14 = week 2, 15-21 = week 3, 22-28 = week 4, and days 28-30 should be assigned a value of NA.
# Make some data.
df2 <- data.frame(X = 1:30, ID = "DataLogger-20", Temperature = runif(30, 10, 20),
                  Wind = runif(30, 0, 15), Battery = "Normal")

###### Answer ######
df2$Week <- ifelse(df2$X <= 7, 1,
                   ifelse(df2$X >= 8 & df2$X <= 14, 2,
                          ifelse(df2$X >= 15 & df2$X <= 21, 3,
                                 ifelse(df2$X >= 22 & df2$X <= 28, 4, NA))))

#### Its Time for Some More Exercises ####
##### Q5 #####
###### Question ######

# Write an R function named `is_positive` that takes a single numeric input and returns `TRUE` if the number is positive, and `FALSE` otherwise.

is_positive <- function(x) {
  
}

###### Answer ######

is_positive <- function(x) {
  if (x > 0) {
    TRUE
  } else {
    FALSE
  }
}

is_positive(5)

##### Q6 #####
###### Question ######

# Create a function named `sqrt_safe` that computes the square root of a number. If the input is negative, the function should stop execution and return an error message `"Cannot take square root of a negative number."`

sqrt_safe <- function(x) {
  
}

###### Answer ######

sqrt_safe <- function(x) {
  if (x < 0) {
    stop("Cannot take square root of a negative number.")
  }
  sqrt(x)
}
sqrt_safe(-2)
sqrt_safe(5)



##### Q7 #####
###### Question ######

# Write a function named `find_first_negative` that takes a numeric vector and returns the position of the first negative number. If there are no negative numbers, return `NA`.

find_first_negative <- function(vec) {
  
}

###### Answer ######

find_first_negative <- function(vec) {
  for (i in 1:length(vec)) {
    if (vec[i] < 0) {
      return(i)
    }
  }
  NA
}

find_first_negative(c(5, 2, -4, 6, -1))


##### Q8 #####
###### Question ######
# Create a function named `halve_until_less_than_one` that takes a single numeric argument and keeps halving it until it is less than 1, then returns the result. Keep track of the number of times the input is halved; print the function output as `list(result = x, nsteps = count)`

halve_until_less_than_one <- function(x) {
  
}

###### Answer ######

halve_until_less_than_one <- function(x) {
  count = 0
  while (x >= 1) {
    x <- x / 2
    count <- count+1
  }
  list(result = x, nsteps = count)
}
halve_until_less_than_one(14)


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

set.seed(1)
M <- as.data.frame(
  lapply(c(400,400), function(x) data.frame(x=rgamma(x, shape =2, scale = 2)))
)

scale_columns <- function(mat) {
  apply(mat, 2, function(x) (x - mean(x)) / sd(x))
}

M_new <- scale_columns(M)
par(mfrow = c(1,2))
hist(M$x);hist(M_new)



##### Q10 #####
###### Question ######
# Using the purrr package, write a function that takes a list of numeric vectors and returns a list of their means. Use `purrr::map`.

set.seed(1)
(K <- lapply(rep(4,3), rnorm))

library(purrr)
calc_means <- function(list_of_vectors) {
  
}

###### Answer ######

set.seed(1)
(K <- lapply(rep(4,3), rnorm))

library(purrr)
calc_means <- function(list_of_vectors) {
  map_dbl(list_of_vectors, mean)
}

calc_means(K)



##### Q11 #####
###### Question ######
# Create a function named `multiply_and_add` that takes an arbitrary number of numeric vectors. It should multiply each vector by its index in the argument list and then sum all the results into a single number.

multiply_and_add <- function(...) {
  
}

###### Answer ######

multiply_and_add <- function(...) {
  vectors <- list(...)
  result <- 0
  for (i in seq_along(vectors)) {
    result <- result + sum(vectors[[i]] * i)
  }
  result
}
multiply_and_add(c(1,2),c(3,4))
# ie 
sum(c(1, 2) * 1) + sum(c(3, 4) * 2)  