source("index.R")
library("tidytext")

colnames(body)[1] <- "identification"


filter.by.body <- c()
body.paragraph <- c()
body.title <- c()

for(i in 1:length(body$body$legacy)) {
  if(length(body$body$legacy[[i]]$body) > 0) {
    filter.by.body <- append(filter.by.body, TRUE)
    body.title <- append(body.title, body$title)
    body.paragraph <- append(body.paragraph, body$body$legacy[[i]]$body) 
  } else {
    filter.by.body <- append(filter.by.body, FALSE)
  } 
}
body.filtered <- body$identification[body$published == TRUE & filter.by.body]
body.id <- 
  body$identification[body$published == TRUE & filter.by.body]
body.title <- 
  body$title[body$published == TRUE & filter.by.body]
body.paragraph <- 
  body$body$legacy[body$published == TRUE & filter.by.body]
body.paragraph <- 
  sapply(body.paragraph, "[[", "body")

body.filtered <- 
  data.frame(body.id, body.title, body.paragraph, stringsAsFactors = FALSE)
View(body.filtered) 
View(body.paragraph)