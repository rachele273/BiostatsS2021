library(tidyverse)
sleep_file <- "https://whitlockschluter3e.zoology.ubc.ca/Data/chapter16/chap16q19SleepAndPerformance.csv"
sleep<-read_csv(sleep_file)
ggplot(sleep, aes(x=sleep, y=improvement))+
        geom_point()
sleep %>%
  na.omit() %>%
  summarise(sum_x_prod = sum((sleep - mean(sleep)) * 
                               (improvement - mean(improvement)) ),
            n = n(),
            cov = sum_x_prod / (n-1),
            cor = cov / (sd(sleep) * sd(improvement)),
            cov2 = cov(sleep ,improvement),
            cro2 =  cor(sleep ,improvement))      
sleep <- sleep %>%na.omit()
sleep %>%
  infer::rep_sample_n(size=nrow(sleep), replace = TRUE, reps =  10000) %>%
  summarise(obs_cor = cor(sleep ,improvement))%>%
  summarise(se = sd(obs_cor),
            lower_ci = quantile(obs_cor, prob = 0.025),
            upper_ci = quantile(obs_cor, prob = 0.975))
sleep %>%
  infer::rep_sample_n(size=nrow(sleep), replace = FALSE, reps =  100000) %>%
  mutate(sleep = sample(sleep))%>%
  summarise(obs_cor = cor(sleep ,improvement))%>%
  summarise(mean( abs(obs_cor) >= 0.863))
cor.test(pull(sleep, sleep), pull(sleep,improvement))
