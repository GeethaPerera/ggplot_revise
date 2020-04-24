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

gapminder <- read_csv("data/gapminder_data.csv")

gapminder_1977 <- filter(gapminder, year==1977)
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

# challenge 7 - scatter plot showing how life expectancy 
# has changed over time
ggplot(data = gapminder, mapping = aes(x = year, y = lifeExp)) + geom_point()

# visualising the data as a line graph
ggplot(data= gapminder, aes(x = year,
      y = lifeExp, group=country, 
      colour= continent)) +
      geom_line()

# visualising the data as a line graph also with points 
# or adding another layer
ggplot(data= gapminder, aes(x = year,
       y = lifeExp, group=country, 
      colour= continent)) +
      geom_line()+geom_point()

# challenge 8

# visualising the data as a line graph also with points (with only 
# drawing the lines in colour) 
# and plotting the points on top of line (by the order from lines to points))

ggplot(data = gapminder, aes(x = year, y = lifeExp, group=country))+ 
      geom_line(mapping = aes(colour=continent))+
      geom_point()
#or

ggplot(data = gapminder, aes(x = year, y = lifeExp, group=country))+ 
  geom_line(mapping = aes(colour=continent))+
  geom_point(colour="black")

# the following will push the points layer back and bring up the line layer on top
ggplot(data = gapminder, aes(x = year, y = lifeExp, group=country))+ 
  geom_point(colour="black")+ 
  geom_line(mapping = aes(colour=continent))

# Transformations and statistics

ggplot(data = gapminder, mapping = aes(x = gdpPercap, y = lifeExp))+
  geom_point()

# can modify the transperancy of points (setting the aesthetic outside the aes( )
# function - apply to all the points)

ggplot(data = gapminder, mapping = aes(x = gdpPercap, y = lifeExp))+
  geom_point(alpha=0.5)

# mapping alpha to a variable in the data (e.g. contienent)

ggplot(data = gapminder, mapping = aes(x = gdpPercap, y = lifeExp))+
  geom_point(aes(alpha=continent))

# to transform the scale of x axis to log 

ggplot(data = gapminder, mapping = aes(x = gdpPercap, y = lifeExp))+
  geom_point(alpha=0.5)+scale_x_log10()

# fitting a simple relationship to the data by adding another layer 

ggplot(data = gapminder, mapping = aes(x = gdpPercap, y = lifeExp))+
  geom_point(alpha=0.5)+scale_x_log10()+
geom_smooth(method = "lm")

# make the line thicker (done outside the aes of the main plot)
ggplot(data = gapminder, mapping = aes(x = gdpPercap, y = lifeExp))+
  geom_point(alpha=0.5)+scale_x_log10()+
  geom_smooth(method = "lm", size = 1.5)

# Challenge 9 - modifying the size and colour of the 
# points layer without adding it to the ase()function

ggplot(data = gapminder, mapping = aes(x = gdpPercap, y = lifeExp))+
  geom_point(alpha=3, colour="orange")+scale_x_log10()+
  geom_smooth(method = "lm")

# Challenge 10 - modifying the shape and colour of the points (coloured by continent)
# with new trend lines (shape = solid triangles)

ggplot(data = gapminder, mapping = aes(x = gdpPercap, y = lifeExp, colour=continent))+
  geom_point(size=1.5, shape=17)+scale_x_log10()+
  geom_smooth(method = "lm", size=1.5)

# adding a colour scale manually

ggplot(data = gapminder, mapping = aes(x = gdpPercap, y = lifeExp, color = continent)) +
  geom_point() + 
  scale_x_log10() +
  scale_colour_manual(values = c("red", "green", "blue", "purple", "black"))

# Challenge 11

colours() # to see a list of colours that R uses

# modifying the plots by changing colours using the one that R uses

ggplot(data = gapminder, mapping = aes(x = gdpPercap, y = lifeExp, color = continent)) +
  geom_point() + 
  scale_x_log10() +
  scale_colour_manual(values = c("649", "29", "35", "543", "44"))

# modifying the plots by changing colours using ColorBrewer 
# (search google to find out the pallette names)

