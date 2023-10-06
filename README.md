# Data Science Project Overview
This project aims to establish connections between crime rates in various Austin neighborhoods and residents' access to food. Specifically, we're investigating the impact of food insecurity and the availability of fresh food access points on crime rates within different areas of the city. By analyzing these relationships, we hope to gain insights that can inform strategies for reducing crime and improving food access in Austin.

# Variables
 census.tract  
 Murder_Count  
 Murder %  
 Zip.Code based on census tract  
 Most common clearance status -- mode of criminal cases, cleared, noncleared, or ongoing  
 Average.open_case_duration -- duration of case, calculated as date crime cleared - crime occured  
 highest offense description -- mode of most common offense -- burglary, assault, theft, DWI, e.g.  
 Offense count -- count of highest offense   
 total incidents -- total crime count  
 total family violence per tract  
 AvgPopulation -- average popualation/tract  
 Avgfoodinsecurepop   
 Avgfoodinsecure pctg  
 Proximity to fresh food -- categorical, True or False  
 Crime.Rate -- (total incidents / avg pop per census tract) * 1000  

# Crime Reports Data
https://data.austintexas.gov/Public-Safety/Crime-Reports/fdj4-gpfu 

# Food Insecurity Data
'Number of City supported fresh food access points in census tracts with higher than average food insecurity rates'   
https://data.austintexas.gov/Health-and-Community-Services/Strategic-Measure_HE-F-5_Number-of-City-supported-/325g-iwjn   

Strategic Measure_HE.F.1_Percentage or residents experiencing food insecurity
https://data.austintexas.gov/Health-and-Community-Services/Strategic-Measure_HE-F-1_Percentage-or-residents-e/5gje-qqi9   


# Visualizations

![image](https://github.com/awilensky32/DS_Project/assets/54001698/9deffae3-9db8-4287-9b43-4c2b3e88821c)

![image](https://github.com/awilensky32/DS_Project/assets/54001698/6ab5999b-e5f8-4db1-bd14-ab54768a7159)

![image](https://github.com/awilensky32/DS_Project/assets/54001698/9b46900d-9512-4e06-9a3b-530c217e06df)

# Data Analysis

As can be seen in the first graph, there is a visible positive correlation between food insecurity and crime rate. On the other hand, proximity to fresh food does not have a clear relationship to crime rate.



In the third graph, there appears to be a weak correlation between crime rate and average food insecure population. Among the 'Low Crime Rate' and 'Average Crime Rate' categories, approximately a third of the data points reside below the 0.15 average food insecure population value. However, the 'High Crime Rate' category is nearly entirely above this same value and much more tightly distributed among the higher end of the average food insecure population values. 

# Conclusion

Our project seeks to explore the relationship between crime rate in various Austin neighborhoods and residential access to food, as well as an additional focus on understanding the impact of food insecurity and the availability of fresh food on crime incidence. A noticeable positive correlation was found between food insecurity and crime rates, suggesting that areas with higher food insecurity tend to experience higher crime. However, the correlation between proximity to fresh food outlets and crime rate was not indicative. Another notable observation was that areas with high crime rates predominantly had higher a higher proportion of food-insecure populations compared to areas with low and average crime rates. Ultimately, a more holistic and thorough analysis of the data will allow for greater confidence in these preliminary claims or perhaps further insight into our investigative questions. 
