# Change "Both", all __3_s, and edit tiles below:
tabItem(tabName = "Both",
        tabsetPanel( 
          tabPanel("Plots"),# To create a tab panel - see https://shiny.rstudio.com/reference/shiny/latest/tabPanel.html
          tabPanel("Data", 
             dataTableOutput('table__3_'),
             downloadButton('download__3_',"Download the data")),
          tabPanel("Plot Size", 
             numericInput("plotWidth__3_", "Plot Width (Required)", 1000),
             numericInput("plotHeight__3_", "Plot Height (Required)", NA)),
          tabPanel("Plot Title",
             textInput("title__3_", "Title 1", "Region Shipping Costs"),
             numericInput("titleFont__3_", "Title Font", 10)), 
          tabPanel("Plot Legend",
             textInput("legendTitle__3_", "Legend Title", "Regions"),
             numericInput("legendTitleSize__3_", "Legend Title Size", 10),
             numericInput("legendItemSize__3_", "Legend Item Size", 10),
             numericInput("legendKeySize__3_", "Legend Key Size", 5)), 
          tabPanel("Axis Labels",
             textInput("xLabel__3_", "x-Axis Label", "Shipping Costs"),
             textInput("yLabel__3_", "y-Axis Label 1", "Shipping Costs Count"),
             numericInput("textFont__3_", "textFont", 10))),
        plotlyOutput("Both__3_", height=800)
)
