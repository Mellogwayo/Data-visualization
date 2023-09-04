######LOADING AND CLEANING DATA SETS#####
data<-read.csv("data visualization assignment/37-00049_UOF-P_2016_prepped.csv")

View(data)
str(data) 
dim(data)#the data set contains 2384 obs. of  47 variables

# Remove the first row from the data frame as it contains the labels of the variables
data <- data[2:nrow(data), ]

# Count the number of missing values in each column of the dataframe
sum(is.na(data)) # there are .... missing values 

#identify the type of variables 
sapply(data, function(x) is.character(x))
sapply(data, function(x) is.numeric(x)) # it seems all the variables are characters 
head(data) # this should not be the case as we can see some dates and numbers 

#checking duplicates
duplicated(data) #the data set has no duplicates

names(data) #obtaining the names of the variables 
data$INCIDENT_TIME
INCIDENT_DATE

# Combine date and time into a single variable
data$INCIDENT_DATE_AND_TIME <- paste(data$INCIDENT_DATE, data$INCIDENT_TIME)
data$INCIDENT_DATE_AND_TIME 
class(data$INCIDENT_DATE_AND_TIME )
data$INCIDENT_DATE_AND_TIME

# Convert to POSIXct or POSIXlt object
data$INCIDENT_DATE_AND_TIME  <- strptime(data$INCIDENT_DATE_AND_TIME, format = "%m/%d/%y %I:%M:%S %p")
class(data$INCIDENT_DATE_AND_TIME)
data$INCIDENT_DATE_AND_TIME 
sum(is.na(data$INCIDENT_DATE_AND_TIME))# 10 observations don't have an incident date and time


#the following variables need to be transformed
UOF_NUMBER #should be numeric
OFFICER_ID #should be numeric
OFFICER_YEARS_ON_FORCE #should be numeric
SUBJECT_ID #should be numeric
REPORTING_AREA #should be numeric
BEAT #should be numeric
SECTOR #should be numeric
STREET_NUMBER #should be numeric
NUMBER_EC_CYCLES #should be numeric
LOCATION_LATITUDE #should be numeric
LOCATION_LONGITUDE #should be numeric

INCIDENT_DATE #should be a date
INCIDENT_TIME #should be time 
OFFICER_HIRE_DATE  #should be a date
 
#TRANFORMING THE VARIABLES
data$UOF_NUMBER #variable to be converted 
# convert the variable to numeric and handle missing and invalid values
data$UOF_NUMBER<- as.numeric(as.character(data$UOF_NUMBER), na.rm = TRUE)
data$UOF_NUMBER[is.na(data$UOF_NUMBER)] <- 0
is_numeric <- is.numeric(data$UOF_NUMBER) # check if the variable is numeric
print(is_numeric)  # if numeric it will be TRUE

data$OFFICER_ID #variable to be converted 
# convert the variable to numeric and handle missing and invalid values
data$OFFICER_ID<- as.numeric(as.character(data$OFFICER_ID), na.rm = TRUE)
data$OFFICER_ID[is.na(data$OFFICER_ID)] <- 0
is_numeric <- is.numeric(data$OFFICER_ID) # check if the variable is numeric
print(is_numeric) # if numeric it will be TRUE

data$OFFICER_YEARS_ON_FORCE #variable to be converted 
# convert the variable to numeric and handle missing and invalid values
data$OFFICER_YEARS_ON_FORCE <- as.numeric(as.character(data$OFFICER_YEARS_ON_FORCE), na.rm = TRUE)
data$OFFICER_YEARS_ON_FORCE[is.na(data$OFFICER_YEARS_ON_FORCE)] <- 0
is_numeric <- is.numeric(data$OFFICER_YEARS_ON_FORCE) # check if the variable is numeric
print(is_numeric)  # if numeric it will be TRUE

data$SUBJECT_ID #variable to be converted 
# convert the variable to numeric and handle missing and invalid values
data$SUBJECT_ID <- as.numeric(as.character(data$SUBJECT_ID), na.rm = TRUE)
data$SUBJECT_ID[is.na(data$SUBJECT_ID)] <- 0
is_numeric <- is.numeric(data$SUBJECT_ID) # check if the variable is numeric
print(is_numeric) # if numeric it will be TRUE

data$REPORTING_AREA #variable to be converted 
# convert the variable to numeric and handle missing and invalid values
data$REPORTING_AREA <- as.numeric(as.character(data$REPORTING_AREA), na.rm = TRUE)
data$REPORTING_AREA[is.na(data$REPORTING_AREA)] <- 0
is_numeric <- is.numeric(data$REPORTING_AREA) # check if the variable is numeric
print(is_numeric)  # if numeric it will be TRUE

data$BEAT #variable to be converted 
# convert the variable to numeric and handle missing and invalid values
data$BEAT <- as.numeric(as.character(data$BEAT), na.rm = TRUE)
data$BEAT[is.na(data$BEAT)] <- 0
is_numeric <- is.numeric(data$BEAT) # check if the variable is numeric
print(is_numeric)  # if numeric it will be TRUE

data$SECTOR #variable to be converted 
# convert the variable to numeric and handle missing and invalid values
data$SECTOR <- as.numeric(as.character(data$SECTOR), na.rm = TRUE)
data$SECTOR[is.na(data$SECTOR)] <- 0
is_numeric <- is.numeric(data$SECTOR) # check if the variable is numeric
print(is_numeric)  # if numeric it will be TRUE

data$STREET_NUMBER #variable to be converted 
# convert the variable to numeric and handle missing and invalid values
data$STREET_NUMBER <- as.numeric(as.character(data$STREET_NUMBER), na.rm = TRUE)
data$STREET_NUMBER[is.na(data$STREET_NUMBER)] <- 0
is_numeric <- is.numeric(data$STREET_NUMBER) # check if the variable is numeric
print(is_numeric)  # if numeric it will be TRUE

