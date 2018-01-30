# Exercise 5: dplyr grouped operations

# Install the `nycflights13` package. Load (`library()`) the package.
# You'll also need to load `dplyr`
# install.packages("nycflights13")  # should be done already
library(nycflights13)
library(dplyr)

# View(flights)

# What was the average departure delay in each month?
# Save this as a data frame `dep.delay.by.month`
# Hint: you'll have to perform a grouping operation before summarizing your data
dep.delay.by.month <- group_by(flights, month) %>% 
  summarize(average_dep_delay = mean(dep_delay, na.rm = TRUE))

# Which month had the greatest average departure delay?
filter(dep.delay.by.month, average_dep_delay == max(average_dep_delay)) %>% 
  select(month)

# If your above data frame contains just two columns (e.g., "month", and "delay"
# in that order), you can create a scatterplot by passing that data frame to the
# 'plot()' function
plot(dep.delay.by.month)

# To which destinations were the average arrival delays the highest?
# Hint: you'll have to perform a grouping operation before summarizing your data
arr.delay.by.dest <- group_by(flights, dest) %>% 
  summarize(average_arr_delay = mean(arr_delay, na.rm = TRUE)) %>% 
  filter(average_arr_delay == max(average_arr_delay, na.rm = TRUE)) %>% 
  select(dest)

# You can look up these airports in the `airports` data frame!
filter(airports, faa == arr.delay.by.dest$dest[1])

# Which city was flown to with the highest average speed?
# speed = distance/air_time * 60
speed.by.dest <- flights %>% mutate(speed = distance/air_time * 60) %>% 
  group_by(dest) %>% summarize(average_speed = mean(speed, na.rm = TRUE)) %>% 
  arrange(-average_speed)
speed.by.dest
