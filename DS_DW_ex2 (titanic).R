library(tidyverse)
titanic <- read_csv("C:/Users/tishas/Desktop/personal/Springboard/exercises/Springboard_DataWrangling_Ex2/titanic_original.csv")
titanic %>% glimpse
titanic <-tbl_df(titanic)
View(titanic)

#Find the missing values and replace them with S
missing <- is.na(titanic$embarked)
titanic$embarked[missing] <- "S"
View(titanic)

#Calculate the mean of the Age column and use that value to populate the missing values
age <- round(mean(titanic$age, na.rm = TRUE))
titanic$age[titanic$age == ""] <- age
View(titanic)

#Fill these empty slots in Lifeboat with a dummy value e.g. the string 'None' or 'NA'
titanic$boat[titanic$boat == ""] <- None
View(titanic)

#Create a new column has_cabin_number which has 1 if there is a cabin number, and 0 otherwise
titanic <-titanic %>% 
  mutate(has_cabin_number = ifelse(cabin == "", 0, 1))
View(titanic)