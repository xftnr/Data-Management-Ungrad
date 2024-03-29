tabItem(tabName = "boxplot2",
        tabsetPanel( 
          tabPanel("Plots"),
          tabPanel("Data", 
                   dataTableOutput('table__3_'),
                   downloadButton('download__3_',"Download the data")),
          tabPanel("Plot Size", 
                   numericInput("plotWidth__3_", "Plot Width (Required)", 1000),
                   numericInput("plotHeight__3_", "Plot Height (Required)", NA)),
          tabPanel("Plot Title",
                   textInput("title__3_", "Title 1", "hours per week vs. age distribution"),
                   numericInput("titleFont__3_", "Title Font", 10)), 
          tabPanel("Plot Legend",
                   textInput("legendTitle__3_", "Legend Title", "Workclass"),
                   numericInput("legendTitleSize__3_", "Legend Title Size", 10),
                   numericInput("legendItemSize__3_", "Legend Item Size", 10),
                   numericInput("legendKeySize__3_", "Legend Key Size", 5)), 
          tabPanel("Axis Labels",
                   textInput("xLabel__3_", "x-Axis Label", "Age"),
                   textInput("yLabel__3_", "y-Axis Label 1", "Avg hours per week"),
                   numericInput("textFont__3_", "textFont", 10)),
          tabPanel("Data Size", 
                   numericInput("yDataMin__3_", "yData Minimum (Required)", 0),
                   numericInput("yDataMax__3_", "yData Maximum (Required)", NA))),
        plotlyOutput("Boxplot__3_", height=800)
)