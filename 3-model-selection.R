# model selection ####

# suppose we have data from an experiment like this:
# mean RT correct = 250ms
# mean RT incorrect = 246ms
# accuracy = 0.80

# try to fit this data with both models by adjusting the parameters of the model
# HINT: you can speed up your parameter search by using a small number of samples
# initially, and then increasing the samples as you get closer to a viable set
# of parameters.
# 2nd HINT: Don't adjust the sdrw parameter of the random.walk.model or the criterion
# paramter of the accumulator model.

# You don't need to get a perfect match. Just get in the ballpark. 


# Can both models do a reasonable job of accounting for the mean RT and accuracy? Report the
# results of your efforts:


#Random Walk Model

#(samples, drift=0.012, sdrw=0.3, criterion=4.89) 
# 0.786, mean(correct.data$rt) 253.6743, mean(incorrect.data$rt) 247.0654

#Accumulator Model 

#function(samples, rate.1=76, rate.2=82.78, criterion=3)
#0.827, mean(correct) 252.2358, mean(incorrect) 244.7861
 

# Using the parameters that you found above, plot histograms of the distribution of RTs
# predicted by each model. Based on these distributions, what kind of information could
# we use to evaluate which model is a better descriptor of the data for the experiment?
# Describe briefly how you might make this evaluation.
