
#PUBMED
library(RISmed)

search_topic <- "abcam"
search_query <- EUtilsSummary(search_topic, mindate = 2000, maxdate=2018, retmax = 1000)

records <- EUtilsGet(search_query)

DATA <- data.frame(Title = records@ArticleTitle,
                   Journal = records@Title,
                   PMID = records@PMID, 
                   Year = records@YearPubmed
)


pubmed_data <- data.frame('Title'=ArticleTitle(records),'Abstract'=AbstractText(records))

ls <- list(ID = records@PMID, Title = records@ArticleTitle, Author = records@Author)


###SCOPUS
library(rscopus)
options("elsevier_api_key" = "dc1e6fa872979812a50e0e3ca4920700")
library(dplyr)
res = author_df(last_name = "Muschelli", first_name = "John", verbose = FALSE, general = FALSE)
names(res)

test <- scopus_search("abcam")
test_2<- abstract_retrieval("85055909144", identifier = "scopus_id")
generic_elsevier_api(quary = "abcam", type = 'Search', search_type = "scopus")


#Core
install.packages("rcoreoa")
library(rcoreoa)
test_core <- core_search(query = 'abcam', limit = 100, key = "3NIXFaCqEGJUYfwkhmyWPuR7i8geO6dp")


apiKey <- '3NIXFaCqEGJUYfwkhmyWPuR7i8geO6dp'

test_core_article <- core_articles(test_core$data$id[1], key = apiKey)

library(jsonlite)

a <- fromJSON("https://core.ac.uk:443/api-v2/search/abcam?page=1&pageSize=100&apiKey=3NIXFaCqEGJUYfwkhmyWPuR7i8geO6dp")
a

b <- fromJSON("https://core.ac.uk:443/api-v2/articles/get/159812443?metadata=true&fulltext=true&citations=true&similar=false&duplicate=false&urls=false&faithfulMetadata=false&apiKey=3NIXFaCqEGJUYfwkhmyWPuR7i8geO6dp")
