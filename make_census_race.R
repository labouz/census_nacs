library(tidyverse)
library(tidycensus)


#get tables available via api
v18 <- tidycensus::load_variables(2018, "acs5")

#scan census tables
scan <- c()

#get vars with races

tables_with_races <- v18 %>% 
  filter(nchar(name) == 11) %>% 
  mutate(table_num = str_sub(name, 1, 6),
         race = str_sub(name,7,7),
         element = str_sub(name, 9, nchar(name))) %>% 
  select(-name)
