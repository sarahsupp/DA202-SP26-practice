# Intentionally messy script for teaching reproducibility + git conflicts
# You should NOT copy this style into real projects :-)

# my machine path
setwd("~/Desktop/reproducibility-lab")  # <-- will fail for most people

# packages
library(tidyverse)   # may not be installed
library(lubridate)   # may not be installed

# read in the data from my machine
dat <- read.csv("survey_messy.csv")

# types are in the data; I think the data are clean
dat$date <- mdy(dat$date)  # may fail depending on date format

# random sampling
dat_small <- dat %>% sample_n(12)

# compute a summary
mean_score <- mean(dat_small$ExamScore)
cat("Mean exam score (sample):", mean_score, "\n")

# create a plot
p <- ggplot(dat_small, aes(x = Hours_Studied, y = ExamScore, color = major)) +
  geom_point(size = 3) +
  geom_smooth(method = "lm", se = FALSE) +
  ggtitle("Study Hours vs Exam Score")

ggsave("results/plot.png", p, width = 7, height = 5)  # results/ probably missing

# write output to my machine
write.csv(dat_small, "~/Downloads/cleaned_subset.csv", row.names = FALSE)

# "session info" to describe my setup
sessionInfo()
