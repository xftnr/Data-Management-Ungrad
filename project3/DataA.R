dfA <- eventReactive(c(input$selectrelationship_1), { 
  project <- "https://data.world/xftnr/s18-db-project-3-dataset" 
  data.world::set_config(cfg_env("DW_API")) 
  paramQuery <- data.world::qry_sql(
    "   
    select relationship, age
    from adult_new
    where relationship in (?, ?, ?, ?, ?, ?)
    order by relationship
    ")
  paramQuery$params <- c(input$selectrelationship_1[1], input$selectrelationship_1[2], input$selectrelationship_1[3], input$selectrelationship_1[4],input$selectrelationship_1[5],input$selectrelationship_1[6])
  data.world::query(paramQuery, dataset = project)
})

dfA1 <- eventReactive(c(input$selectrelationship_1, input$yDataMin__1_, input$yDataMax__1_), { 
  if( ! is.na(input$yDataMin__1_) & ! is.na(input$yDataMax__1_)) {
    dfA() %>% dplyr::filter(between(age, input$yDataMin__1_, input$yDataMax__1_))
  }
  else {
    dfA()
  }
})
