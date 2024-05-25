# Setting up workspace
dir.create("data")
dir.create("scripts")
dir.create("figures")

# Downloading data
download.file(
  "https://raw.githubusercontent.com/datacarpentry/r-socialsci/main/episodes/data/SAFI_clean.csv",
  "data/SAFI_clean.csv", mode = "wb"
)

# Creating objects 
area_hectares <- 50
area_hectares
area_hectares*2.7

area_acres <- area_hectares*2.47 # R updates only on request 

# Functions 
## activeverb(...)
sqrt(10)
round(sqrt(10))
?round
round(sqrt(10), 2)
round(digits=2,x=sqrt(10))

# Vectors 
hh_members <- c(3,7,10,6)
hh_members
wall_type <- c("mudbrick","sunbrick","muddaub")
wall_type

length(hh_members) # how many element? 
class(wall_type) # tells you the data-type (in this case - characters)
class(hh_members)
str(hh_members)

# grow your vectors 
big_hh_members <- c(1, 2, 3, hh_members, 12, 17, 6, 4)
big_wall_type <- c(wall_type, wall_type, "tile")

hh_members > 5

# Datatype coercion 
num_char <- c(1, 2, 3, "a")
num_logical <- c(1, 2, 3, TRUE)
char_logical <- c("a", "b", "c", TRUE)
tricky <- c(1, 2, 3, "4")
class(num_char)
class(num_logical)
class(char_logical)
class(tricky)
# Exercise with "TRUE" 
combined_logical <- c(num_logical, char_logical)
combined_logical

class(num_logical)

# Subsetting 

wall_type[2] #we want to find the value in the 2nd position 
big_wall_type[4:7] #we want to find the values in the 4th, 5th, 6th and 7th position 
big_wall_type[7:4] #the order is reversed (compared to the one above) 
big_wall_type[2,3,7,1] #not working - 
big_wall_type[c(2,3,7,1)] #to get the value in specific orders we need to make a c-function 
new_wall_type <- big_wall_type[c(2,3,7,1)] #a new vector is created

hh_members[3] #works in the same way with numeric vectors 
hh_members[c(3,2,1,1,4,3,3,3)]

hh_members[-3] #value in 3rd position is excluded 
big_hh_members[-c(2,4,5,7)] #use minus c-function to exclude an abritary order of elements 

hh_members>3 #finds element bigger than 3 with true/false
hh_members[hh_members>3] #finds the actual elements/numbers (in this case)

big_hh_members[big_hh_members>6 & big_hh_members<15] #finds the middle elements
big_hh_members[big_hh_members<6 | big_hh_members>15] #smaler than 6 OR bigger than 15
length(big_hh_members[big_hh_members<6 | big_hh_members>15])#how many elements satisfy the conditions

sum(hh_members>3) #if it is in TRUE/FALS form sum counts the TRUE 

big_wall_type[big_wall_type == "sunbrick"] #findes all sunbrick in the big_wall_type 
big_wall_type%in% c("sunbrick","tile")
big_wall_type[big_wall_type%in% c("sunbrick","tile")]


# Missing data 
rooms <- c(2,1,1,NA,4) #NA is treated/interpreted as a numeric value by R
class(rooms)
max(rooms)
?max
max(rooms,na.rm=TRUE) #by na.rm=TRUE the missing values are skipped 
mean(rooms,na.rm=TRUE)

# eliminating missin values in subsetting
is.na(rooms) #tells wich are missing
rooms[!is.na(rooms)] #put ! in fron - this inverts the function 

# in other functions 
na.omit(rooms) #omitting NA (missing values) from rooms 
clean_rooms <- na.omit(rooms) #making a clean vector and saving it

library(tidyverse)#opening the "toolbox" tidyverse - needs to be opened in every project when wanted

interviews <- read_csv("data/SAFI_clean.csv") #loading safi-dataset and defining it as interviews 
getwd() #shows the path 
interviews
interviews$memb_assoc
interviews <- read_csv("data/SAFI_clean.csv", na="NULL") #we are telling R that "NULL" in the dataset equals NA
interviews$memb_assoc 

monarchs <- read_csv2("data/danish_monarchs_tidy_spreadsheet.csv", na="Na")
monarchs
monarchs_no_na <- na.omit(monarchs)
monarchs_no_na$length_reign <- monarchs_no_na$end_reign-monarchs_no_na$start_reign
monarchs_no_na$length_reign
class(monarchs_no_na$length_reign)
median(monarchs_no_na$length_reign)
mean(monarchs_no_na$length_reign)


monarchs_plot <- monarchs_no_na %>%
ggplot(aes(x=monarch_name, y=length_reign))
monarchs_plot +
  geom_point()

monarchs_plot +
  geom_point()

monarchs_time_plot <- monarchs_no_na %>%
  ggplot(aes(x=start_reign, y=length_reign))
monarchs_time_plot + 
  geom_point() + 
  geom_line() +
  geom_smooth()

