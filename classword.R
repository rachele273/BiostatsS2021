pnorm(2.10, mean=0, sd=1, lower.tail=FALSE)
pnorm(-2, mean=0, sd=1, lower.tail=FALSE)
pnorm(2, mean=0, sd=1, lower.tail=FALSE)
.977-0.0227
pnorm(-.45, mean=0, sd=1)
rnorm(2.10)
summarise(rnorm(2.10))
n_reps <- 500000
sim_standard_norm <- tibble(sim_val = rnorm(n = n_reps, mean = 0, sd = 1))

sim_standard_norm %>%
  summarise(mean(sim_val > 2.1))
sim_standard_norm %>%
  summarise(mean(sim_val > -2 & sim_val < 2))
sim_standard_norm %>%
  summarise(mean(sim_val < -0.45))
n_reps <- 10000
sample_size <- 1
tibble(rand_num = rnorm(n = n_reps * sample_size, mean = -5, sd = 5),
       rep_num = rep(1:n_reps, each = sample_size)) %>%
  group_by(rep_num)%>%
  summarise(rand_mean = mean(rand_num)) %>%
  summarise(p_gr_neg5.2 = mean(rand_mean > -5.2))
n_reps <- 10000
sample_size <- 20
tibble(rand_num = rnorm(n = n_reps * sample_size, mean = -5, sd = 5),
       rep_num = rep(1:n_reps, each = sample_size)) %>%
  group_by(rep_num)%>%
  summarise(rand_mean = mean(rand_num)) %>%
  summarise(p_gr_neg5.2 = mean(rand_mean > -5.2))

n_reps <- 10000
sample_size <- 50
tibble(rand_num = rnorm(n = n_reps * sample_size, mean = -5, sd = 5),
       rep_num = rep(1:n_reps, each = sample_size)) %>%
  group_by(rep_num)%>%
  summarise(rand_mean = mean(rand_num)) %>%
  summarise(p_gr_neg5.2 = mean(rand_mean > -5.2))


pnorm(-5.2, mean=-5, sd=5, lower.tail=TRUE)
