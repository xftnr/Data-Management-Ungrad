# Change all __5_s, Download information, and edit the plot and ggplotly arguments below:
# Build Download Button and Output DataTable---------------
  output$download__5_ <- downloadHandler(
    filename = function(){"Histogram.csv"}, 
    content = function(fname){
      write.csv(dfA1() %>% dplyr::group_by(category) %>% dplyr::summarize(avg_shipping_cost = mean(shipping_cost)) %>% dplyr::inner_join(., dfA1(), by=c("category")), fname)
    }
  )
  output$table__5_ <- renderDataTable({
    DT::datatable(dfA1() %>% dplyr::group_by(category) %>% dplyr::summarize(avg_shipping_cost = mean(shipping_cost)) %>% dplyr::inner_join(., dfA1(), by=c("category")), rownames = FALSE, extensions = list(Responsive = TRUE, FixedHeader = TRUE)
    )
  })
# ---------------------------------------------------------
# Build and Output Throughput Plot ------------------------
  output$Histogram__5_ <- renderPlotly({
    plot = dfA1() %>% dplyr::group_by(category) %>% dplyr::summarize(avg_shipping_cost = round(mean(shipping_cost), 2)) %>% dplyr::inner_join(., dfA1(), by=c("category")) %>% ggplot() + 
      geom_histogram(mapping = aes(x=shipping_cost, colour = region, fill = region), binwidth = 10) +
      geom_line(mapping=aes(x=shipping_cost, y=avg_shipping_cost)) +
      coord_flip() +
      geom_text(aes(x=125, y=10, label=avg_shipping_cost)) +
      facet_wrap( ~ category, ncol=1) +
      
      theme_bw() +
      theme(plot.title = element_text(size = input$titleFont__5_, face = "bold")) + 
      theme( # Legend Attributes - see https://github.com/tidyverse/ggplot2/wiki/Legend-Attributes
        legend.title=element_text(size=input$legendTitleSize__5_), 
        legend.text=element_text(size=input$legendItemSize__5_),
        legend.key = element_rect(size = input$legendKeySize__5_),
        legend.key.size = unit(input$legendKeySize__5_, 'lines')) +
      theme(axis.text=element_text(size=input$textFont__5_),
            axis.title=element_text(size=input$textFont__5_, face="bold"),
            axis.text.x = element_text(angle = 45, hjust = 1))  +
      theme(plot.margin=unit(c(2,2,2,2),"cm")) +
      scale_y_continuous(labels = scales::comma) + # Disable scientific notation
      ggtitle(paste(Regions(), input$title__5_)) +
      xlab(input$xLabel__5_) + ylab(input$yLabel__5_) +
      theme(axis.title.y = element_text(margin = margin(t = 10, r = 10, b = 10, l = 10))) +
      scale_color_discrete(name = input$legendTitle__5_)
    
    if( ! is.na(input$plotWidth__5_) & ! is.na(input$plotHeight__5_))
     ggplotly(plot, tooltip = c("profit"), session="knitr", width = input$plotWidth__5_, height = input$plotHeight__5_)
    else
      ggplotly(plot, tooltip = c("profit"), session="knitr") 
  })
# ---------------------------------------------------------
