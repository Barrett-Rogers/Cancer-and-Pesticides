



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
         
       #LymMap
       output$LymMap <-renderPlotly({
         g <- list(
           scope = 'usa',
           projection = list(type = 'albers usa'))
         
         Lym_Abb %>%
           filter(Year == input$year) %>%
          plot_geo(locationmode = 'USA-states') %>%
           add_trace(
             z = ~Crude_Rate, locations = ~Abbreviation,
             color = ~Crude_Rate, colors = 'Purples'
           ) %>%
           colorbar(title = "Crude Rate") %>%
           layout(
             title = 'Lymphoma Deaths',  #Need to make the title height better..........................!!!!
             geo = g
             
           )})
       #GlyMap
       output$GlyMap <-renderPlotly({
         g <- list(
           scope = 'usa',
           projection = list(type = 'albers usa'))
         
        Gly %>%
           filter(Year == input$year) %>%
           plot_geo(locationmode = 'USA-states') %>%
           add_trace(
             z = ~Soybeans, locations = ~Abbreviation,
             color = ~Soybeans, colors = 'Purples'
           ) %>%
           colorbar(title = "Glyphosate Applied") %>%
           layout(
             title = 'Glyphosate',
             geo = g
             
           )})
        output$LymMap_Leaf <- renderLeaflet({
           leaflet() %>% 
             addTiles() %>% 
             setView(-86.5804, 35.5175, zoom = 7) %>% 
            Lym_Abb %>%
            filter(Year == input$year) 
            
        })
        output$picture <- renderImage({
          return(list(src = "Roundup_image.PNG", contentType = "image/png", alt = "Alignment"))
        }, deleteFile = FALSE) #where the src is wherever you have the picture
        
        output$distPlot <- renderPlot({
          hist(rnorm(input$obs))
        })
        output$LymPlot <-renderPlot({
          Lym_Abb %>%
          filter(Year != "") %>% 
          filter(State == input$state) %>%
          ggplot(aes(x = Year, y = Age_Adjusted_Rate)) + #Need a "Selected == Alabama setting.......................!!!!!!!
          geom_point() + 
            labs(title = "Age Adjusted Rate of Lymphoma", x = "Year", y = "Age Adjusted Rate")
        })
          
     })
  


























# as.numeric(as.character(Year))




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