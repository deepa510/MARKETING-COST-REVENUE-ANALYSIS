library(ggplot2)

#Recreating the COVID Data Source
df_2020 <- read.csv('C:/Users/deepa/Downloads/2020 Cases only_RS.csv')
df_2021 <- read.csv('C:/Users/deepa/Downloads/2021 Cases only_RS.csv')
df_2020_proc <- subset(df_2020, select = -c(OBJECTID, Age_group, Case_, Case1, ChartDate) )
names(df_2020_proc)[names(df_2020_proc) == 'ObjectId2'] <- 'ObjectId'
df_2021_proc <- subset(df_2021, select = -c(Age_group, Case_, Case1, ChartDate) )
df_all <- rbind(df_2020_proc, df_2021_proc)
ggplot(df_all, aes(x=EventDate)) +
  geom_bar()
df_all$Date <- as.Date(df_all$EventDate, "%m/%d/%Y")

ggplot(df_all, aes(x=Date)) +
  geom_bar()

ggplot(df_all, aes(x=Date,y=ObjectId)) +
  geom_line()

ggplot(df_all, aes(x=Date,y=ObjectId)) +
  geom_line(stat="summary_bin", fun=count)

ggplot(df_all, aes(x=Date)) +
  stat_count(geom = "line")


#Creating 2 by 2 visualization

tb_df <- df_all[(df_all$County == 'Polk' | 
                   df_all$County == 'Charlotte' |
                   df_all$County == 'Flagler' |
                   df_all$County == 'Jefferson'),]

tb_df$County <- factor(tb_df$County, levels=c("Polk","Charlotte","Flagler","Jefferson"))


ggplot(tb_df, aes(x=Date)) +
  stat_count(geom="line") +
  facet_wrap(~County)