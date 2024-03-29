# implement the model by filling in the function below
# the model should return a data frame with two columns: correct and rt
# the correct column should be TRUE or FALSE, and rt should contain the
# number of steps it took to reach the criterion.

# note that the function takes four arguments:
# samples is the number of samples to draw from the model
# drift is the drift rate (default value is 0)
# sdrw is the variability in the drift rate (default value is 0.3)
# criterion is the threshold for a response (default value is 3)

#accuracy.array <- if(trial == 3)
#  return(True)

Numbers.To.Sample <- rnorm(100, mean = 0, sd = 0.3)



Numbers.To.Sample

sum <- 0

  # Sum loop
RT <- 0  

while(sum < 3 && sum > -3){

  
 i <- rnorm(1, mean = 0, sd = 0.3) 
    sum <- sum + i 
    print(sum)
  
    RT = RT + 1 

}



random.walk.model <- function(samples, drift=0.0, sdrw=0.3, criterion=3){
  
  accuracy.array <- c()
  rt.array <- c()
  for(j in 1:samples){
    sum <- 0
    RT <- 0
    while(sum < criterion && sum > -criterion){
      i <- rnorm(1, mean = drift, sd = sdrw) 
      sum <- sum + i 
      
      
      RT = RT + 1
    }

    if(sum > criterion){
      accuracy.array[j] <- TRUE
    }
    if (sum < -criterion){
      accuracy.array[j] <- FALSE
    } 
    rt.array[j] <- RT
  } 

  
  
  output <- data.frame(
    correct = accuracy.array,
    rt = rt.array
  )
  
  return(output)
}


# test the model ####

# if the model is working correctly, then the line below should generate a data frame with 
# 1000 samples and about half of the samples should be correct. the average rt will probably
# be around 112, but might vary from that by a bit.

initial.test <- random.walk.model(1000)
sum(initial.test$correct) / length(initial.test$correct) # should be close to 0.5
mean(initial.test$rt) # should be about 112

# visualize the RT distributions ####

# we can use dplyr to filter the data and visualize the correct and incorrect RT distributions

library(dplyr)

correct.data.rw <- initial.test %>% filter(correct==TRUE)
incorrect.data.rw <- initial.test %>% filter(correct==FALSE)

hist(correct.data.rw$rt)
hist(incorrect.data.rw$rt)

mean(correct.data.rw$rt)
mean(incorrect.data.rw$rt)