library(tidyverse)
Orange
glimpse(Orange)
ggplot(data=Orange, aes(x=age, y=circumference, color=Tree))+
         geom_line()
ggplot(data=Orange, aes(x=age, y=circumference))+
      geom_line()+
      facet_wrap(~Tree) 
titanic<- read_csv("data/titanic3.csv")
titanic<-titanic %>% 
  mutate(survivor=case_when(survived==0 ~"No", survived==1 ~"Yes")) %>% 
  mutate(class=case_when(pclass==1 ~"First", pclass==2 ~"Second", pclass==3 ~"Third"))

ggplot(data=titanic, aes(x=survivor, fill=class))+
  geom_bar()
ggplot(data = titanic, aes(x = survivor,  fill= pclass))+
  geom_bar(position = position_dodge(preserve = "single"))
  