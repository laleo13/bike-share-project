{"metadata":{"kernelspec":{"name":"ir","display_name":"R","language":"R"},"language_info":{"name":"R","codemirror_mode":"r","pygments_lexer":"r","mimetype":"text/x-r-source","file_extension":".r","version":"4.0.5"}},"nbformat_minor":4,"nbformat":4,"cells":[{"source":"<a href=\"https://www.kaggle.com/code/laleo13/how-does-a-bike-share-navigate-speedy-success?scriptVersionId=111942593\" target=\"_blank\"><img align=\"left\" alt=\"Kaggle\" title=\"Open in Kaggle\" src=\"https://kaggle.com/static/images/open-in-kaggle.svg\"></a>","metadata":{},"cell_type":"markdown","outputs":[],"execution_count":0},{"cell_type":"markdown","source":"*Google Data Analytics Professional Certificate Case Study*\n\n**Table of Contents**\n* [Introduction](#introduction)\n* [Ask](#ask)\n* [Prepare](#ask)\n    - [Problems that need to be fixed](#problems)\n    - [Perform cleaning data](#clean)\n* [Analysis](#analysis)\n* [Share/Visualizations](#share)\n* [Key Takeaways](#key)\n* [Act/Recommendations](#act)\n<a id=\"introduction\"></a>\n\n\n# Introduction\nThis case study is part of the *Google Data Analytics Professional Certificate* to showcase the skills I learned throughout this course and my steps in approaching in solving business problems.  \n\n**Scenario**\n\nI am a junior data analyst working in the marketing analyst team at Cyclistic, a bike-share company in Chicago. The director of marketing believes the company’s future success depends on maximizing the number of annual memberships. Therefore, my team wants to understand how casual riders and annual members use Cyclistic bikes differently. From these insights, my team will design a new marketing strategy to convert casual riders into annual members.\nThe analysis will be performed following 6 phases of the Data Analysis process: *Ask, Prepare, Process, Analyze, and Act (APPAA)*\n<a id=\"ask\"></a>\n\n\n# Ask\n**Business task**: Understand how casual riders and annual members use Cyclistic bikes differently.\n\n**Key stakeholders**:\n- Lily Moreno - Director of Marketing - my manager\n- Cyclistic marketing analytics team\n- Cyclistic executive team\n\n**Deliverables**:\n- Insights on how annual members and casual riders use Cyclistic bikes differently\n- Provide effective visuals and relevant data to support insights\n- Use insights to give three recommendations to convert casual riders to member riders\n<a id=\"prepare\"></a>\n\n\n# Prepare\nThe data being used is the Divvy datasets which has been made available by Motivate International Inc. under [this license](https://ride.divvybikes.com/data-license-agreement). Cyclisitc is a fictional company hence using this public data to explore the different types of riders and their behaviours. Riders’ personally identifiable information has been removed from the data due to data privacy policies.\nAnalysis for this case study is made using data from February 2021 to February 2022, which is stored in separate files for each month. During the analysis, I stored original copies of the data on a secured hard drive, and worked with copies of the data on my pc.\nDue to the large size of the dataset I will be using R programming language because I can do data cleaning, analysis and visualizations on the same platform.\n<a id=\"process\"></a>\n\n\n\n# Process  \n<a id=\"problems\"></a>\n\n\n## Problems that need to be fixed\n- New columns that show more about day, month, year will be added for further aggregating  \n- `started_at` and `ended_at` need to be transformed to date and time format\n- Add a column that shows trip duration (in seconds) so we can use it for analyzing\n<a id=\"clean\"></a>\n\n\n## Perform cleaning data\nLoad the useful packages:","metadata":{}},{"cell_type":"code","source":"library(tidyverse)\nlibrary(ggplot2)\nlibrary(lubridate)\nlibrary(dplyr)\nlibrary(readr)\nlibrary(janitor)\nlibrary(data.table)\nlibrary(tidyr) ","metadata":{"execution":{"iopub.status.busy":"2022-04-05T09:24:31.534049Z","iopub.execute_input":"2022-04-05T09:24:31.536022Z","iopub.status.idle":"2022-04-05T09:24:33.163254Z"},"_kg_hide-output":true,"trusted":true},"execution_count":null,"outputs":[]},{"cell_type":"markdown","source":"Load dataset:","metadata":{}},{"cell_type":"code","source":"tripdata_202102 <- read.csv(\"../input/bike-share-data/202102-divvy-tripdata/202102-divvy-tripdata.csv\")\ntripdata_202103 <- read.csv(\"../input/bike-share-data/202103-divvy-tripdata/202103-divvy-tripdata.csv\")\ntripdata_202104 <- read.csv(\"../input/bike-share-data/202104-divvy-tripdata/202104-divvy-tripdata.csv\")\ntripdata_202105 <- read.csv(\"../input/bike-share-data/202105-divvy-tripdata/202105-divvy-tripdata.csv\")\ntripdata_202106 <- read.csv(\"../input/bike-share-data/202106-divvy-tripdata/202106-divvy-tripdata.csv\")\ntripdata_202107 <- read.csv(\"../input/bike-share-data/202107-divvy-tripdata/202107-divvy-tripdata.csv\")\ntripdata_202108 <- read.csv(\"../input/bike-share-data/202108-divvy-tripdata/202108-divvy-tripdata.csv\")\ntripdata_202109 <- read.csv(\"../input/bike-share-data/202109-divvy-tripdata/202109-divvy-tripdata.csv\")\ntripdata_202110 <- read.csv(\"../input/bike-share-data/202110-divvy-tripdata/202110-divvy-tripdata.csv\")\ntripdata_202111 <- read.csv(\"../input/bike-share-data/202111-divvy-tripdata/202111-divvy-tripdata.csv\")\ntripdata_202112 <- read.csv(\"../input/bike-share-data/202112-divvy-tripdata/202112-divvy-tripdata.csv\")\ntripdata_202201 <- read.csv(\"../input/bike-share-data/202201-divvy-tripdata/202201-divvy-tripdata.csv\")\ntripdata_202202 <- read.csv(\"../input/bike-share-data/202202-divvy-tripdata/202202-divvy-tripdata.csv\") ","metadata":{"execution":{"iopub.status.busy":"2022-04-05T09:31:10.390223Z","iopub.execute_input":"2022-04-05T09:31:10.391451Z","iopub.status.idle":"2022-04-05T09:33:02.45873Z"},"_kg_hide-output":true,"trusted":true},"execution_count":null,"outputs":[]},{"cell_type":"markdown","source":"Review column names to ensure consistency throughout the dataset:","metadata":{}},{"cell_type":"code","source":"colnames(tripdata_202102)\ncolnames(tripdata_202103)\ncolnames(tripdata_202104)\ncolnames(tripdata_202105)\ncolnames(tripdata_202106)\ncolnames(tripdata_202107)\ncolnames(tripdata_202108)\ncolnames(tripdata_202109)\ncolnames(tripdata_202110)\ncolnames(tripdata_202111)\ncolnames(tripdata_202112)\ncolnames(tripdata_202201)\ncolnames(tripdata_202202)  ","metadata":{"execution":{"iopub.status.busy":"2022-04-05T09:34:54.482854Z","iopub.execute_input":"2022-04-05T09:34:54.484493Z","iopub.status.idle":"2022-04-05T09:34:54.568377Z"},"_kg_hide-output":true,"trusted":true},"execution_count":null,"outputs":[]},{"cell_type":"markdown","source":"Review data structures and data types:","metadata":{}},{"cell_type":"code","source":"str(tripdata_202102)\nstr(tripdata_202103)\nstr(tripdata_202104)\nstr(tripdata_202105)\nstr(tripdata_202106)\nstr(tripdata_202107)\nstr(tripdata_202108)\nstr(tripdata_202109)\nstr(tripdata_202110)\nstr(tripdata_202111)\nstr(tripdata_202112)\nstr(tripdata_202201)\nstr(tripdata_202202)","metadata":{"execution":{"iopub.status.busy":"2022-04-05T09:34:58.833902Z","iopub.execute_input":"2022-04-05T09:34:58.835863Z","iopub.status.idle":"2022-04-05T09:34:59.314817Z"},"_kg_hide-output":true,"trusted":true},"execution_count":null,"outputs":[]},{"cell_type":"markdown","source":"Combine all datasets into a single dataframe providing the structure is consistent:","metadata":{}},{"cell_type":"code","source":"all_trips <- bind_rows(tripdata_202102,tripdata_202103,tripdata_202104,tripdata_202105,tripdata_202106,tripdata_202107,tripdata_202108,tripdata_202109,tripdata_202110,tripdata_202111,tripdata_202112,tripdata_202201,tripdata_202202)","metadata":{"execution":{"iopub.status.busy":"2022-04-05T09:35:05.061815Z","iopub.execute_input":"2022-04-05T09:35:05.063207Z","iopub.status.idle":"2022-04-05T09:35:13.000287Z"},"_kg_hide-output":true,"trusted":true},"execution_count":null,"outputs":[]},{"cell_type":"markdown","source":"Remove columns that are not required in the scope of project:","metadata":{}},{"cell_type":"code","source":"all_trips <- all_trips %>%\n  select(-c(start_lat:end_lng))\nglimpse(all_trips)","metadata":{"execution":{"iopub.status.busy":"2022-04-05T09:35:24.588063Z","iopub.execute_input":"2022-04-05T09:35:24.589463Z","iopub.status.idle":"2022-04-05T09:35:24.631433Z"},"_kg_hide-output":true,"trusted":true},"execution_count":null,"outputs":[]},{"cell_type":"markdown","source":"Rename `rideable_type` to `bike_type` and `member_casual`  to `member_type` simultaneously","metadata":{}},{"cell_type":"code","source":"all_trips <- all_trips %>%\n  rename(\n    bike_type = rideable_type,\n    member_type = member_casual)","metadata":{"execution":{"iopub.status.busy":"2022-04-05T09:35:27.743418Z","iopub.execute_input":"2022-04-05T09:35:27.745212Z","iopub.status.idle":"2022-04-05T09:35:27.760887Z"},"_kg_hide-output":true,"trusted":true},"execution_count":null,"outputs":[]},{"cell_type":"markdown","source":"Add columns that show the date, month, day and year of each ride:","metadata":{}},{"cell_type":"code","source":"all_trips$date <- as.Date(all_trips$started_at)\nall_trips$month <- format(as.Date(all_trips$date),'%m')\nall_trips$day <- format(as.Date(all_trips$date),'%d')\nall_trips$year <- format(as.Date(all_trips$date),'%y')\nall_trips$day_of_week <- format(as.Date(all_trips$date), '%A')","metadata":{"execution":{"iopub.status.busy":"2022-04-05T09:35:30.280921Z","iopub.execute_input":"2022-04-05T09:35:30.282757Z","iopub.status.idle":"2022-04-05T09:36:02.964314Z"},"_kg_hide-output":true,"trusted":true},"execution_count":null,"outputs":[]},{"cell_type":"markdown","source":"Add `trip_duration` to show trip duration and inspect the table: ","metadata":{}},{"cell_type":"code","source":"all_trips$trip_duration <- difftime(all_trips$ended_at,all_trips$started_at)\nstr(all_trips)","metadata":{"execution":{"iopub.status.busy":"2022-04-05T09:36:51.452604Z","iopub.execute_input":"2022-04-05T09:36:51.454473Z","iopub.status.idle":"2022-04-05T09:37:24.430378Z"},"_kg_hide-output":true,"trusted":true},"execution_count":null,"outputs":[]},{"cell_type":"markdown","source":"Trips that have duration <= 30 seconds are bikes that had quality checks so we will remove those entries and make a new version of the dataframe","metadata":{}},{"cell_type":"code","source":"all_trips_2 <- subset(all_trips,trip_duration>30)","metadata":{"execution":{"iopub.status.busy":"2022-04-05T09:37:45.69882Z","iopub.execute_input":"2022-04-05T09:37:45.70025Z","iopub.status.idle":"2022-04-05T09:37:58.133026Z"},"_kg_hide-output":true,"trusted":true},"execution_count":null,"outputs":[]},{"cell_type":"markdown","source":"Add `time_start` for hours of the day that the bikes are rented. The time needs to be extract from `started_at`, however `ggplot2` only support time of class POSIXct. Hence, we need to first convert the column to character vector, remove the date element. Then convert it back to `POSIXct` for plotting later.","metadata":{}},{"cell_type":"code","source":"all_trips_2$time_start <- format(all_trips_2$started_at, format = \"%H:%M\")\nall_trips_2$time_start <- as.POSIXct(all_trips_2$time_start)\nglimpse(all_trips_2)","metadata":{"execution":{"iopub.status.busy":"2022-04-05T09:39:15.890338Z","iopub.execute_input":"2022-04-05T09:39:15.891801Z","iopub.status.idle":"2022-04-05T09:40:02.10772Z"},"_kg_hide-output":true,"trusted":true},"execution_count":null,"outputs":[]},{"cell_type":"markdown","source":"<a id=\"analysis\"></a>\n\n\n# Analysis\nReview trip duration on each member type:","metadata":{}},{"cell_type":"code","source":"all_trips_2 %>%\n  group_by(member_type) %>%\n  summarise(min_trip_duration=min(trip_duration), max_trip_duration=max(trip_duration), median_trip_duration=median(trip_duration),mean_trip_duration=mean(trip_duration))","metadata":{"execution":{"iopub.status.busy":"2022-04-05T09:40:15.926746Z","iopub.execute_input":"2022-04-05T09:40:15.928175Z","iopub.status.idle":"2022-04-05T09:40:19.01911Z"},"_kg_hide-output":true,"trusted":true},"execution_count":null,"outputs":[]},{"cell_type":"markdown","source":"We can see that members are more likely to have shorter trip duration than casual riders. Which could due to members use bikes to commute to work daily so they need to get to the destination as soon as possible. Meanwhile for casual riders, the purpose is more for excercising or refreshing\n\nCompare the trip durations and number of trips for both member types in days of week from Monday to Sunday","metadata":{}},{"cell_type":"code","source":"all_trips_2$day_of_week <- ordered(all_trips_2$day_of_week, levels=c('Monday','Tuesday','Wednesday','Thursday','Friday', 'Saturday','Sunday'))\nall_trips_2 %>% \n  group_by(member_type, day_of_week) %>%  \n  summarise(number_of_rides = n(),average_duration_secs = mean(trip_duration)) %>% \n  arrange(member_type, day_of_week)","metadata":{"execution":{"iopub.status.busy":"2022-04-05T09:41:40.14595Z","iopub.execute_input":"2022-04-05T09:41:40.148263Z","iopub.status.idle":"2022-04-05T09:41:40.71515Z"},"_kg_hide-output":true,"trusted":true},"execution_count":null,"outputs":[]},{"cell_type":"markdown","source":"Casual riders have fewer number of rides but the average durations are larger than of member riders'. We will take a closer look at the visualization","metadata":{}},{"cell_type":"markdown","source":"\n<a id=\"share\"></a>\n\n\n# Share/Visualization\nCreate a column chart to visualize total trips made by customer types on different days of the week","metadata":{}},{"cell_type":"code","source":"all_trips_2 %>%  \n  group_by(member_type, day_of_week) %>% \n  summarise(number_of_rides = n()) %>% \n  arrange(member_type, day_of_week)  %>% \n  ggplot(aes(x = day_of_week, y = number_of_rides, fill = member_type)) +\n  labs(title ='Total trips by Customer Types',subtitle = 'On days of the week', x='Day of the week', y='Number of rides') +\n  theme(legend.title=element_blank())+\n  geom_col(width=0.5, position = position_dodge(width=0.5)) +\n  scale_y_continuous(labels = function(x) format(x, scientific = FALSE))","metadata":{"execution":{"iopub.status.busy":"2022-04-05T09:41:44.949436Z","iopub.execute_input":"2022-04-05T09:41:44.951337Z","iopub.status.idle":"2022-04-05T09:41:45.952207Z"},"_kg_hide-output":true,"trusted":true},"execution_count":null,"outputs":[]},{"cell_type":"markdown","source":"It is shown that *casual riders tend to rent bikes more over the weekends*. On the other hand, *member riders are likely to use the service more during weekdays*. \n\nCreate a line chart showing bike demands during the day","metadata":{}},{"cell_type":"code","source":"all_trips_2 %>%\n  group_by(hour_of_day = hour(round_date(time_start, 'hour'))) %>% \n  group_by(hour_of_day, member_type) %>% \n  summarize(number_of_rides = n(), .groups = 'drop') %>% \n  arrange(-number_of_rides) %>% \n  ggplot(aes(x = hour_of_day, y = number_of_rides, fill = member_type)) +\n  geom_bar(position = 'dodge', stat = 'identity') + scale_y_continuous(labels = scales::comma) +\n  scale_x_continuous(breaks = c(0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23)) +\n  theme(legend.title=element_blank())+\n  labs(x = \"Time of the Day (h)\", y = \"Number of Rides\",\n       title = \"Average Number of Rides by Hour\")","metadata":{"execution":{"iopub.status.busy":"2022-04-05T09:46:15.636071Z","iopub.execute_input":"2022-04-05T09:46:15.637949Z","iopub.status.idle":"2022-04-05T09:46:20.662616Z"},"_kg_hide-output":true,"trusted":true},"execution_count":null,"outputs":[]},{"cell_type":"markdown","source":"Member riders use the service more often from 8:00 to 18:00 which is the office hours. Meanwhile casual riders tend to rent the bikes more around 18:00, this could be due to people have more time after office hours and want to rent bikes to get home or for exercising purpose.  \n\nNext, we will take a look at the relationship between `bike_type` and `member_type` to see which bike type is the most popular","metadata":{}},{"cell_type":"code","source":"all_trips_2 %>%\n  group_by(bike_type, member_type) %>%\n  summarise(number_of_rides = n()) %>%  \n  ggplot(aes(x= bike_type, y=number_of_rides, fill= member_type))+\n  geom_bar(stat='identity') +\n  scale_y_continuous(labels = function(x) format(x, scientific = FALSE)) +\n  labs(title =\"Number of rides by Bike type\", x='Bike type', y='Number of rides') +\n  theme(legend.title=element_blank())","metadata":{"execution":{"iopub.status.busy":"2022-04-05T09:46:53.314544Z","iopub.execute_input":"2022-04-05T09:46:53.31631Z","iopub.status.idle":"2022-04-05T09:46:54.019092Z"},"_kg_hide-output":true,"trusted":true},"execution_count":null,"outputs":[]},{"cell_type":"markdown","source":"Classic bike is the most popular among members with the number of rides almost doubled the electric bike. In addition, only casual members use docked bike\n<a id=\"key\"></a>\n\n\n# Key takeaways\n- Members are more likely to have shorter trip duration than casual riders\n- Casual riders have fewer number of rides but the average durations are longer than of member riders'\n- Member riders use bike more often during office hours while 8:00 - 18:00 while casual riders usually rent bike after working hours from 18:00 onwards\n- Casual riders tend to rent bikes more over the weekends and member riders use bikes more on weekdays\n- Classic bike has the highest demand for both members and casual riders\n<a id=\"act\"></a>\n\n\n# Act/Recommendations\nIn order to attract more casual riders to become members, we need to run campaign that targets them outside of working hours\n- Discount promotions for trips over 30 minutes for both casual and member riders which encourage riders to use the bikes more\n- Giveaway gifts such as protection equipments for first time members over weekends and weeknights\n- Give rewards for riders who achieve different milestones and even more rewards for achieving milestones as members","metadata":{}}]}