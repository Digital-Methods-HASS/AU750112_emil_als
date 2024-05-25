
library(tidyverse)

Western_Europe <- read_csv("data/homicide-rates-across-western-europe.csv")

head(Western_Europe) #checking the data

names(Western_Europe) #finding the names and the numbers of the columns 
names(Western_Europe)[4]<-"homicides_per_100k" #changing column 4's name

ggplot()


homicide_stats <- Western_Europe %>%
  ggplot(aes(x=Year, y=homicides_per_100k, color=Entity)) +


homicide_stats +
  geom_line() + 
  facet_wrap(~Entity)+
  labs(title = "homicide rates by country",
       color="Country")

monarchs <- read_csv2("data/danish_monarchs_tidy_spreadsheet.csv", na="Na")
monarchs
monarchs_no_na <- na.omit(monarchs)
monarchs_no_na$length_reign <- monarchs_no_na$end_reign-monarchs_no_na$start_reign
monarchs_no_na$length_reign
monarchs_no_na$midyear_reign <- monarchs_no_na$end_reign-(monarchs_no_na$end_reign-monarchs_no_na$start_reign)/2


monarchs_midyear_vis <- monarchs_no_na %>%
  ggplot(aes(x=midyear_reign, y=length_reign))

monarchs_midyear_vis +
  geom_smooth()+
  labs(title = "Duration of reign of danish kings",
       x = "Year",
       y = "Duration of reign")

# We see that the duration of reign is increasing as the homicide rates are decreasing
data()
