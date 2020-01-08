# Cancer and Pesticides / C81-C96 (Malignant neoplasms of lymphoid, haematopoietic and related tissue)




#read in data using .table and tab: 
CP <- read.table("CDC_data_1999-2017.txt", sep = '\t', nrows = 52)

# we need dplyr for easily manipulating columns: 
library(dplyr)
library(ggplot2)

CP <- CP %>% select(-V1, -V3)
names(CP)[1] <- "State"
names(CP)[2] <- "Deaths"
names(CP)[3] <- "Population"
names(CP)[4] <- "Crude_Rate"
names(CP)[5] <- "Age_Adjusted_Rate"
CP

CP <- CP[-c(1),]
CP 


# Now we want to make some maps to visualize this data: import us map using plotly 

library(plotly)
packageVersion('plotly')





# Let's try to solve the problem by giving "location" something to look for 

Abb <- read.csv("https://raw.githubusercontent.com/jasonong/List-of-US-States/master/states.csv")
Abb
View(Abb)


# Now we need to merge them: 

CP_Abb <- merge(CP, Abb, by = 'State')
View(CP_Abb)



# give state boundaries a white border
l <- list(color = toRGB("white"), width = 2)




# specify some map projection/options
g <- list(
  scope = 'usa',
  projection = list(type = 'albers usa'),
  showlakes = TRUE,
  lakecolor = toRGB('white')
)

p <- plot_geo(CP_Abb, locationmode = 'USA-states') %>%
  add_trace(
    z = ~Age_Adjusted_Rate, locations = ~Abbreviation,
            color = ~Age_Adjusted_Rate, colors = 'Blues'
  ) %>%
  colorbar(title = "Age Adjusted Rate") %>%
  layout(
    title = 'Neoplasms by State 1999-2016',
    geo = g
  )

p








# Change types 
CP$Deaths <- as.double(CP$Deaths)
CP$Deaths <- CP$Deaths + 0.1







sapply(CP, typeof)
sapply(df, typeof)


CP$State <- as.character(CP$State)
CP$Crude_Rate <- as.double(CP$Crude_Rate)
CP$Age_Adjusted_Rate <- as.double(CP$Age_Adjusted_Rate)



# Neoplasms of lympoid and related tissues 
Lym <- read.table("Lymphomas, 1999-2017-6.txt", sep = '\t', nrows = 52)
View(Lym)


Lym <- Lym %>% select(-V1, -V3)
names(Lym)[1] <- "State"
names(Lym)[2] <- "Deaths"
names(Lym)[3] <- "Population"
names(Lym)[4] <- "Crude_Rate"
names(Lym)[5] <- "Age_Adjusted_Rate"
Lym

Lym <- Lym[-c(1),]


# Merge with abbreviations 
Lym_Abb <- merge(Lym, Abb, by = 'State')
View(Lym_Abb)




# Plot now with Lymphomas 
Lym_Abb$State <- as.character(Lym_Abb$State)
Lym_Abb$Crude_Rate <- as.double(Lym_Abb$Crude_Rate)
Lym_Abb$Age_Adjusted_Rate <- as.double(Lym_Abb$Age_Adjusted_Rate)


# give state boundaries a white border
l <- list(color = toRGB("white"), width = 2)


# specify some map projection/options
g <- list(
  scope = 'usa',
  projection = list(type = 'albers usa')
)

p <- plot_geo(Lym_Abb, locationmode = 'USA-states') %>%
  add_trace(
    z = ~Crude_Rate, locations = ~Abbreviation,
    color = ~Crude_Rate, colors = 'Purples'
  ) %>%
  colorbar(title = "Crude Rate") %>%
  layout(
    title = 'Lymphoma Death Rate by State 1999-2016',
    geo = g
  )

p


# I've definitely got some problems here and I'm not sure what's causing them 

plot_usmap()
plot_usmap(regions = "states")
plot_usmap(regions = "counties")
plot_usmap(regions = "state")
plot_usmap(regions = "county")

# Output is ggplot object so it can be extended
# with any number of ggplot layers
library(ggplot2)
plot_usmap(include = c("CA", "NV", "ID", "OR", "WA")) +
  labs(title = "Western States")

# Color maps with data
plot_usmap(data = statepop, values = "pop_2015")

# Include labels on map (e.g. state abbreviations)
plot_usmap(data = statepop, values = "pop_2015", labels = TRUE)
# Choose color for labels
plot_usmap(data = statepop, values = "pop_2015", labels = TRUE, label_color = "white")



# Grouped by year for better analysis 
Lym_by_Year2 <- read.table("Underlying Cause of Death - by Year - 1999-2017-6.txt", header = FALSE, sep = '\t', nrows = 1022)
View(Lym_by_Year2) 

head(Lym_by_Year2)

# my colnames look funny: this is called "unlisting" I think: 
colnames(Lym_by_Year2) <- as.character(unlist(Lym_by_Year2[1,]))
Lym_by_Year2 = Lym_by_Year2[-1, ]
View(Lym_by_Year2)


Lym_by_Year2$State <- as.character(Lym_by_Year2$State)



#Merge Abb and by_year:

Lym_by_Year3 <- merge(Lym_by_Year2, Abb, by = 'State')
View(Lym_by_Year3)

#1999: 

set_99 <- Lym_by_Year3 %>%
  filter(Year == 1999)

l <- list(color = toRGB("white"), width = 2)


# specify some map projection/options
g <- list(
  scope = 'usa',
  projection = list(type = 'albers usa')
)

p <- plot_geo(set_99, locationmode = 'USA-states') %>%
  add_trace(
    z = ~Crude_Rate, locations = ~Abbreviation,
    color = ~Crude_Rate, colors = 'Purples'
  ) %>%
  colorbar(title = "Rate") %>%
  layout(
    title = 'Lymphoma Death Rate by State 1999',
    geo = g
  )

p

warnings()
View(set_99)

set_99$"Crude Rate" <- as.double(set_99$"Crude Rate")
set_99$"Age Adjusted Rate" <- as.double(set_99$"Age Adjusted Rate")


names(set_99)

#Rename some columns: 

names(set_99)[8] <- "Crude_Rate"
names(set_99)[9] <- "Age_Adjusted_Rate"


#lets do summary and then make a graph to show things in 99
summary(set_99$Age_Adjusted_Rate)

ggplot(set_99, aes(x = Abbreviation, y = Age_Adjusted_Rate)) +
  geom_point()





Lym_by_Year3$"Age Adjusted Rate" <- as.double(Lym_by_Year3$"Age Adjusted Rate")
min(Lym_by_Year3$`Age Adjusted Rate`)



Lym_by_Year3 %>% 
  filter(by == "Age Adjusted Rate")

ggplot(Lym_by_Year3, aes(x = Abbreviation, y = "Age Adjusted Rate")) +
  geom_boxplot()


ggplot(set_99, aes(x = Abbreviation, y = Age_Adjusted_Rate)) +
  geom_bar(stat = "identity")






