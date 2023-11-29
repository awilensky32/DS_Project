# Data Science Project Overview
This project aims to establish connections between Family violenmce and location in Austin TX. Specifically, we're investigating the impact of Location measured in latitude and longitude, Location type (residence vs other areas) and other covariants on family violence within different areas of the city. By analyzing these relationships, we hope to gain insights that can inform strategies and better understand the attributes of family violence.

# Variables
- Highest Offense Code: Identification code for type of offense
- Family Violence: Determines if crime qualifies as family violence
- Occurred Date: Date that crime occurred
- Occurred Time: Time that crime occurred
- Location Type: Type of location where the crime occurred
- Council District: Council district crime happened in
- APD Sector: Specific APD Sector listed
- APD District: Specific APD District listed
- Clearance Status: Status on if crime was cleared
- Category Description: Type of crime
- Latitude: Latitude attribute of location of crime
- Longitude: Longitude attribute of location of crime

# Crime Reports Data
https://data.austintexas.gov/Public-Safety/Crime-Reports/fdj4-gpfu 




# Visualizations

![image](https://github.com/awilensky32/DS_Project/assets/54001698/9cf66c83-4ef1-4680-8f34-72af16c83a76)

![image](https://github.com/awilensky32/DS_Project/assets/54001698/3a0b8373-9b1d-4bed-b38c-6653cae69c8d)

       ![image](https://github.com/awilensky32/DS_Project/assets/54001698/cc88d54f-73f7-4a7c-b470-ca71bcd0e9f6)


Hypothesis 1: Family violence will be more common in the winter

From the mean(|SHAP value|) plot, which plots every features' average impact on model prediction, it appears that the Occurred Month feature does not have a significant impact on predicting if a given report includes family violence. Since the month in which a report is filed does not have a significant impact on the probability of the report involving family violence, the season in which the report is filed also does not have a significant impact on the probability of the report involving family violence. Hence, the hypothesis: family violence will be more common in the winter is false.

Hypothesis 2: Family violence will occur more in areas away from the city

From the mean(|SHAP value|) plot, which plots every features' average impact on model prediction, it appears that the Latitude and Longitude features do not have a significant impact on predicting if a given report includes family violence. Since the Latitude and Longitude features do not have a significant impact on predicting if a given report includes family violence, the cartisian/geographic location that an incident occurs at with respect to the "city" of Austin does not have a significant impact on predicting if a given report includes family violence. Hence, the hypothesis: Family violence will occur more in areas away from the city is false.

Hypothesis 3: Family violence will be more common in residential areas

The horizontal bar plot above displays the percentage of cases, per location type, that involve family violence for the 7 most common areas for family violence. Since, only 0.002966% of the incidents that occurred at the RESIDENCE / HOME location involved family violence, family violence does not seem to be more common in residential areas when compared to locations where a significant percentage of the incidents involve family violence such as: DRUG STORE / DOCTOR'S OFFICE / HOSPITAL, HOTEL / MOTEL / ETC. -, and CONVENIENCE STORE. Hence, our hypothesis, Family violence will be more common in residential areas, is false.

Hypothesis 4: Incidents involving rape will be less likely to include family violence

The horizontal bar plot above portrays the percentage of reports that involve rape for both instances of family violence and instances without family violence. Since instances of rape without family violence are far more common than instances of rape with family violence, our hypothesis is true. Hence, Incidents involving rape will be less likely to include family violence.
