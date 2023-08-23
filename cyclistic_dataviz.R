install.packages("stringr")
library(plotly)
library(dplyr)
library(scales)
library(ggplot2)
library("stringr")

#Pie Chart data
Pie_Data <-count(Cyclistic_Sample_Full_Year_Review_Combined_Trip_Data,rideable_type,member_casual)

Casual_Pie_Data <- filter(Pie_Data, member_casual == "casual")
Member_Pie_Data <- filter(Pie_Data, member_casual == "member")

#All Pie chart
ggplot(Pie_Data, aes(x="", y=n, fill=rideable_type)) +
  geom_bar(stat="Identity",width=1)+
  scale_fill_manual(values=c('#109490', '#1ce718', '#eb5600'))+
  coord_polar("y", start=0)+
  labs(
    fill = "Rideable Type",
    title = "Rideable Type Prefrence",
    subtitle = "All Riders"
  )+
  theme_void()
 
#Casuals ride type pie chart
ggplot(Casual_Pie_Data, aes(x="", y=n, fill=rideable_type)) +
  geom_bar(stat="Identity",width=1)+
  scale_fill_manual(values=c('#109490', '#1ce718', '#eb5600'))+
  coord_polar("y", start=0)+
  labs(
    fill = "Rideable Type",
    title = "Rideable Type Prefrence",
    subtitle = "Casual Riders"
  )+
  theme_void()

#Members ride type pie chart
ggplot(Member_Pie_Data, aes(x="", y=n, fill=rideable_type)) +
  geom_bar(stat="Identity",width=1)+
  scale_fill_manual(values=c('#109490', '#eb5600', '#1ce718'))+
  coord_polar("y", start=0)+
  labs(
    fill = "Rideable Type",
    title = "Rideable Type Prefrence",
    subtitle = "Membership holders"
  )+
  theme_void()

#Bar chart Days of the Week vs. Number of Rides by Membership status
ggplot(data=Cyclistic_Sample_Full_Year_Review_Combined_Trip_Data)+
  geom_bar(position = "dodge" , mapping=aes(x=Day_of_Week, fill = member_casual))+
  scale_fill_manual(values=c('#109490', '#eb5600'))+
  labs(
    x = "Day of the Week",
    y = "Number of Rides",
    fill = "Member or Casual",
    title = "Number of Rides vs. Days of the Week",
    subtitle = "Grouped by Membership type"
  )

#Bar chart Days of the Week vs. Ride Length by Membership status
ggplot(data = Cyclistic_Sample_Full_Year_Review_Combined_Trip_Data, aes(fill=member_casual, y=Ride_len, x=Day_of_Week))+ 
  geom_bar(position="dodge", stat="identity")+
  scale_fill_manual(values=c('#109490', '#eb5600'))+
  labs(
    x = "Day of the Week",
    y = "Ride Length",
    fill = "Member or Casual",
    title = "Ride Lengths vs. Days of the Week",
    subtitle = "Grouped by Membership type"
  )
  


  


