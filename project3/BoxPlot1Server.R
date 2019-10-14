# Build Download Button and Output DataTable---------------
  output$download__2_ <- downloadHandler(
    filename = function(){"Boxplot.csv"}, 
    content = function(fname){
      write.csv(dfB1(), fname)
    }
  )
  output$table__2_ <- renderDataTable({
    DT::datatable(dfB1() , rownames = FALSE, extensions = list(Responsive = TRUE, FixedHeader = TRUE)
    )
  })
# ---------------------------------------------------------
# Build and Output Throughput Plot ------------------------
  output$Boxplot__2_ <- renderPlotly({
    plot = dfB1() %>% ggplot() + 
      geom_boxplot(mapping = aes(x = race, y=hours_per_week, colour = workclass)) +
      
      theme_bw() +
      theme(plot.title = element_text(size = input$titleFont__2_, face = "bold")) + 
      theme( 
        legend.title=element_text(size=input$legendTitleSize__2_), 
        legend.text=element_text(size=input$legendItemSize__2_),
        legend.key = element_rect(size = input$legendKeySize__2_),
        legend.key.size = unit(input$legendKeySize__2_, 'lines')) +
      theme(axis.text=element_text(size=input$textFont__2_),
            axis.title=element_text(size=input$textFont__2_, face="bold"),
            axis.text.x = element_text(angle = 45, hjust = 1))  +
      theme(plot.margin=unit(c(2,2,2,2,2,2,2,2),"cm")) +
      scale_y_continuous(labels = scales::comma) + # Disable scientific notation
      ggtitle(paste(Workclasses(), input$title__2_)) +
      xlab(input$xLabel__2_) + ylab(input$yLabel__2_) +
      theme(axis.title.y = element_text(margin = margin(t = 10, r = 10, b = 10, l = 10))) +
      scale_color_discrete(name = input$legendTitle__2_)
    
    if( ! is.na(input$plotWidth__2_) & ! is.na(input$plotHeight__2_))
     ggplotly(plot, tooltip = c("race"), session="knitr", width = input$plotWidth__2_, height = input$plotHeight__2_)
    else
      ggplotly(plot, tooltip = c("race"), session="knitr") 
  })
# ---------------------------------------------------------
