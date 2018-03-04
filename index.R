library(shiny)
library(Hmisc)
library(httr)
library(jsonlite)
library(dplyr)

# emissions.data <- read.csv(
#   './data/WDI_emissions_Data.csv',
#   fileEncoding = 'UTF-8-BOM',
#   stringsAsFactors = FALSE
# )
# emissions.metadata <- read.csv(
#   './data/WDI_emissions_Definition and Source.csv',
#   fileEncoding = 'UTF-8-BOM',
#   stringsAsFactors = FALSE
# )
# source('./server/index.R')
# source('./client/index.R')
# ui <- App()
#
# # START APPLICATION
# shinyApp(ui, server)

source('./config/keys.R')

# TEAM: Can you help TS?
# https://cran.r-project.org/web/packages/httr/vignettes/quickstart.html
# http://course-catalog-api-guide.readthedocs.io/en/latest/authentication/index.html#example-access-token-request

authorization.request <- edx.request.token.payload(edx.client.id, edx.client.secret)
print(authorization.request)

response <- POST(
  edx.request.token.uri,
  body = authorization.request
)
print(response)

body <- fromJSON(content(response, "text"))
print(body)
