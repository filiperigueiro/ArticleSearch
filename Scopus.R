library(rscopus)

options("elsevier_api_key" = "dc1e6fa872979812a50e0e3ca4920700")
library(dplyr)

test <- scopus_search("abcam")
test_2<- abstract_retrieval("85055909144", identifier = "scopus_id")
test3 <- generic_elsevier_api(query = "abcam", type = 'search', search_type = "scopus")

url <- "https://api.elsevier.com/content/search/scopus?query=abcam&apiKey=7f59af901d2d86f78a1fd60c1bf9426a"
query <- fromJSON(url)
