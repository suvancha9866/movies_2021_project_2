library(calendR)
library(tidyverse)

movie_calendar <- calendR(title = "Release Dates for Movies in 2021",
                          year = 2021,
                          special.days = c(351, 246, 274, 190, 176, 309, 356, 281, 148, 323, 225, 211, 295, 90, 328, 288, 148, 197, 155, 239),
                          special.col = "#4169e1",
                          weeknames = c("M", "T", "W", "T", "F", "S", "S"),
                          font.family = "serif",
                          weeknames.col = "black",
                          months.col = "black",
                          days.col = 2)

ggsave("movie_calendar.png", movie_calendar)
