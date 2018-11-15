#Get data and grab from pubmed
library(RISmed)

search_topic <- 
search_query <- EUtilsSummary(search_topic, mindate = 2008, maxdate=2018, retmax = 10000)

records <- EUtilsGet(search_query)

DATA <- data.frame(PMID = records@PMID, 
                   Title = records@ArticleTitle,
                   Journal = records@Title,
                   Year = records@YearPubmed,
                   month = records@MonthPubmed,
                   author = records@Author
)


pubmed_data <- data.frame('Title'=ArticleTitle(records),'Abstract'=AbstractText(records))

as.Date(paste(records@DayReceived, records@MonthReceived, records@YearReceived, sep = "-"), format = "%d-%m-%Y")

ls <- list(ID = records@PMID, 
           Title = records@ArticleTitle, 
           Author = records@Author, 
           Journal = records@Journal, 
           DateReceived = as.Date(paste(records@DayReceived, records@MonthReceived, records@YearReceived, sep = "-"), format = "%d-%m-%Y"),
           DatePublished = as.Date(paste(records@DayReceived, records@MonthReceived, records@YearReceived, sep = "-"), format = "%d-%m-%Y"),