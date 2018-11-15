
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
