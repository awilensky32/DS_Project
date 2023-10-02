# 10/01/2023
# Elements of Data Science
# Project Code

# Load necessary libraries
library(dplyr)

# Convert 'Family.Violence' to numeric (1 for 'Y', 0 otherwise)
crime$Family.Violence <- as.numeric(Crime_Reports$Family.Violence == 'Y')

# Group by 'Census.Tract' and summarize crime data
crime_aggregated <- crime %>%
  group_by(Census.Tract) %>%
  summarise(
    Total.Incidents = n(),
    Total.Family.Violence = sum(Family.Violence, na.rm = TRUE)
  )

# Group by 'Census.Tract' and 'Highest.Offense.Description', count offenses, and find most common offense per tract
crime_data_grouped <- Crime_Reports %>%
  group_by(Census.Tract, Highest.Offense.Description) %>%
  summarise(Offense.Count = n(), .groups = 'drop')

most_common_offense_per_tract <- crime_data_grouped %>%
  group_by(Census.Tract) %>%
  arrange(desc(Offense.Count)) %>%
  filter(row_number() == 1) %>%
  ungroup()

# Convert date variables to Date class and calculate duration between occurred and clearance dates
crime$Occurred.Date <- as.Date(as.character(Crime_Reports$Occurred.Date), format="%m/%d/%Y")
crime$Clearance.Date <- as.Date(as.character(Crime_Reports$Clearance.Date), format="%m/%d/%Y")
crime$Duration <- as.numeric(difftime(crime$Clearance.Date, crime$Occurred.Date, units = "days"))

# Group by 'Census.Tract' and calculate average duration of open crime case
average_duration_per_tract <- crime %>%
  group_by(Census.Tract) %>%
  summarise(Average.Duration = mean(Duration, na.rm = TRUE))

# Recode and summarize 'Clearance.Status' data
crime$Clearance.Status <- factor(crime$Clearance.Status, levels = c("O", "N", "C"))
levels(crime$Clearance.Status) <- c("Ongoing", "Not Cleared", "Cleared")
result <- crime %>%
  group_by(Census.Tract) %>%
  summarize(Most.Common.Clearance.Status = names(which.max(table(Clearance.Status))))

# Group by 'Census.Tract' and 'Zip.Code', count records, and find most common ZIP per tract
zip_counts <- crime %>%
  group_by(Census.Tract, Zip.Code) %>%
  summarize(count = n(), .groups = 'drop') %>%
  arrange(Census.Tract, desc(count))
unique_zip_per_tract <- zip_counts %>%
  group_by(Census.Tract) %>%
  slice_head(n = 1) %>%
  ungroup()

# Handle missing values in 'Category.Description' and count unique categories per 'Census.Tract'
crime$Category.Description[crime$Category.Description == ""] <- NA
filtered_crime <- crime[!is.na(crime$Category.Description), ]
unique_counts <- tapply(filtered_crime$Category.Description, filtered_crime$Census.Tract, function(x) length(unique(x)))

# Group by 'Census.Tract', find and print most common category per tract
result1 <- crime %>%
  filter(!is.na(Category.Description)) %>%
  group_by(Census.Tract) %>%
  summarize(Most_Common_Category = names(which.max(table(Category.Description))))

# Count and print number of 'murder' occurrences in 'Category.Description'
murder_count <- sum(grepl("murder", crime$Category.Description, ignore.case = TRUE), na.rm = TRUE)

# Group by 'Census.Tract', count and print number of murders per tract
result2 <- crime %>%
  filter(grepl("murder", Category.Description, ignore.case = TRUE)) %>%
  group_by(Census.Tract) %>%
  summarise(Murder_Count = n()) %>%
  filter(Murder_Count > 0)

# Create 'Is_Murder' variable and group by 'Census.Tract' to calculate total records, murder count, and murder percentage per tract
crime$Is_Murder <- ifelse(grepl("Murder", crime$Category.Description, ignore.case = TRUE), "Yes", "No")
result3 <- crime %>%
  group_by(Census.Tract) %>%
  summarise(Total_Records = n(), Murder_Count = sum(Is_Murder == "Yes"), Murder_Percentage = mean(Is_Murder == "Yes") * 100)

# Remove string "Census Tract" from 'Census.Tract' in strat1 and result4 datasets
strat1$Census.Tract <- as.numeric(gsub("Census Tract", "", strat1$Census.Tract))
result4 <- Strategic_Measure_HE.F.1_Percentage_or_residents_experiencing_food_insecurity %>%
  group_by(Census.Tract) %>%
  summarise(Proximity.to.Fresh.Food = first(Proximity.to.a.Fresh.Food.Access.Point))
result4$Census.Tract <- as.numeric(gsub("Census Tract", "", result4$Census.Tract))

# Join datasets based on 'Census.Tract'
final_data <- left_join(crime_aggregated, most_common_offense_per_tract, by = "Census.Tract")
final_data <- left_join(final_data, average_duration_per_tract, by = "Census.Tract")
final_data <- left_join(final_data, result, by = "Census.Tract")
final_data <- left_join(final_data, unique_zip_per_tract, by = "Census.Tract")
final_data <- left_join(final_data, result1, by = "Census.Tract")
final_data <- left_join(final_data, result2, by = "Census.Tract")
final_data <- left_join(final_data, result3, by = "Census.Tract")
final_data <- left_join(final_data, result4, by = "Census.Tract")

# Print final dataset
print(final_data)

write.csv()
