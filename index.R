# DEPENDENCIES

# install.packages("shiny")
# install.packages('Hmisc')
# install.packages('httr')
# install.packages('jsonlite')
# install.packages('dplyr')
# install.packages("tidyr")
# install.packages("countrycode")
# install.packages("ggplot2")
# install.packages("maps")
# install.packages("sp")
# install.packages("maptools")
# install.packages('tidytext')
# install.packages('tm')
# install.packages('SnowballC')
# install.packages('syuzhet')
# install.packages('tidyverse')


# library("shiny")
library(Hmisc)
library(httr)
library(jsonlite)
library(dplyr)
library(tm)
library(SnowballC)
library(syuzhet)
# library(tidyverse)
#library(tidyr)
#library(tidytext)
# library("countrycode")
# library("ggplot2")
# library("maps")
# library("sp")
# library("maptools")

# IMPORTS
# relative.path <- '~info201/INFO201-Final-Project'
# setwd(relative.path)

# emissions.data <- read.csv(
#   './data/WDI_emissions_Data.csv',
#   fileEncoding = 'UTF-8-BOM',
#   stringsAsFactors = FALSE
# )

# source('./ui.R')
# source('./server.R')
#
# # START APPLICATION
# shinyApp(ui = the.ui, server = the.server)

source('./src/GetProposals.R')
proposals <- GetProposals()
source('./src/AnalyzeProposals.R')