ggplot(data = gapminder, mapping = aes(x = gdpPercap, y = lifeExp, color = continent)) +
  geom_point() + 
  scale_x_log10() +
  scale_color_brewer(palette = "Set1")

# seperating figures (adding facet_wrap() as a layer)
# prepare seperate figures for country names starting with 'A'

a_countires <- filter(gapminder, str_starts(country,"A"))
a_countires

ggplot(data=a_countires,mapping = aes(x= year, y = lifeExp, colour=continent))+
  geom_line()+
  facet_wrap(~country)

# Challenge 12 (gapminder data change through time)

ggplot(
  data = gapminder, 
  mapping = aes(x = gdpPercap, y = lifeExp, colour = continent, size = pop)
  )+
  geom_point() +
  scale_x_log10()+
  facet_wrap ( ~ year)

#  Challenge 13 - creating a density plot 
# by filling with continent and separating by year

ggplot(
  data = gapminder, 
  mapping = aes(x = pop, fill = continent)
  ) + geom_density(alpha=0.6) +
  scale_x_log10()+
  facet_wrap ( ~ year)

# Challenge 14 - Exploring blackman.wheat data set

install.packages("agridat")

library(agridat)
blackman.wheat 
view(blackman.wheat)

ggplot(data = blackman.wheat, mapping = aes(x=nitro, y=yield, colour=loc))+geom_point()+facet_wrap ( ~ gen)

ggplot(data = blackman.wheat, mapping = aes(x=loc, y=yield, colour=nitro))+geom_point()+facet_wrap ( ~ gen)

ggplot(data = blackman.wheat, mapping = aes(x=gen, y=yield, colour=nitro))+geom_point()+facet_wrap ( ~ loc)

# additional work by adding plot title, axis title, and legend etc

final_plot <- ggplot(data = blackman.wheat, mapping = aes(x=gen, y=yield, colour=nitro))+geom_point()+facet_wrap ( ~ loc)

final_plot+labs(
  title = "Effect of fertiliser treatment", # main title of the figure
  x = "genotype", # x axis title
  y= "yield", # y axis title
  colour = "nitrogen level")

# additional work by changing font sizes etc
final_plot+labs(
  title = "Effect of fertiliser treatment", # main title of the figure
  x = "genotype", # x axis title
  y= "yield", # y axis title
  colour = "nitrogen level"
  ) + theme_bw()+
  theme(axis.text = element_text(size = 4),
        axis.title = element_text(size = 8),
        legend.text = element_text(size = 5),
        legend.title = element_text(size = 8),
        plot.title = element_text(size = 10))

# Preparing plots for display

library (tidyverse)

gapminder <- read_csv("data/gapminder_data.csv")

a_countires <- filter(gapminder, str_starts(country,"A"))
a_countires

rough_plot <- ggplot(data=a_countires, aes(x= year, y = lifeExp, colour=continent))+
  geom_line()+
  facet_wrap(~country)

rough_plot

rough_plot+labs(
  title = "Figure 1", # main title of the figure
  x = "Year", # x axis title
  y= "Life expectancy", # y axis title
  colour = "continent") # title of the legend

# challenge 1- change the title to make sense

rough_plot+labs(
  title = "Change of life expectancy over time", 
  x = "Year", 
  y= "Life expectancy", 
  colour = "continent",
  caption = "Data source - gapminder") 

# Modifying looks (the default theme - theme_grey)

# theme_bw 

rough_plot +
  labs(
  title = "Change of life expectancy over time", 
  x = "Year", 
  y= "Life expectancy", 
  colour = "continent",
  caption = "Data source - gapminder"
  )+
  theme_bw()

# theme_linedraw

rough_plot +
  labs(
    title = "Change of life expectancy over time", 
    x = "Year", 
    y= "Life expectancy", 
    colour = "continent",
    caption = "Data source - gapminder"
  )+
  theme_linedraw()

#theme_minimal

rough_plot +
  labs(
    title = "Change of life expectancy over time", 
    x = "Year", 
    y= "Life expectancy", 
    colour = "continent",
    caption = "Data source - gapminder"
  )+
  theme_minimal()

# modifying individual elements using theme ( )

# to make the frontface of the title bold and
# remove minor gridlines from the axes

