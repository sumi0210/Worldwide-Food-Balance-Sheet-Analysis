library(shiny)
library(dplyr)
library(ggplot2)
library(tidyr)
library(plotly)
library(ggthemes)




function(input, output) {
  output$element <- renderPlotly(
    fbs_unit %>%
      filter(Area %in% c(input$Area, input$Area2, input$Area3, input$Area4, input$Area5, input$Area6) & Item == input$Item & Element %in% c(input$Element, input$Element2, input$Element3) & Year == input$Year) %>%
      group_by(Area, Item, Element) %>%
      summarize(Amount = sum(`1000 tonnes`)) %>%
      ggplot(aes(x = Area)) +
      geom_bar(aes(fill = Element, y = Amount), stat = "identity", position = "dodge") +
      scale_x_discrete(name = "Region") +
      ggtitle("Total Amount (1000 Tonnes)")
    
  )
  
  
  output$per_capita <- renderPlotly(
    fbs_unit %>%
      filter(Area %in% c(input$Area, input$Area2, input$Area3, input$Area4, input$Area5, input$Area6) & Item %in% c("Grand Total, All Foods", input$Item) & Year == input$Year & Element == c("Food supply (kcal/capita/day)")) %>%
      select(Area, Year, Unit, Element, Item) %>%
      ggplot(aes(x = factor(Area), y = Unit, group = 1)) +
      geom_line(aes(col = Item)) + 
      geom_point(aes(col = Item)) +
      scale_x_discrete(name = "Region") +
      scale_y_continuous(name = "Amount") +
      ggtitle("Supply (kcal/capita/day)")

  )
  
  
  output$supply <- renderPlotly(
    fbs_supply %>%
      filter(Area %in% c(input$Area_num1, input$Area_num2, input$Area_num3, input$Area_num4, input$Area_num5, input$Area_num6) & Element == input$Unit & Year %in% c("1994", "1995", "1996", "1997", "1998", "1999", "2000", "2001", "2002", "2003", "2004", "2005", "2006", "2007", "2008", "2009", "2010", "2011", "2012", "2013")) %>%
      select(Area, Year, Unit, Element) %>% 
      ggplot(aes(x = Year, y = Unit, group = 1)) +
      geom_line(aes(col = Area)) +
      labs(col = "Region") +
      scale_y_continuous(name = "Total Units") +
      ggtitle(input$Unit) +
      theme(axis.text.x = element_text(angle = 45, vjust = 1, hjust=1))
    
  )
  
  
  output$topmost <- renderPlotly(
    fbs_top %>%
      filter(Area %in% c(input$Area_r1, input$Area_r2, input$Area_r3, input$Area_r4, input$Area_r5, input$Area_r6, input$Area_r7, input$Area_r8, input$Area_r9, input$Area_r10, input$Area_r11, input$Area_r12) & Year == input$Year2 & Element == "Food supply quantity (kg/capita/yr)") %>%
      select(Area, Item, Value) %>%
      group_by(Area) %>%
      top_n(1, Value) %>%
      ggplot(aes(x = Area)) +
      geom_bar(aes(fill = Item, y = Value), stat = "identity") +
      scale_y_continuous(name = "Total Units") +
      ggtitle("Topmost Food Supplies (kg/capita/yr)") +
      theme(axis.text.x = element_text(angle = 45, vjust = 1, hjust=1))

  )

  
  output$topmost2 <- renderPlotly(
    fbs_top %>%
      filter(Area %in% c(input$Area_s1, input$Area_s2, input$Area_s3, input$Area_s4, input$Area_s5, input$Area_s6, input$Area_s7, input$Area_s8, input$Area_s9, input$Area_s10, input$Area_s11, input$Area_s12) & Year == input$Year3 & Element == "Food supply (kcal/capita/day)") %>%
      select(Area, Item, Value) %>%
      group_by(Area) %>%
      top_n(1, Value) %>%
      ggplot(aes(x = Area)) +
      geom_bar(aes(fill = Item, y = Value), stat = "identity") +
      scale_y_continuous(name = "Total Units") +
      scale_fill_brewer(palette = "Accent") +
      ggtitle("Topmost Food Supplies (kcal/capita/day)") +
      theme(axis.text.x = element_text(angle = 45, vjust = 1, hjust=1))
    
  )

  output$food_kg <- renderPlotly(
    fbs_food %>%
      filter(Area %in% c(input$Area_x1, input$Area_x2, input$Area_x3, input$Area_x4, input$Area_x5, input$Area_x6) & Item == input$Item2 & Year %in% c("1994", "1995", "1996", "1997", "1998", "1999", "2000", "2001", "2002", "2003", "2004", "2005", "2006", "2007", "2008", "2009", "2010", "2011", "2012", "2013")) %>%
      select(Area, Year, kg, Item) %>% 
      ggplot(aes(x = Year, y = kg, group = 1)) +
      geom_line(aes(col = Area)) +
      labs(col = "Region") +
      scale_y_continuous(name = "Total kg/capita/day") +
      ggtitle(input$Item2) +
      theme(axis.text.x = element_text(angle = 45, vjust = 1, hjust=1))
    
  )
  
  
}