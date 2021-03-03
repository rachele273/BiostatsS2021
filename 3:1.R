#3/1
#permuting
library(tidyverse)
library(infer)
newts_file <- "https://whitlockschluter3e.zoology.ubc.ca/Data/chapter13/chap13q08Newts.csv"
newts <- read_csv(newts_file)
beetle_file <- "https://whitlockschluter3e.zoology.ubc.ca/Data/chapter13/chap13q32milkyWayBeetles20.csv"
beetles     <- read_csv(beetle_file)
newts %>% 
  group_by(locality) %>% 
  summarise(mean=mean(wholeAnimalResistance), sd=sd(wholeAnimalResistance)) 

ggplot(newts, aes(x=wholeAnimalResistance))+
  geom_histogram(bins=5)+
  facet_wrap(~locality)

newt_permute <- newts %>% 
  rep_sample_n(size=nrow(newts), replace=FALSE, reps=1000) %>% 
  mutate(locality=sample(locality, replace=FALSE)) %>% 
  group_by(locality, replicate) %>% 
  summarise(mean_vals=mean(wholeAnimalResistance)) %>% 
  summarise(mean_diff=diff(mean_vals))
view(newt_permute)

newt_permute %>% 
  mutate(as_or_more_extreme=abs(mean_diff)>=.426) %>% 
  summarise(p_val=mean(as_or_more_extreme))


conflicts()
ggplot(beetles, aes(x=OrientationError))+
         geom_histogram(bins=10)+
         facet_wrap(~Condition)

beetle_permute <- beetles %>% 
  rep_sample_n(size=nrow(beetles), replace=FALSE, reps=1000) %>% 
  mutate(Condition=sample(Condition, replace=FALSE)) %>% 
  group_by(Condition, replicate) %>% 
  summarise(mean_vals=mean(OrientationError)) %>% 
  summarise(mean_diff=diff(mean_vals))
view(beetle_permute)

beetles %>% 
  group_by(Condition) %>% 
  summarise(mean=mean(OrientationError), sd=sd(OrientationError)) 
90.5-34

beetle_permute %>% 
  mutate(as_or_more_extreme=abs(mean_diff)>=56.5) %>% 
  summarise(p_val=mean(as_or_more_extreme))

contributors
