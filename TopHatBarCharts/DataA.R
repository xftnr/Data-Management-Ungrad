dfA <- eventReactive(c(input$selectRegion_1, input$salesFilter_1), { 
  project <- "https://data.world/cannata/tophatsuperstore" 
  data.world::set_config(cfg_env("DW_API")) 
  paramQuery <- data.world::qry_sql(
    "   
    select region, category, sum(sales) as sum_sales
    from superstore s
    where sales between ? and ? and region in (?, ?, ?, ?)
    group by region, category
    order by region
    ")
  paramQuery$params <- c(input$salesFilter_1[1], input$salesFilter_1[2], input$selectRegion_1[1], input$selectRegion_1[2], input$selectRegion_1[3], input$selectRegion_1[4])
  data.world::query(paramQuery, dataset = project)
})

dfA1 <- eventReactive(c(input$selectRegion_1, input$salesFilter_1, input$yDataMin__1_, input$yDataMax__1_), { 
  if( ! is.na(input$yDataMin__1_) & ! is.na(input$yDataMax__1_)) {
    dfA() %>% dplyr::filter(between(sales, input$yDataMin__1_, input$yDataMax__1_))
  }
  else {
    dfA()
  }
})
