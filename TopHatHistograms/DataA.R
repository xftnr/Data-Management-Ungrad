dfA <- eventReactive(c(input$selectRegion_1), { 
  project <- "https://data.world/cannata/tophatsuperstore" 
  data.world::set_config(cfg_env("DW_API")) 
  paramQuery <- data.world::qry_sql(
    "   
    select region, shipping_cost, category
    from superstore s
    where region in (?, ?, ?, ?)
    order by region
    ")
  paramQuery$params <- c(input$selectRegion_1[1], input$selectRegion_1[2], input$selectRegion_1[3], input$selectRegion_1[4])
  data.world::query(paramQuery, dataset = project)
})

dfA1 <- eventReactive(c(input$selectRegion_1, input$yDataMin__1_, input$yDataMax__1_), { 
  if( ! is.na(input$yDataMin__1_) & ! is.na(input$yDataMax__1_)) {
    dfA() %>% dplyr::filter(between(shipping_cost, input$yDataMin__1_, input$yDataMax__1_))
  }
  else {
    dfA()
  }
})
