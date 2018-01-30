# Exercise 3: using the pipe operator

# Install (if needed) and load the "dplyr" library


# Install (if needed) and load the "fueleconomy" package
# install.packages('devtools')
# devtools::install_github("hadley/fueleconomy")
View(vehicles)

# Which 2015 Acura model has the best hwy MGH? (Use dplyr, but without method
# chaining or pipes)
Acura.2015 <- filter(vehicles, make == "Acura" & year == 2015)
max.mpg.acura <- filter(Acura.2015, hwy == max(hwy))
select(max.mpg.acura, model)

# Which 2015 Acura model has the best hwy MPG? (Use dplyr, nesting functions)
# select(filter(vehicles, make == "Acura" & year == 2015 & hwy == max(hwy)), model)

select(
  filter( 
    filter( 
      filter(
        vehicles, 
        make == "Acura"
      ),
      year == 2015
    ),
    hwy == max(hwy) 
  ),
  model # other args for the Step 3 select
)


# Which 2015 Acura model has the best hwy MPG? (Use dplyr and the pipe operator)
filter(vehicles, make == "Acura") %>% filter(year == 2015) %>% filter(hwy == max(hwy)) %>% select(model)


### Bonus

# Write 3 functions, one for each approach.  Then,
# Test how long it takes to perform each one 1000 times
