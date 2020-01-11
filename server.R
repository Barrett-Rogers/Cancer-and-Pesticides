



pts <- data.frame(
  x = rnorm(10, mean = -93.625), 
  y = rnorm(10, mean = 42.0285)
)

# Lym_by_Year3 <- 

shinyServer(
     function(input, output) {
       
       output$NeoMap <-renderPlotly({
         g <- list(
           scope = 'usa',
           projection = list(type = 'albers usa'))

         plot_geo(CP_Abb, locationmode = 'USA-states') %>%
           add_trace(
             z = ~Crude_Rate, locations = ~Abbreviation,
             color = ~Crude_Rate, colors = 'Blues'
           ) %>%
           colorbar(title = "Age Adjusted Rate") %>%
           layout(
             title = 'Neoplasm Deaths 1999-2017',
             geo = g
           )})
         
       output$LymMap <-renderPlotly({
         g <- list(
           scope = 'usa',
           projection = list(type = 'albers usa'))
         
         plot_geo(Lym_Abb, locationmode = 'USA-states') %>%
           add_trace(
             z = ~Crude_Rate, locations = ~Abbreviation,
             color = ~Crude_Rate, colors = 'Purples'
           ) %>%
           colorbar(title = "Age Adjusted Rate") %>%
           layout(
             title = 'Lymphoma Deaths 1999-2017',
             geo = g
             
           )})
        output$map2 <- renderLeaflet({
           leaflet() %>% 
             addTiles() %>% 
             setView(-86.5804, 35.5175, zoom = 7)
        })
        output$picture <- renderImage({
          return(list(src = "Roundup_image.PNG", contentType = "image/png", alt = "Alignment"))
        }, deleteFile = FALSE) #where the src is wherever you have the picture
        
     })
  
            
# output$plot <- renderPlotly({
#   g <- list(
#     scope = 'usa',
#     projection = list(type = 'albers usa')
#   )
#   plot_ly(z = CP_Abb()[[input$var]], text = df()[[STATE]], locations = df()[[STATE]],
#           type = 'choropleth', locationmode = 'USA-states') %>%
#     layout(geo = g)
# })
        
  # observe({
  # 
  #   tab1 <- leafletProxy('map1', data = pts) %>%
  #     clearMarkers() %>%
  #     addCircleMarkers(lng = ~x, lat = ~y, radius = input$radius)
  #   
  #   tab2 <- leafletProxy('map2', data = pts) %>%
  #     clearMarkers() %>%
  #     addCircleMarkers(lng = ~x, lat = ~y, radius = input$radius)
  # 
  # })

  
           
           
           
           
           
           
     #       Lymp %>%
     #         filter(Year == input$Year) %>%
     #         ggplot(aes(x = Deaths)) +
     #         geom_histogram() +
     #         labs(title = paste('Deaths by State', input$Year),
     #              y = "Frequency",
     #              x = "Distribution of the Population")
     #     })
     #     
     #     
     # })








  
  
  
  # output$map1 <- renderLeaflet({
  #   leaflet() %>%
  #     addTiles() %>%
  #     setView(-98.5795, 39.8283, zoom = 4)