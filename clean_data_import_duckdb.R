library(tidyverse)
library(lubridate)
library(janitor)
library(scales)
library(duckdb)

# Read data and clean column names
rm(list=ls())
# zone_temps <- read_csv('https://raw.githubusercontent.com/rfordatascience/tidytuesday/master/data/2023/2023-07-11/zonann_temps.csv') |> clean_names()
# ## create duckdb database:
# zone_temps <- zone_temps |> rename(
#                    S24_S24 =  x24s_24n)
# Shorte
con <- dbConnect(duckdb("tempature_rising.duckdb"))
zone_temps <- dbGetQuery(con, "SELECT * FROM hemispheres;")

dbDisconnect(con, shutdown = TRUE)

plot(zone_temps$year, zone_temps$global * 9/5 + 32, type = "l", xlab = "Year", ylab = "Temperature (°F)")
grid()
