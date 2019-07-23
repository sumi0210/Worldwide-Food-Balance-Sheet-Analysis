library(shiny)


navbarPage("Worldwide Food Balance Sheet Analysis",
  
  tabPanel("Food Elements by Country",
  sidebarLayout(
    
    sidebarPanel(
      selectizeInput(inputId = "Area",
                     label = "Country or Region 1",
                     choices = unique(fbs_unit$Area), selected = "Afghanistan"),
      selectizeInput(inputId = "Area2",
                     label = "Country or Region 2",
                     choices = unique(fbs_unit$Area), selected = "Bangladesh"),
      selectizeInput(inputId = "Area3",
                     label = "Country or Region 3",
                     choices = unique(fbs_unit$Area), selected = "China, mainland"),
      selectizeInput(inputId = "Area4",
                     label = "Country or Region 4",
                     choices = unique(fbs_unit$Area), selected = "Ethiopia"),
      selectizeInput(inputId = "Area5",
                     label = "Country or Region 5",
                     choices = unique(fbs_unit$Area), selected = "France"),
      selectizeInput(inputId = "Area6",
                     label = "Country or Region 6",
                     choices = unique(fbs_unit$Area), selected = "United States of America"),
      selectizeInput(inputId = "Item",
                     label = "Item Type",
                     choices = unique(fbs_unit$Item), selected = "Cereals - Excluding Beer"),
      selectizeInput(inputId = "Element",
                     label = "Feed / Food / Loss 1",
                     choices = c("Food", "Feed", "Losses"), selected = "Food"),
      selectizeInput(inputId = "Element2",
                     label = "Feed / Food / Loss 2",
                     choices = c("Food", "Feed", "Losses"), selected = "Feed"),
      selectizeInput(inputId = "Element3",
                     label = "Feed / Food / Loss 3",
                     choices = c("Food", "Feed", "Losses"), selected = "Losses"),
      selectizeInput(inputId = "Year",
                     label = "Year",
                     choices = unique(fbs_unit$Year), selected = "2013")
      
    ),
    
    mainPanel(
      fluidRow(
        plotlyOutput("element")
    ),
      fluidRow(
        plotlyOutput("per_capita")
        )
      
      )
    )
        
  ),
  navbarMenu("Supply Trends",
      tabPanel("by units of weight",
      sidebarLayout(
        
        sidebarPanel(
          selectizeInput(inputId = "Area_x1",
                         label = "Country or Region 1",
                         choices = unique(fbs_food$Area), selected = "Afghanistan"),
          selectizeInput(inputId = "Area_x2",
                         label = "Country or Region 2",
                         choices = unique(fbs_food$Area), selected = "Bangladesh"),
          selectizeInput(inputId = "Area_x3",
                         label = "Country or Region 3",
                         choices = unique(fbs_food$Area), selected = "China, mainland"),
          selectizeInput(inputId = "Area_x4",
                         label = "Country or Region 4",
                         choices = unique(fbs_food$Area), selected = "Ethiopia"),
          selectizeInput(inputId = "Area_x5",
                         label = "Country or Region 5",
                         choices = unique(fbs_food$Area), selected = "France"),
          selectizeInput(inputId = "Area_x6",
                         label = "Country or Region 6",
                         choices = unique(fbs_food$Area), selected = "United States of America"),
          selectizeInput(inputId = "Item2",
                         label = "Food Element",
                         choices = unique(fbs_food$Item), selected = "Cereals, Other")
      ),
      
      mainPanel(
        plotlyOutput("food_kg")
        
      )
      
    ) 
  ),
  
    tabPanel("by units of energy",
           sidebarLayout(
             
             sidebarPanel(
               selectizeInput(inputId = "Area_num1",
                              label = "Country or Region 1",
                              choices = unique(fbs_supply$Area), selected = "Afghanistan"),
               selectizeInput(inputId = "Area_num2",
                              label = "Country or Region 2",
                              choices = unique(fbs_supply$Area), selected = "Bangladesh"),
               selectizeInput(inputId = "Area_num3",
                              label = "Country or Region 3",
                              choices = unique(fbs_supply$Area), selected = "China, mainland"),
               selectizeInput(inputId = "Area_num4",
                              label = "Country or Region 4",
                              choices = unique(fbs_supply$Area), selected = "Ethiopia"),
               selectizeInput(inputId = "Area_num5",
                              label = "Country or Region 5",
                              choices = unique(fbs_supply$Area), selected = "France"),
               selectizeInput(inputId = "Area_num6",
                              label = "Country or Region 6",
                              choices = unique(fbs_supply$Area), selected = "United States of America"),
               selectizeInput(inputId = "Unit",
                              label = "Unit of Measure",
                              choices = unique(fbs_supply$Element))
             ),
             
             mainPanel(
               plotlyOutput("supply")
             )
          )
          
      )
  
  ),
  
  
  navbarMenu("Foods Sources",
      tabPanel("by units of weight",
        sidebarLayout(

          sidebarPanel(
              selectizeInput(inputId = "Area_r1",
                                  label = "Country or Region 1",
                                  choices = unique(fbs_top$Area), selected = "Afghanistan"),
              selectizeInput(inputId = "Area_r2",
                                  label = "Country or Region 2",
                                  choices = unique(fbs_top$Area), selected = "Bangladesh"),
              selectizeInput(inputId = "Area_r3",
                                  label = "Country or Region 3",
                                  choices = unique(fbs_top$Area), selected = "China, mainland"),
              selectizeInput(inputId = "Area_r4",
                                  label = "Country or Region 4",
                                  choices = unique(fbs_top$Area), selected = "Egypt"),
              selectizeInput(inputId = "Area_r5",
                                  label = "Country or Region 5",
                                  choices = unique(fbs_top$Area), selected = "France"),
              selectizeInput(inputId = "Area_r6",
                                  label = "Country or Region 6",
                                  choices = unique(fbs_top$Area), selected = "United States of America"),
              selectizeInput(inputId = "Area_r7",
                                  label = "Country or Region 7",
                                  choices = unique(fbs_top$Area), selected = "Italy"),
              selectizeInput(inputId = "Area_r8",
                                  label = "Country or Region 8",
                                  choices = unique(fbs_top$Area), selected = "Nigeria"),
              selectizeInput(inputId = "Area_r9",
                                  label = "Country or Region 9",
                                  choices = unique(fbs_top$Area), selected = "India"),
              selectizeInput(inputId = "Area_r10",
                                  label = "Country or Region 10",
                                  choices = unique(fbs_top$Area), selected = "Barbados"),
              selectizeInput(inputId = "Area_r11",
                                  label = "Country or Region 11",
                                  choices = unique(fbs_top$Area), selected = "Germany"),
              selectizeInput(inputId = "Area_r12",
                                  label = "Country or Region 12",
                                  choices = unique(fbs_top$Area), selected = "Sweden"),
              selectizeInput(inputId = "Year2",
                                  label = "Year",
                                  choices = unique(fbs_top$Year), selected = "2013")
            
          
  ),
  
  mainPanel(
    plotlyOutput("topmost", height = 500)
    
    )
  
    )
    
  ),
  
    tabPanel("by units of energy",
             sidebarLayout(
               
               sidebarPanel(
                 selectizeInput(inputId = "Area_s1",
                                label = "Country or Region 1",
                                choices = unique(fbs_top$Area), selected = "Afghanistan"),
                 selectizeInput(inputId = "Area_s2",
                                label = "Country or Region 2",
                                choices = unique(fbs_top$Area), selected = "Bangladesh"),
                 selectizeInput(inputId = "Area_s3",
                                label = "Country or Region 3",
                                choices = unique(fbs_top$Area), selected = "China, mainland"),
                 selectizeInput(inputId = "Area_s4",
                                label = "Country or Region 4",
                                choices = unique(fbs_top$Area), selected = "Egypt"),
                 selectizeInput(inputId = "Area_s5",
                                label = "Country or Region 5",
                                choices = unique(fbs_top$Area), selected = "France"),
                 selectizeInput(inputId = "Area_s6",
                                label = "Country or Region 6",
                                choices = unique(fbs_top$Area), selected = "United States of America"),
                 selectizeInput(inputId = "Area_s7",
                                label = "Country or Region 7",
                                choices = unique(fbs_top$Area), selected = "Italy"),
                 selectizeInput(inputId = "Area_s8",
                                label = "Country or Region 8",
                                choices = unique(fbs_top$Area), selected = "Nigeria"),
                 selectizeInput(inputId = "Area_s9",
                                label = "Country or Region 9",
                                choices = unique(fbs_top$Area), selected = "India"),
                 selectizeInput(inputId = "Area_s10",
                                label = "Country or Region 10",
                                choices = unique(fbs_top$Area), selected = "Barbados"),
                 selectizeInput(inputId = "Area_s11",
                                label = "Country or Region 11",
                                choices = unique(fbs_top$Area), selected = "Germany"),
                 selectizeInput(inputId = "Area_s12",
                                label = "Country or Region 12",
                                choices = unique(fbs_top$Area), selected = "Sweden"),
                 selectizeInput(inputId = "Year3",
                                label = "Year",
                                choices = unique(fbs_top$Year), selected = "2013")
                 

      ),
      
      mainPanel(
        plotlyOutput("topmost2", height = 500)
        
      )
      
    )

  )
  
),
  
      tabPanel(" "
  )
  
)
  





         
    




