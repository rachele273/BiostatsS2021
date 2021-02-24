#february 22
#probabiltiy
library(tidyverse)
tibble(roll_1=sample(x=1:6, size=20 * n_reps replace=TRUE) %>% 
  repnum=rep(1:n_reps, each=20)) %>% 
  summarize(p_1=mean(roll_1==1))

tibble(roll_1=sample(x=1:6, size=100, replace=TRUE)) %>% 
  summarize(p_1=mean(roll_1==1))

two_die <- tibble(roll_1=sample(x=1:6, size=10000, replace=TRUE),
  (roll_2=sample(x=1:6, size=10000, replace=TRUE))) %>% 
  mutate(sum_roll=roll_1+roll_2)
ggplot(two_die, aes(x=sum_roll))+
  geom_histogram(binwidth=1, color="white")

two_die %>% 
  filter(roll_1==1) %>% 
  summarize(p_1=mean(sum_roll==3))

#great general
tibble(battle=sample(x=c("win", "lose"), size=5*n_reps, replace=TRUE),
       generals=rep(1:n_reps, each=5)) %>% 
        group_by(generals, battle, .drop=FALSE) %>% 
        summarise(n_wins=n()) %>% 
        filter(battle=="win") %>% 
        summarise(n_wins=n()) %>% 
      filter(battle=="win")
  


#cancer
n_people <- 1000000
p_cancer <- .0001
p_diag_given_cancer <- .9
p_diag_given_healthy <- 1/1000

cancer_sim <- tibble(actual_case=sample(c("actual cancer","no cancer"),
              size=n_people, prob=c(p_cancer, 1-p_cancer), 
              replace=TRUE )) %>% 
  mutate(diagnosis=case_when(actual_case=="cancer" ~ sample(c("cancer", "no cancer"), 
                                                    size=n(), 
                                                    prob=c(p_diag_given_cancer, 1-p_diag_given_cancer), 
                                                    replace=TRUE), 
                             actual_case=="no cancer" ~sample(c("cancer", "no cancer"), 
                                                              size=n(),
                                                    prob=c(p_diag_given_healthy, 1-p_diag_given_healthy), 
                                                    replace=TRUE)))
                                                              
cancer_sim %>% 
  mutate(cancer_diag=diagnosis=="cancer")
         
                             
     
