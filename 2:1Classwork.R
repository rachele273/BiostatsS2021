produce<-read_csv("data/produce-1.csv")
glimpse(produce)
view(produce)
produce<-produce%>%
  mutate(mean_price=(WholeFoods+CubFoods)/2)%>%
  mutate(cub_savings=(WholeFoods-CubFoods))%>%
  mutate(relative_cub_savings=(cub_savings/mean_price))%>%
  mutate(same_or_cheaper=case_when(cub_savings==0 ~"same", cub_savings>0 ~"cheaper", cub_savings<0 ~"more expensive"))
produce<-produce%>%
  arrange(mean_price)
ggplot(produce, aes(x=relative_cub_savings))+
         geom_histogram()
ggplot(produce, aes(x=CubFoods, y=WholeFoods, label=Product))+
  geom_text()
