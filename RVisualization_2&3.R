library(readxl)
library(ggplot2)

Pasco_data <- read_excel('C:/Users/deepa/Downloads/Combined.xlsx', sheet = 'Pasco')
# Converting to data frame
Pasco_data.df <- data.frame(Pasco_data)
colnames(Pasco_data.df) <- c('Date', 'Number.of.Cases', 'Moving.Average')
Pasco_data.df$Date <- as.Date(Pasco_data.df$Date, "%B %d, %Y")
# Create the line chart
ggplot(Pasco_data.df, aes(x=Date, y=Moving.Average)) + 
  geom_line(aes(y=Number.of.Cases), color="red") +
  geom_line(color="black") +
  labs(title = "Moving average and the number of daily cases for Pasco",
       y = "")


#the moving average and the number of daily cases for Hillsborough

Hillsborough_data <- read_excel('C:/Users/deepa/Downloads/Combined.xlsx', sheet = 'Hillsborough')
# Converting to data frame
Hillsborough_data.df <- data.frame(Hillsborough_data)
colnames(Hillsborough_data.df) <- c('Date', 'Number.of.Cases', 'Moving.Average')
Hillsborough_data.df$Date <- as.Date(Hillsborough_data.df$Date, "%B %d, %Y")
# Create the chart
ggplot(Hillsborough_data.df, aes(x=Date, y=Moving.Average)) +
  geom_line(aes(y=Number.of.Cases), color="blue") +
  geom_col(color="red") +
  labs(title = "Moving Average and Number of Daily Cases for Hillsborough",
       y = "")