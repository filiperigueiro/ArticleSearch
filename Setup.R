install.packages("RISmed")
library(RISmed)

search_topic <- "abcam"
search_query <- EUtilsSummary(search_topic, mindate = 2000, maxdate=2018, retmax = 10000)

records <- EUtilsGet(search_query)

DATA <- data.frame(Title = records@ArticleTitle,
                   Journal = records@Title,
                   PMID = records@PMID, 
                   Year = records@YearPubmed
)


pubmed_data <- data.frame('Title'=ArticleTitle(records),'Abstract'=AbstractText(records))
