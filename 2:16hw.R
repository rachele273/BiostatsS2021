library(tidyverse)
install.packages("forcats")
library(forcats)
tigers <- read.csv("data/chap02e2aDeathsFromTigers.csv")
glimpse(tigers)
#tigers <- tigers %>% 
  #mutate(region=fct_reorder(activity, count,desc=TRUE))
tigers <- tigers %>%
  mutate(activity = fct_infreq(activity),
         activity = fct_rev(activity))
ggplot(tigers, aes(x = activity)) +
  geom_bar()+ 
  coord_flip()

       
ggplot(tigers, aes(x=forcats::fct_infreq(activity)))+
  geom_bar()+
  coord_flip()+
  labs(x="activity")
island_tibble <- tibble(island_area = islands)
island_tibble
ggplot(island_tibble, aes(x=island_area))+
  geom_histogram(binwidth=1000)
plot <- ggplot(island_tibble, aes(x=island_area))+
  geom_histogram()+
  scale_x_continuous(trans="log10")+
  annotation_logticks(sides = "b",base = 10, size = .5)
annotation <- data.frame(
  island_area = c(1000),
  count= c(2),
  label = c("continents"))
plot+geom_text(data=annotation, aes(x=island_area, y=count, label=label))
