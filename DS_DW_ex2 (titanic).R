library(tidyverse)
titanic <- read_csv("C:/Users/tishas/Desktop/personal/Springboard/exercises/Springboard_DataWrangling_Ex2/titanic_original.csv")
titanic %>% glimpse
titanic <- tbl_df(titanic)

#Find the missing values and replace them with S
titanic <- titanic %>%
  mutate(embarked = replace(embarked, is.na(embarked), "S")) %>%
  mutate(embarked = replace(embarked, embarked == "", "S")) %>%
  mutate(embarked = replace(embarked, embarked == " ", "S"))

#Calculate the mean of the Age column and use that value to populate the missing values
titanic <- titanic %>%
 mutate(age = replace(age, is.na(age), mean(age, na.rm = TRUE)))

#Fill these empty slots in Lifeboat with a dummy value e.g. the string 'None' or 'NA'
titanic <- titanic %>%
  mutate(boat = replace(boat, is.na(boat), "None"))

#Create a new column has_cabin_number which has 1 if there is a cabin number, and 0 otherwise
titanic <- titanic %>% 
  mutate(`has cabin number` = ifelse(is.na(cabin), 0, 1))
View(titanic)
write_csv(titanic, "titanic_cleaned.csv")