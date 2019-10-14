dfB <- eventReactive(c(input$selectworkclass_1), { 
  project <- "https://data.world/xftnr/s18-db-project-3-dataset" 
  data.world::set_config(cfg_env("DW_API")) 
  paramQuery <- data.world::qry_sql(
    "   
    select workclass, hours_per_week, race
    from adult_new
    where workclass in (?, ?, ?, ?, ?, ?, ?, ?)
    order by workclass
    ")
  paramQuery$params <- c(input$selectworkclass_1[1], input$selectworkclass_1[2], input$selectworkclass_1[3], input$selectworkclass_1[4], input$selectworkclass_1[5], input$selectworkclass_1[6], input$selectworkclass_1[7], input$selectworkclass_1[8])
  data.world::query(paramQuery, dataset = project)
})

dfB1 <- eventReactive(c(input$selectworkclass_1, input$yDataMin__2_, input$yDataMax__2_), { 
  if( ! is.na(input$yDataMin__2_) & ! is.na(input$yDataMax__2_)) {
    dfB() %>% dplyr::filter(between(hours_per_week, input$yDataMin__2_, input$yDataMax__2_))
  }
  else {
    dfB()
  }
})
