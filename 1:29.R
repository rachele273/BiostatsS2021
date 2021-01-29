#Rachel Edidin
#January 29
#Dealing with data

library(tidyverse)
library(readxl)

people<-tibble(first_name= c("Derek", "Kiana", "Saabira"),
       gender=     c("Male", "Female", "Female"),
       height=     c(75, 70, 63), 
       weight=     c(116, 158, 167))
#add a column 
people<-mutate(people, BMI=weight/height)
#sort by value 
arrange (people, BMI)
#biggest to smallest
arrange (people, desc(BMI))
#select rows of interest 
filter (people, gender=="Female")
iris
iris2<-mutate(iris, sepal_to_petal_length=Sepal.Length/Petal.Length)
iris2<-arrange(iris2, desc(sepal_to_petal_length))
view(iris2)

fish<-tibble (mating_types=c("many males", "one male", "two males"),
              not_cannibalized=c(4, 389, 17),
              cannibalized=c(16, 61, 17))
fish
#answers:
#Question: are fish more likely to cannibalize children that are not their own 
#type of data: categorical and numeric
#observation or experiment: observation
#confounding: territory differences 
mutate (fish, prop=cannibalized/(cannibalized+not_cannibalized))
