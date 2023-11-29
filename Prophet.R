#Install relevant packages
install.packages("tidyverse")
install.packages("prophet")

#Load the packages
library(tidyverse)
library(prophet)

#Load the data
Data <- read.csv("en_dispensing_numbers.csv")

#Look at the data
Data
head(Data)
tail(Data)
str(Data)
summary(Data)

#Selected required columns
data <- Data %>% select(Date, NumberofItems)

data

#Rename the columns
data <- rename (data, ds = Date, y = NumberofItems)


#Call the Prophet Function and Fit the Model

model <- prophet(data)
future <- make_future_dataframe(model, periods = 3650) #10 years prediction

tail(future)

#Forecasting

forecast <- predict(model, future)

tail(forecast [c("ds", "yhat", "yhat_lower", "yhat_upper")])


#Plot the estimates
plot(model, forecast)

dyplot.prophet(model, forecast)

prophet_plot_components(model, forecast)









