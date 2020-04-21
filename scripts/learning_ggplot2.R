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

# challenge 2

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
       mapping = aes(x=gdpPercap, 
       y=lifeExp,colour=continent, size=pop)
       )+geom_point()

# another way of writing the same command

ggplot(gapminder_1977,
       aes(x=gdpPercap, y=lifeExp, 
      colour=continent, size=pop)
      )+geom_point()

# to add the log scale to x axis

ggplot(data=gapminder_1977, 
       mapping = aes(x=gdpPercap, y=lifeExp, 
                     colour=continent, size=pop)
)+geom_point()+scale_x_log10()

# challenge 4

ggplot(data=gapminder_1977, 
       mapping = aes(x=pop, y=lifeExp, 
                     colour=continent, size=gdpPercap)
)+geom_point()+scale_x_log10()

# mapping can be defined for each geom function seperately

ggplot(
  data=gapminder_1977
) + geom_point( mapping = aes(x=gdpPercap, y=lifeExp, 
                     colour=continent, size=pop))

# challenge 5

# aesthetics that can be mapped to a geom -> by searching 
# geom and find under Aesthetics
# e.g. for geom_point( ) understands the following aesthetics
# x, y, alpha, colour, fill, group, shape, size, stroke

# setting the value of an aesthetic directly 
# by assigning it outside of the aes() function

ggplot(gapminder_1977, aes(x = gdpPercap, y = lifeExp)) +
  geom_point(colour = "blue", size = 5) +scale_x_log10()

# challenge 6

ggplot(gapminder_1977, aes(x = gdpPercap, y = lifeExp)) +
  geom_point(colour = "red", size = 2, alpha=3, shape=2) +scale_x_log10()

