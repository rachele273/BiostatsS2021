#february 10
#use option - for assignmetn operator shortcut! <- 
library(tidyverse)
install.packages("infer")
library(infer)                
nba<-(read_csv("data/nba.csv"))
nba_summary<-nba %>% 
  summarise(N=n(), 
    mean_height=sum(heights)/N, 
    var_height=sum((heights-mean_height)^2)/N,
    sd_height=sqrt(var_height), 
    sample_sd=sd(heights))
glimpse(nba_summary)

#make a sample of size 20
nba_sample<- nba %>% 
  sample_n(size=20, replace=FALSE)
nba_sample %>% 
  summarise(mean_height=mean(heights))

#make a sampling distribution 
nba_sampling_dist<-nba %>% 
  rep_sample_n(size=20, replace=FALSE, reps=1000) %>% 
  summarise(mean_heights=mean(heights), .groups="drop")
ggplot(nba_sampling_dist, aes(x=mean_heights))+
  geom_histogram(color="white")

#summarize expected variability among samples with the standard error
summarise(nba_sampling_dist, se=sd(mean_heights))


#make a sample of size 20
nba_sample<-sample_n(nba, size=20, replace=FALSE)
nba_bootstrap<-nba_sample %>% 
  rep_sample_n(size=20, replace=TRUE, reps=1000) %>% 
  summarise(mean_heights=mean(heights), .groups="drop")
ggplot(nba_bootstrap, aes(x=mean_heights))+
  geom_histogram(color="white")

nba_boot_sum <- nba_bootstrap %>% 
  summarise(bootstrap_se=sd(mean_heights),
            lower_confidence=quantile(mean_heights, prob=0.025), 
            upper_confidence=quantile(mean_heights, prob=0.975))
pull(nba_boot_sum, lower_confidence)
pull(nba_boot_sum, upper_confidence)
