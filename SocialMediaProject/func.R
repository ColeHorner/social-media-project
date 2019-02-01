#R version 3.3.2

#bug with spaces not sure how to fix using as switch statement
#different uses answer same questions different ways, how to combine different years
#with same questions different answers.
#some answers use 98 and 99 which under current code needs to be changed to the last
#number in the question order ex. 98 to 9 99 to 10 or etc.

fixSex = function(x){
  switch(x, "male", "female")
}

fixMarital = function(x){
  switch(x,"married","living with a partner","divorced","separated","widowed",
         "never been married",7,"dont know", "refused")
}

#fixes all responses that are (yes, no, don't know, and refused)
fixBasic = function(x){
  switch(x,"yes","no",3,4,5,6,7,"dont know","refused")
}

#blanks need to say "no"
fixSmartphone = function(x){
  switch(x,"smartphone","non smart phone",3,4,5,6,7,"dont know","refused")
}

#xxx2013 is only 6 and up. 2016 and 2018 are 8 and up due to the 2013 being lower must
fixHH = function(x){
  switch(x,1,2,3,4,5,"6 or greater","6 or greater", "6 or greater", "refused")
}

fixEduc = function(x){
  switch(x,"less than high school", "high school incomplete", "high school graduate",
         "some college", "associate", "bachelors degree", "some post grad",
         "postgraduate degree", "dont know", "refused")
}

##xxxxx2014 needs to be changed 3s to 4s, 2016 and 2018 beed to be changed to refused
##May cause extra "not employed" compared to "retired" due to 2014 not having other options
fixEmplnw = function(x){
  switch(x,"fulltime","parttime","retired","not employed", "selfemployed",
         "disabled", "student", "other", "refused")
}

##differences in race answers use two functions 2013 for 2013
fixRace2013 = function(x){
  switch(x,"white", "black", "asian", "mixed race", "native american", "other",7,
         "dont know", "refused")
}

##fixRace for 2016 and 2018
fixRace = function(x){
  switch(x,"white", "black", "asian", "other", "native american", "pacific islander",
         "hispanic", "dont know", "refused")
}

fixIncome = function(x){
  switch(x,"(0, 10000]", "(10000, 20000]", "(20000, 30000]", "(30000, 40000]",
         "(40000, 50000]", "(50000, 75000]", "(75000, 100000]", "(100000, 150000]",
         "150000+", "dont know", "refused")
}

##xxxchange 1-2 3-5 to a few times a week in 2013 answer 4 to 3, 5 to 4, 6 to 5
fixFreq = function(x){
  switch(x,"several times a day", "about once a day", "a few times a week",
         "every few weeks", "less often", 6, 7, "dont know", "refused")
}


fixParty = function(x){
  switch(x,"republican", "democrat", "independent", "no preference", "other party",
         6,7, "dont know", "refused")
}

fixDemOrRep = function(x){
  switch(x, "republican", "democrat",3,4,5,6,7,"dont know", "refused")
}

