#Get data and grab from pubmed
library(RISmed)

companies <- c("abcam", "abclonal", 'sigma', 'thermofisher', 'st johns laboratory', "sicgen", "everest", "santa cruz", "dako")

Company_list <- list()

for (i in companies){
        
search_topic = paste0("(",as.character(i), " AND antibody)")

search_query <- EUtilsSummary(query = search_topic, db = "pubmed")

records <- EUtilsGet(search_query)

ls <- list(PMID = records@PMID, 
           ID = records@NlmUniqueID,
           ArticleID = records@ArticleId, 
           ISSN = records@ISSN,
           LocationID = records@ELocationID, 
           ArticleTitle = records@ArticleTitle, 
           Title = records@Title,
           DateReceived = as.Date(paste(records@DayReceived, records@MonthReceived, records@YearReceived, sep = "-"), format = "%d-%m-%Y"),
           DatePPublished = as.Date(paste(records@DayPpublish, records@MonthPpublish, records@YearPpublish, sep = "-"), format = "%d-%m-%Y"),
           DateEPublished = as.Date(paste(records@DayEpublish, records@MonthEpublish, records@YearEpublish, sep = "-"), format = "%d-%m-%Y"),
           DatePubmed = as.Date(paste(records@DayPubmed, records@MonthPubmed, records@YearPubmed, sep = "-"), format = "%d-%m-%Y"),
           Volume = records@Volume, 
           Issue = records@Issue, 
           MedlineTA = records@MedlineTA,
           Status = records@PublicationStatus, 
           PublicationType = records@PublicationType,
           Author = records@Author, 
           Affiliation = records@Affiliation,
           GrantID = records@GrantID,
           Agency = records@Agency, 
           Country = records@Country, 
           Abstract = records@AbstractText, 
           Mesh = records@Mesh)
           

Company_list[[i]] <- ls         
Sys.sleep(10)

}      




