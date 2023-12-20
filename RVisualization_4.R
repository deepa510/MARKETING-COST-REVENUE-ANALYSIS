library(readxl)
library(ggplot2)
cars_data <- read_excel("C:/Users/deepa/Downloads/Simplified Car Sales Data.xlsx")

cars_data_df <- data.frame(cars_data)

cars_data_df_filtered <- sqldf::sqldf("select * from cars_data_df where CountryName in ('Germany','USA','France');")

colnames(cars_data_df_filtered)[2] <- "Country"

ggplot(cars_data_df_filtered, aes(x=Make, y=SalePrice, fill=Country)) +
  geom_bar(stat = "summary_bin", fun=mean,position = "dodge") +
  labs(title="Average Sales by Make for Germany, the United States, and France ",
       y = "Average Sales Price")