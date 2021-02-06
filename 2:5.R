install.packages("palmerpenguins")
library(palmerpenguins)
library(tidyverse)
glimpse(penguins)
penguins %>% 
  filter(!is.na(flipper_length_mm)) %>% 
  summarise(mean_flipper=mean(flipper_length_mm, na.rm=TRUE),
            var_flipper=var(flipper_length_mm))
mountains<-read_csv("data/mtns.csv")
glimpse(mountains)
mountains %>% 
  summarize(mean_height=mean(height_ft)) 
mountains %>% 
  group_by(country) %>% 
  mutate(n())
mountains %>% filter(country == "Pakistan") %>% summarise(mean(height_ft)) 
mountains %>% filter(country == "China") %>% summarise(mean(height_ft))   
mountains %>% filter(country == "Nepal") %>% summarise(mean(height_ft))   
mountains %>% 
  summarize(stdev=sd(height_ft))
mountains %>% 
  group_by(country) %>% 
  summarize(variance=var(height_ft))
