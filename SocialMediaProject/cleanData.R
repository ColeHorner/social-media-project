#library(readxl)

#Reading in the excel files
updatedSurvey2013 = read_excel("updatedSurvey2013.xlsx")
updatedSurvey2014 = read_excel("updatedSurvey2014.xlsx")
updatedSurvey2016 = read_excel("updatedSurvey2016.xlsx")
updatedSurvey2018 = read_excel("updatedSurvey2018.xlsx")

#Source code for the functions
source('agegroups.R')
source('func.R')

#Adding years to each of the datasets so that you can differentiate the years when
#they are combined
updatedSurvey2013 = cbind("year" = 2013, updatedSurvey2013)
updatedSurvey2014 = cbind("year" = 2014, updatedSurvey2014)
updatedSurvey2016 = cbind("year" = 2016, updatedSurvey2016)
updatedSurvey2018 = cbind("year" = 2018, updatedSurvey2018)

#Some invididual data cleaning that the different years needed before combining
updatedSurvey2013$race = sapply(updatedSurvey2013$race, fixRace2013)
updatedSurvey2016$race = sapply(updatedSurvey2016$race, fixRace)
updatedSurvey2018$race = sapply(updatedSurvey2018$race, fixRace)

#combining the data sets into one
combinedSurvey = merge(updatedSurvey2013, updatedSurvey2014, all = TRUE)
combinedSurvey = merge(combinedSurvey, updatedSurvey2016, all = TRUE)
combinedSurvey = merge(combinedSurvey, updatedSurvey2018, all = TRUE)

#calling the functions on the data sets to decode the numbers into
#legible character strings

#############################################
##CAN'T TURN COLUMNS WITH NA's INTO FACTORS##
#############################################

#demographic information
combinedSurvey$sex = as.factor(unlist(sapply(combinedSurvey$sex, fixSex)))
combinedSurvey$educationLevel = as.factor(unlist(sapply(combinedSurvey$educationLevel, fixEduc)))
combinedSurvey$employed = as.factor(unlist(sapply(combinedSurvey$empl, fixEmployed)))
combinedSurvey$income = as.factor(unlist(sapply(combinedSurvey$income, fixIncome)))
combinedSurvey$marital = sapply(combinedSurvey$marital, fixMarital)

##party information
combinedSurvey$party = sapply(combinedSurvey$party, fixParty)
combinedSurvey$demoOrRep = sapply(combinedSurvey$demoOrRep, fixDemOrRep)

##internet usage information and device usage
combinedSurvey$intAtHome = sapply(combinedSurvey$intAtHome, fixBasic)
combinedSurvey$emailIntUse = as.factor(unlist(sapply(combinedSurvey$emailIntUse, fixBasic)))
combinedSurvey$intMobile = as.factor(unlist(sapply(combinedSurvey$intMobile, fixBasic)))
combinedSurvey$intfreq = sapply(combinedSurvey$intfreq, fixIntFreq)
combinedSurvey$internetOpinionYou = sapply(combinedSurvey$internetOpinionYou, fixIntOpin)
combinedSurvey$internetOpinionSociety = sapply(combinedSurvey$internetOpinionSociety, fixIntOpin)

##usage of social media conversion
combinedSurvey$useSocialMedia = sapply(combinedSurvey$useSocialMedia, fixBasic)
combinedSurvey$useFacebook = sapply(combinedSurvey$useFacebook, fixBasic)
combinedSurvey$useTwitter = sapply(combinedSurvey$useTwitter, fixBasic)
combinedSurvey$useLinkedin = sapply(combinedSurvey$useLinkedin, fixBasic)
combinedSurvey$usePinterest = sapply(combinedSurvey$usePinterest, fixBasic)
combinedSurvey$useInstagram = sapply(combinedSurvey$useInstagram, fixBasic)
combinedSurvey$useSnapchat = sapply(combinedSurvey$useSnapchat, fixBasic)
combinedSurvey$useYoutube = sapply(combinedSurvey$useYoutube, fixBasic)
combinedSurvey$useWhatsap = sapply(combinedSurvey$useWhatsap, fixBasic)

##frequency of social media conversion
combinedSurvey$freqLinkedin = sapply(combinedSurvey$freqLinkedin, fixFreq)
combinedSurvey$freqPinterest = sapply(combinedSurvey$freqPinterest, fixFreq)
combinedSurvey$freqFacebook = sapply(combinedSurvey$freqFacebook, fixFreq)
combinedSurvey$freqInstagram = sapply(combinedSurvey$freqInstagram, fixFreq)
combinedSurvey$freqTwitter = sapply(combinedSurvey$freqTwitter, fixFreq)
combinedSurvey$freqSnapchat = sapply(combinedSurvey$freqSnapchat, fixFreq)
combinedSurvey$freqYoutube = sapply(combinedSurvey$freqYoutube, fixFreq)

#creating age groups
combinedSurvey$ageGroups <- as.factor((unlist(lapply(combinedSurvey$age, ageGroupMaker))))