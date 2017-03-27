###########
# Challenge:
#Write a for loop to sum all of the values in a row of TestData.csv 
#(found in the Day 3 folder) as long as one of the values in the row is greater than 0.95. 
#Find the highest and lowest summed values.
###########

### Setup
# Set the working directory
setwd("D:/XX_CodingClub/")
# Read in data
day3_data <-read.csv(file = "./Day_03_WorkAlong/TestData.csv")

### Add a column called "Sum" to the dataframe, where we sum all the data in the row
### if any of the values are greater than 0.95. Otherwise, leave it as a NA value.

# Put NAs into the new column 'Sum'
day3_data[,"Sum"] <- NA
# for loop to iterate over the length of the table to sum values if >0.95
for (i in 1:nrow(day3_data)){
  if (any(day3_data[i,]>0.95)){
    # The conditional expression above is asking for the i'th row of the table,
    # are any of the values greater than 0.95
    # If you look at the documentation for any(), you'll see that 
    # any() takes a logical vector as an argument.
    # day3_data[i,]>0.95 returns a logical vector (e.g. FALSE/TRUE) of the same
    # shape as the the i'th row.
    
    # Sum the row. Note if we don't set na.rm=TRUE,
    # sum() will output NA as a sum if it tries to add NAs.
    day3_data[i,"Sum"] <- sum(day3_data[i,], na.rm=TRUE)
  }
}

# Note that all rows get summed, as all have at least 1 value >0.95
print(day3_data) 

# Find the max and min summed value
summed_values <- day3_data["Sum"] # Assign a variable for convenience
max_value <- max(summed_values)
min_value <- min(summed_values)

print(max_value)
print(min_value)
# It may be useful as well to know which rows are the max and min value
max_value_row_index <- which(summed_values==max_value)
min_value_row_index <- which(summed_values==min_value)

print(max_value_row_index)
print(min_value_row_index)

