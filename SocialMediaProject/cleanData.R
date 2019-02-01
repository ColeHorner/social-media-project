# install.packages("naniar")
# library(naniar)

updatedSurvey2013 = read_excel("updatedSurvey2013.xlsx")
updatedSurvey2014 = read_excel("updatedSurvey2014.xlsx")
updatedSurvey2016 = read_excel("updatedSurvey2016.xlsx")
updatedSurvey2018 = read_excel("updatedSurvey2018.xlsx")

source('func.R')

updatedSurvey2013$race = sapply(updatedSurvey2013$race, fixRace2013)
updatedSurvey2016$race = sapply(updatedSurvey2016$race, fixRace)
updatedSurvey2016$haveSmartphone1[which(is.na(updatedSurvey2016$haveSmartphone1))] = 0
updatedSurvey2016$haveSmartphone2[which(is.na(updatedSurvey2016$haveSmartphone2))] = 0
updatedSurvey2016$haveSmartphone1 = updatedSurvey2016$haveSmartphone1 + updatedSurvey2016$haveSmartphone2
colnames(updatedSurvey2016)[6] = "haveSmartphone"
updatedSurvey2016 = updatedSurvey2016[-7]
combinedSurvey = merge(updatedSurvey2013, updatedSurvey2014, all = TRUE)
combinedSurvey = merge(combinedSurvey, updatedSurvey2016, all = TRUE)

combinedSurvey$sex = sapply(combinedSurvey$sex, fixSex)
combinedSurvey$emailIntUse = sapply(combinedSurvey$emailIntUse, fixBasic)
combinedSurvey$par = sapply(combinedSurvey$par, fixBasic)
combinedSurvey$household = sapply(combinedSurvey$household, fixHH)
combinedSurvey$intMobile = sapply(combinedSurvey$intMobile, fixBasic)
combinedSurvey$freqLinkedin = sapply(combinedSurvey$freqLinkedin, fixFreq)
combinedSurvey$freqPinterest = sapply(combinedSurvey$freqPinterest, fixFreq)

combinedSurvey$haveSmartphone = sapply(combinedSurvey$haveSmartphone, fixSmartphone)
#Vbreak it
combinedSurvey$educationLevel = sapply(combinedSurvey$educationLevel, fixEduc)
combinedSurvey$emplnw = sapply(combinedSurvey$emplnw, fixEmplnw)
combinedSurvey$income = sapply(combinedSurvey$income, fixIncome)
combinedSurvey$intAtHome = sapply(combinedSurvey$intAtHome, fixBasic)
combinedSurvey$marital = sapply(combinedSurvey$marital, fixMarital)
combinedSurvey$party = sapply(combinedSurvey$party, fixParty)
combinedSurvey$freqFacebook = sapply(combinedSurvey$freqFacebook, fixFreq)
combinedSurvey$freqInstagram = sapply(combinedSurvey$freqInstagram, fixFreq)
combinedSurvey$freqTwitter = sapply(combinedSurvey$freqTwitter, fixFreq)
combinedSurvey$demoOrRep = sapply(combinedSurvey$demoOrRep, fixDemOrRep)
combinedSurvey$useFacebook = sapply(combinedSurvey$useFacebook, fixBasic)
combinedSurvey$useTwitter = sapply(combinedSurvey$useTwitter, fixBasic)
combinedSurvey$useLinkedin = sapply(combinedSurvey$useLinkedin, fixBasic)
combinedSurvey$usePinterest = sapply(combinedSurvey$usePinterest, fixBasic)
combinedSurvey$useInstagram = sapply(combinedSurvey$useInstagram, fixBasic)
combinedSurvey$useSocialMedia = sapply(combinedSurvey$useSocialMedia, fixBasic)

combinedSurvey$haveSmartphone[which(combinedSurvey$haveSmartphone=="NULL")] = "no cell phone"
combinedSurvey$educationLevel[which(combinedSurvey$educationLevel=="NULL")] = NA
combinedSurvey$intAtHome[which(combinedSurvey$intAtHome=="NULL")] = NA
combinedSurvey$income[which(combinedSurvey$income=="NULL")] = NA

sum(is.na(combinedSurvey$educationLevel))

combinedSurvey = merge(combinedSurvey, updatedSurvey2018, all = TRUE)
