#Rachel
#February 1 2021
#More data manipulation and plotting
getwd()
library(tidyverse)
titanic<-read_csv("data/titanic3.csv")
fish_fry<- read_csv("data/sneaker_cannibalism.csv")
fish_fry%>%
  group_by(typeOfMales, cannibalism)%>%
  mutate(count=n())
squirrels<- tibble (day=c("Mon", "Tues", "Weds", "Thurs", "Fri", "Sat", "Sun"),
squirrels_observed=c(3, 6, 4, 3, 3, 6, 0 ))
squirrels%>%
mutate(week_status=case_when(day%in% c("Mon", "Tues", "Weds"), ~"beginning_of_week", 
                             day%in% c("Thurs", "Fri", "Sat", "Sun"), ~"end_of_week)"))
genes<-read_csv("data/")