#NUMBER_EC_CYCLES #variable to be converted #not sure if conversion is viable as i am yet to understand what the variable means
#NUMBER_EC_CYCLES<- as.numeric(ifelse(NUMBER_EC_CYCLES == "NULL", 0, NUMBER_EC_CYCLES))
#NUMBER_EC_CYCLES
# convert the variable to numeric and handle missing and invalid values
#my_data$my_var <- as.numeric(as.character(my_data$my_var), na.rm = TRUE)
#my_data$my_var[is.na(my_data$my_var)] <- 0
# check if the variable is numeric
#is_numeric <- is.numeric(my_data$my_var)
#print(is_numeric)  # TRUE

data$LOCATION_LATITUDE #should be numeric
sum(is.na(data$LOCATION_LATITUDE))
# convert the variable to numeric and handle missing and invalid values
data$LOCATION_LATITUDE <- as.numeric(as.character(data$LOCATION_LATITUDE), na.rm = TRUE)
data$LOCATION_LATITUDE[is.na(data$LOCATION_LATITUDE)] <- 0
is_numeric <- is.numeric(data$LOCATION_LATITUDE) # check if the variable is numeric
print(is_numeric)  # if numeric it will be TRUE


data$LOCATION_LONGITUDE #should be numeric
# convert the variable to numeric and handle missing and invalid values
data$LOCATION_LONGITUDE <- as.numeric(as.character(data$LOCATION_LONGITUDE), na.rm = TRUE)
data$LOCATION_LONGITUDE[is.na(data$LOCATION_LONGITUDE)] <- 0
is_numeric <- is.numeric(data$LOCATION_LONGITUDE)# check if the variable is numeric
print(is_numeric)  # if numeric it will be TRUE
class(data$LOCATION_LONGITUDE)

data$INCIDENT_DATE #should be a date
data$INCIDENT_DATE <- as.Date(data$INCIDENT_DATE, format = "%Y-%m-%d")
class(data$INCIDENT_DATE)

data$OFFICER_HIRE_DATE  #should be a date
data$OFFICER_HIRE_DATE <- as.Date(data$OFFICER_HIRE_DATE, format = "%Y-%m-%d")
class(data$OFFICER_HIRE_DATE)


data$INCIDENT_TIME #should be time 
data$INCIDENT_TIME <- strptime(data$INCIDENT_TIME, format = "%H:%M:%S")
class(data$INCIDENT_TIME)

str(data) #check if conversion is correct

sum(is.na(data)) # there are 4786 missing values in the data frame
sapply(data, function(x) sum(is.na(x))) #No. of missing values in each column of the data frame
#OFFICER_HIRE_DATE 2383 INCIDENT_DATE_AND_TIME 10  INCIDENT_DATE  2383 INCIDENT_TIME  10 

summary(data)

######IDENTIFYING PATTERNS AND TRENDS#####
View(data)
names(data)
###TO DO LIST
#start looking at plots from lab 3
# understand variables 


            #Table/Two-way table
mytable <- table(data$SUBJECT_RACE, data$SUBJECT_WAS_ARRESTED)
mytable


          #Bar plot/Pie chart/Dot plot
#Bar plot
library(ggplot2)
# Create the plot using ggplot2
ggplot(data, aes(x = SUBJECT_GENDER, y = SUBJECT_WAS_ARRESTED)) + 
  geom_bar(stat = "identity", fill = "blue") +
  labs(title = "Bar Plot", x = "Category", y = "Value")

             #Histogram/Density plot
# Create the plot using ggplot2
ggplot(data, aes(x = OFFICER_YEARS_ON_FORCE)) + 
  geom_histogram(binwidth = 0.5, color = "black", fill = "blue") +
  labs(title = "Histogram", x = "Value", y = "Frequency")


                 #Box plot/Violin plot/Sina plot
# Create the box plot using ggplot2
ggplot(data, aes(x = OFFICER_INJURY, y = OFFICER_YEARS_ON_FORCE)) + 
  geom_boxplot(fill = "lightblue", color = "black", alpha = 0.7) +
  labs(title = "Box Plot", x = "Injury", y = "Years in force")

                   #Scatter plot/Pair plot
# Create the scatter plot using ggplot2
#ggplot(data, aes(x = OFFICER_GENDER, y =SUBJECT_INJURY)) + 
#  geom_point(color = "red", size = 3) +
#  labs(title = "Scatter Plot", x = "OFFICER_GENDER", y = "SUBJECT_INJURY")

#Correlation analysis

#Time series plot

#The use of smoothing to illustrate pattern/trend

#Map or Leaflet

#Interactive plots

names(data)



#``{r Scatter plot}
# Calculate the number of officers who are involved in subject injury
num_subject_injured <- data %>%
  filter(SUBJECT_INJURY == "Yes") %>%
  group_by(OFFICER_ID) %>%
  summarize(num_injuries = n())

num_subject_injured
sum(num_subject_injured$num_injuries)

# Create a scatter plot of the Officers Involved in Subject Injury
ggplot(num_subject_injured, aes(x = OFFICER_ID, y = num_injuries)) +
  geom_point(color = "red", alpha = 0.7) +
  labs(title = "Scatter Plot of Number of subject injuries involved by an officer", x = "Officer ID", y = "Number of Injuries") +
  theme_minimal()

df_transform$BsmtQual<- factor(df_transform$BsmtQual)
df_transform$BsmtQual_num <- as.numeric(df_transform$BsmtQual)