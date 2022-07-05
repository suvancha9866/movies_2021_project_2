library(tidyverse)

genre_url1 <- "https://www.the-numbers.com/market/2021/genres"
genre_2021 <- read_html(genre_url1) |> 
  html_table()

genre_2021_clean <- genre_2021[[2]] |> 
  clean_names() |> 
  mutate(x2021_gross = parse_number(x2021_gross),
         tickets = parse_number(tickets),
         share = parse_number(share))

genre_graph <- genre_2021_clean |> #Gross Dollar Amount 
  select(genre, x2021_gross) |> 
  ggplot(genre_2021_clean, 
         mapping = aes(x = genre,
                       y = x2021_gross,
                       fill= genre)) +
  geom_col() +
  scale_y_continuous(n.breaks = 12, 
                     limits = c(0,2400000000), 
                     labels = unit_format(prefix = "$", 
                                          unit = "B", 
                                          scale = 1e-9))+
  scale_x_discrete(expand = expansion(), labels = NULL) +
  theme_economist() +
  labs(title = md("Gross Dollar Amount of each type of Genre in 2021"),
       x = "Genre",
       y = "Gross Dollar Amount",
       caption = "Source: Nash Information Services",
       fill = "Genre") +
  theme(text = element_text(family = "serif"),
        axis.title.x = element_text(size = 15),
        axis.title.y = element_text(size = 15),
        axis.text.y = element_text(size = 15),
        legend.text = element_text(size = 13),
        legend.title = element_text(size = 15),
        axis.line.x = element_blank(),
        axis.ticks.x = element_blank(),
        plot.title = element_text(hjust = .5))

ggsave("genre_graph.png", genre_graph)