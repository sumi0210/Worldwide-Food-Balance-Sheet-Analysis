library(tidyverse)
library(shiny)
library(dplyr)
library(ggplot2)
library(tidyr)
library(plotly)




fbs = read.csv(file = "./FoodBalanceSheets.csv", stringsAsFactors = FALSE)


fbs1 = fbs %>%
  filter(Item != "Population") %>% 
  gather(Year, Value, Y1961:Y2013)
  

fbs_unit = fbs1 %>% 
  spread(Unit, Value) %>% 
  mutate(Year = substr(Year, 2, 5)) %>% 
  arrange(Item) %>% 
  mutate(Unit = ifelse(Element == "Food supply (kcal/capita/day)", `kcal/capita/day`, `g/capita/day`)) %>% 
  mutate(Item = ifelse(Item == "Grand Total", "Grand Total, All Foods", Item))


fbs_supply = fbs_unit %>% 
  filter(Item == "Grand Total, All Foods")




as.numeric(fbs_supply$Year)

fbs2 = fbs
fbs_top = fbs2[complete.cases(fbs2),]

fbs_top = fbs_top %>%
  filter(Item != "Population" & Item != "Grand Total") %>%
  gather(Year, Value, Y1961:Y2013) %>%
  mutate(Year = substr(Year, 2, 5))


fbs_food = fbs_unit %>% 
  filter(Element == "Food supply quantity (kg/capita/yr)")



