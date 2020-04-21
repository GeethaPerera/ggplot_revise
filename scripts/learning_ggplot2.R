# Challenge 1

#data variables are life expectancy, 
# income per person, world origin and population

#aesthetics - income per person - x axis, life expectancy - y axis, 
# world origin - colour, population - size

# geometry - points

# scales - life expectancy (linear scale), 
# income per person (logarithmic scale),
# world region (categorical scale)

# coordinate system - Cartesian coordinate system

library(tidyverse)

gaminder <- read_csv("data/gapminder_data.csv")

gapminder_1977 <- filter(gaminder, year==1977)
gapminder_1977

# ggplot() function

ggplot(data=gapminder_1977)

# produce just an empty space

ggplot(data=gapminder_1977, 
       mapping = aes(x=gdpPercap, y=lifeExp, colour=continent, size=pop))
 
# this prodcued a grid but only adding the two axes, 
# gdpPercap (x) and lifeExp (y) with default scales and coordinates
#(it has set up the plotting environment)

# to get something more happening we have to provide 
#the geometry to which these aesthetics can be applied

ggplot(data=gapminder_1977, 
       mapping = aes(x=gdpPercap, y=lifeExp, 
                     colour=continent, size=pop)
       )+geom_point()