rough_plot +
  labs(
    title = "Change of life expectancy over time", 
    x = "Year", 
    y= "Life expectancy", 
    colour = "continent",
    caption = "Data source - gapminder"
  )+theme_bw() +
theme(panel.grid.minor = element_blank(),
      plot.title = element_text(face = "bold"))

# Challenge 2

# to remove gray boxes behind the country names

rough_plot +
  labs(
    title = "Change of life expectancy over time", 
    x = "Year", 
    y= "Life expectancy", 
    colour = "continent",
    caption = "Data source - gapminder"
  )+theme_bw() +
  theme (strip.background = element_blank())

# to increase the size of major grid lines to 1

rough_plot +
  labs(
    title = "Change of life expectancy over time", 
    x = "Year", 
    y= "Life expectancy", 
    colour = "continent",
    caption = "Data source - gapminder"
  )+theme_bw() +
  theme(panel.grid.major = element_line(1))

# to change axis titles to be shrunk to size 10 and coloured blue

rough_plot +
  labs(
    title = "Change of life expectancy over time", 
    x = "Year", 
    y= "Life expectancy", 
    colour = "continent",
    caption = "Data source - gapminder"
  )+theme_bw() +
  theme(axis.title = element_text(size = 10, color = "blue")) 

# position the legend at the bottom of the plot

rough_plot +
  labs(
    title = "Change of life expectancy over time", 
    x = "Year", 
    y= "Life expectancy", 
    colour = "continent",
    caption = "Data source - gapminder"
  ) + theme_bw() +
theme(axis.title = element_text(size = 10, color = "blue"), legend.position = "bottom")

# Changing text sizes etc to have a better look
rough_plot +
  labs(
    title = "Change of life expectancy over time", 
    x = "Year", 
    y= "Life expectancy", 
    colour = "continent",
    caption = "Data source - gapminder"
  )+theme_bw() +
  theme(axis.text = element_text(size = 4),
        axis.title = element_text(size = 6,),
        legend.text = element_text(size = 4),
        legend.title = element_text(size = 6),
        plot.title = element_text(size = 8),
        strip.text = element_text(size =5),
        legend.position = "bottom")

# Exporting the plot using ggsave
# 1. assigned the final plot a name 

LifeExp_plot <- rough_plot +
  labs(
    title = "Change of life expectancy over time", 
    x = "Year", 
    y= "Life expectancy", 
    colour = "continent",
    caption = "Data source - gapminder"
  )+theme_bw() +
  theme(axis.text = element_text(size = 4),
        axis.title = element_text(size = 6,),
        legend.text = element_text(size = 4),
        legend.title = element_text(size = 6),
        plot.title = element_text(size = 8),
        strip.text = element_text(size =5),
        legend.position = "bottom")

LifeExp_plot

# 2. saving the final plot in an appropriate folder

ggsave(filename = "results/LifeExp.png", plot = LifeExp_plot, width = 12, height = 10, dpi = 300, units = "cm")

ggsave(filename = "results/LifeExp.pdf", plot = LifeExp_plot, width = 12, height = 10, dpi = 300, units = "cm")

# multi_panel figures

library(cowplot)

# making some plots

plot1 <- ggplot(gapminder, aes(x=gdpPercap, y=lifeExp))+ geom_point()
plot1

plot2 <- ggplot(gapminder, aes(x=continent, y=lifeExp))+geom_boxplot()
plot2

plot3 <- ggplot(gapminder, aes(x=gdpPercap, y=pop))+geom_point()
plot3

plot4 <- ggplot(gapminder, aes(x=lifeExp, y=pop))+geom_point()
plot4

# combining the plots into one using plot_grid( )

plot_grid(plot1, plot2, plot3, plot4)

# changing the size of the panel of plots

plot_grid(plot1, plot2, plot3, plot4, rel_heights = c(1,3))
plot_grid(plot1, plot2, plot3, plot4, rel_heights = c(6,8))

#labelling the figures using label ( )

plot_grid(plot1, plot2, plot3, plot4, labels = "AUTO")
plot_grid(plot1, plot2, plot3, plot4, labels = "auto")
