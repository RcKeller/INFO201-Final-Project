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


# library("shiny")
library(Hmisc)
library(httr)
library(jsonlite)
library(dplyr)
library(tidyr)
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


# EX: "https://api.propublica.org/congress/v1/115/bills/hr21.json"
# https://uwstf.org/v2/proposal/?query={"year":"<2018"}&populate=["body"]&select=["title","year","number","organization","category","asked","received","body"]
stf.api <- "https://uwstf.org/v2"
model <- 'proposal'
query <- '"year":"<2018"'
populate <- '"body"'

resource <- sprintf('/%s/?query={%s}&populate=[%s]', model, query, populate)
uri <- paste0(stf.api, resource)

response <- GET(uri)
proposals <- fromJSON(content(response, "text"))
# body <- fromJSON(content(response, "text"))

body.colnames <- c('title','body')
data <- flatten(proposals) %>%
  filter(published == TRUE) %>%
  filter(length(body.legacy) > 0) %>%
  select(title, year, quarter, asked, received, category, content = body.legacy)
  # flatten(content)
# mutate(content = attach(content))
# mutate(content = as.data.frame(content))
  # mutate(content = as.data.frame(do.call(rbind, content[[1]])))
  # mutate(test = data.frame(unlist(body.legacy)))
  # mutate(test = unnest(body.legacy))
  # mutate(test = do.call(rbind, lapply(body.legacy, data.frame, stringsAsFactors=FALSE)))
  # mutate(test = data.frame(matrix(unlist(body.legacy)),stringsAsFactors=FALSE))
  # mutate(test = length(body.legacy))
  # mutate(body = as.data.frame(body.legacy)) %>%
  # mutate(content = data.frame(words = unlist(body.legacy)))
  # mutate(content = do.call(rbind.data.frame, body.legacy))
  # mutate(content = list(body.legacy$title, body.legacy$body))
  # filter(length(body) > 0)
# print(data)

# test <- as.data.frame(data$body.legacy, check.names = FALSE, stringAsFactors = FALSE)
# test <- data.frame(data$content, row.names = c('title','body'))
# test <- select(data$content, title)

data$test = "test"
for (i in 1:length(data$content)) {
  data$test[[i]] <- paste(data$content[[i]]$body, collapse = '')
}
#