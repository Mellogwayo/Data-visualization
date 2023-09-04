########### Data Cleaning extra codes##########
#[45] "TYPE_OF_FORCE_USED10"                         ""                            
#[47] ""
data[,1] 
data<- data.frame(data)
# count the number of variables that contain an empty string in their name
n_vars_with_empty_str <- sum(grepl("", names(data)))
# print the count
print(paste("Number of variables with empty string:", n_vars_with_empty_str))
# assuming your data set is named 'my_data'
# and the variable you want to convert is named 'my_var'
# convert the variable to numeric
my_data$my_var <- as.numeric(my_data$my_var)
# check if the variable is numeric
is_numeric <- is.numeric(my_data$my_var)
print(is_numeric)  # TRUE

date_string <- "2022-03-15"
date_object <- as.Date(date_string, format = "%Y-%m-%d")
print(date_object)

time_string <- "13:45:30"
time_object <- strptime(time_string, format = "%H:%M:%S")
print(time_object)
names(data)
sum(is.na(data))
sum(is.na(INCIDENT_DATE))

# assuming your data set is named 'my_data'
# and the variable you want to convert is named 'my_var'
# convert the variable to numeric and handle missing and invalid values
my_data$my_var <- as.numeric(as.character(my_data$my_var), na.rm = TRUE)
my_data$my_var[is.na(my_data$my_var)] <- 0
# check if the variable is numeric
is_numeric <- is.numeric(my_data$my_var)
print(is_numeric)  # TRUE

date_string <- "2022-03-15"
date_object <- as.Date(date_string, format = "%Y-%m-%d")
print(date_object)
class(date_object)

time_string <- "13:45:30"
time_object <- strptime(time_string, format = "%H:%M:%S")
print(time_object)
################## Tables extra codes and info ##############
                  #Table/Two-way table

#a table or two-way table is a way to summarize and display the frequency distribution of categorical data. 
#It displays the number of occurrences of each combination of values of two categorical variables in a matrix format.
#if we have a dataset of students and their grades, 
#we can create a two-way table to summarize the number of students who received each grade for each gender. 
#The resulting table would have the gender categories as rows and the grade categories as columns. 
#The cells of the table would contain the frequency count of the number of students in each combination of gender and grade.
#In R, we can create a table using the table() function. 
#to create a two-way table of gender and grade from our dataset, we would use the following code:
mytable <- table(df$gender, df$grade)

# Create the plot using ggplot2
ggplot(df, aes(x = category, y = value)) + 
  geom_bar(stat = "identity", fill = "blue") +
  labs(title = "Bar Plot", x = "Category", y = "Value")