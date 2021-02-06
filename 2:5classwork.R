ggplot(penguins, aes(x=flipper_length_mm))+
  geom_histogram()
#the distribution is bimodal
penguins %>% 
  group_by(species,sex) %>% 
  summarize(meanlength=round(mean(flipper_length_mm), digits=2)) %>% 
  arrange(meanlength)
library(palmerpenguins)
penguins<-penguins
penguins %>% 
  group_by(sex, species) %>% 
  summarise(n_ok=sum(!is.na(flipper_length_mm)))
  summarise(mean_flip=mean(flipper_length_mm, na.rm=TRUE)) %>% 
  var_flip=sum((flipper_length_mm-mean_flip)^2)/(n_ok-1)
ggplot(penguins, aes(x=flipper_length_mm, y=bill_depth_mm, color=species))+
         geom_point()
penguins %>% 
  group_by(species) %>% 
  filter(!is.na(flipper_length_mm), !is.na(bill_depth_mm)) %>% 
  summarise(corr=cor(flipper_length_mm, bill_depth_mm))
