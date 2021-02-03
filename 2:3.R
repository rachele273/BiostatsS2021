#Rachel Edidin
#February 3
#more intro to ggplot
library(tidyverse)
library(lubridate)
time_1<- read_csv("data/time_1.csv")
ggplot(data=time_1, aes(x=Date, y=Open ))+
  geom_line()+
  labs(title="gamestop price in 2020", y="price (USD)")
ggplot(data=iris, aes(x=Sepal.Length))+
  geom_histogram(bins=30)
ggplot(data=iris, aes(x=Sepal.Length))+
  geom_density(adjust=.3, color="blue", fill="pink")
