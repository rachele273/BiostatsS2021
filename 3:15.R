#march 15
library(tidyverse)
library(broom)
temp_file <- " https://whitlockschluter3e.zoology.ubc.ca/Data/chapter11/chap11e3Temperature.csv  "
human_temp <- read_csv("data/chap11e3Temperature.csv")
n <- 25
se <- sqrt(0.4594)/sqrt(n)
t <- (98.524-98.6)/se

#confidence interval (mean+- (stanrdard error*critical t))
alpha <- .05
crit_t <- qt(p=1-alpha/2, df=n-1,   )
98.524-crit_t*se
98.524+crit_t*se

#test null 
2*pt(q=abs(t), df=n-1, lower.tail=FALSE)
cohensd <- (98.524-98.6)/(sqrt(0.4594))
2*pt(q=2, df=15, lower.tail=FALSE)

qt(p=.975, df=15)


human_temp %>% 
  summarise(n=n(), 
            se=sd(temperature)/sqrt(n), 
            t=(mean(temperature)-98.6)/se,
            crit_t=qt(.975, df=n-1, lower.tail=TRUE), 
            lower_95CI=mean(temperature)-se*crit_t)
t.test(pull(human_temp, temperature), mu=98.6) %>% 
  tidy()
ggplot(human_temp, aes(sample=temperature))+
  geom_qq()+
  geom_qq_line()


marine_dat <- read_csv("data/chap13e1MarineReserve.csv")
ggplot(marine_dat, aes(sample=biomassRatio))+
  geom_qq()+
  geom_qq_line()
ggplot(marine_dat, aes(x=biomassRatio))+
  geom_histogram()

#binomial test
marine_dat %>% 
  summarise(n=n(), 
            gr1=sum(biomassRatio>1))
binom.test(31, n=32, p=.5)

marine_dat <- marine_dat %>% 
  mutate(log_ratio = log(biomassRatio))

ggplot(marine_dat, aes(sample=log_ratio))+
  geom_qq()+
  geom_qq_line()


ggplot(marine_dat, aes(x=log_ratio))+
  geom_density()
meanmarine <- mean(marine_dat$log_ratio)
marine_dat %>% 
  summarise(mean=mean(log_Ratio),
            n=n(),
            sd=sd(log_ratio), 
            se=sd/sqrt(n)
sdmarine<-sd(marine_dat$log_ratio)
semarine <- sdmarine/sqrt(32)

crit_t <- qt(0.975, 31)
t <- (meanmarine-0)/semarine
2*pt(q=t, df=31, lower.tail=FALSE)         
