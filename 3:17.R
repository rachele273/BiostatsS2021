install.packages("broom")
install.packages("ggfortify")
library(tidyverse)
library(broom)
library(ggfortify)


tooth <- filter(ToothGrowth, dose==0.5)
tooth_lm=lm(len~supp, data=tooth)
tooth_lm %>% tidy()
tooth_lm %>% augment() %>% 
  ggplot(aes(sample=.resid))+
  geom_qq()+
  geom_qq_line()

autoplot(tooth_lm)


tooth %>% 
  group_by(supp) %>% 
  summarise(var=var(len))



beer <- read_csv("data/chap12q27BeerGlassShape.csv")
lm_beer <- lm(drinkingMinutes~glassShape, data=beer)
summary(lm_beer)
lm_beer %>% augment() %>% 
  ggplot(aes(sample=.resid))+
  geom_qq()+
  geom_qq_line()
beer %>% 
  group_by(glassShape) %>% 
  summarise(vars=var(drinkingMinutes))
lm_beer %>% augment()
