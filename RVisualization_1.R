library(readxl)
library(ggplot2)
data_excel <- read_excel("C:/Users/deepa/Downloads/2018 Data.xlsx")
data_excel.df <- data.frame(data_excel)

names(data_excel.df)

attach(data_excel.df)

plt <- ggplot(data_excel.df, aes(x = Perc.with.health.Insurance, y=Median.Family.Income))

plt + geom_point(color="green",size=Obesity.Rates, shape='+') +
  labs(title = "US Median Family Income and Health Insurance Rates",
       x = "Percentage with Health Insurance",
       y = 'Median Family Income')