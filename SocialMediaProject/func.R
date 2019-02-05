#different uses answer same questions different ways, how to combine different years
#with same questions different answers.

#fixes the sex column
fixSex = function(x){
  switch(x, "male", "female")
}

#fixes marital status column
fixMarital = function(x){
  switch(x,"married","living with a partner","divorced","separated","widowed",
         "never been married",7,"dont know", "refused")
}

#fixes all responses that are (yes, no, don't know, and refused)
fixBasic = function(x){
  switch(x,"yes","no",3,4,5,6,7,"dont know","refused")
}

#fixes education column
fixEduc = function(x){
  switch(x,"less than high school", "high school incomplete", "high school graduate",
         "some college", "associate", "bachelors degree", "some post grad",
         "postgraduate degree", "dont know", "refused")
}

##May cause extra "not employed" compared to "retired" due to 2014 not having other these options
#fixes employment information column
fixEmployed = function(x){
  switch(x,"fulltime","parttime","retired","not employed", "selfemployed",
         "disabled", "student", "other", "refused")
}

#differences in race answers use two functions 2013 for 2013
fixRace2013 = function(x){
  switch(x,"white", "black", "asian", "mixed race", "native american", "other",7,
         "dont know", "refused")
}

#fixRace for 2016 and 2018 columns
fixRace = function(x){
  switch(x,"white", "black", "asian", "other", "native american", "pacific islander",
         "hispanic", "dont know", "refused")
}

#fixes income column
fixIncome = function(x){
  switch(x,"(0, 10000]", "(10000, 20000]", "(20000, 30000]", "(30000, 40000]",
         "(40000, 50000]", "(50000, 75000]", "(75000, 100000]", "(100000, 150000]",
         "150000+", "dont know", "refused")
}

#fixes the frequency of the different social media usage column
fixFreq = function(x){
  switch(x,"several times a day", "about once a day", "a few times a week",
         "every few weeks", "less often", 6, 7, "dont know", "refused")
}

#fixes the frequency of internet usage column
fixIntFreq = function(x){
  switch(x,"almost constantly", "several times a day","about once a day", "several times a week",
         "less often", 6, 7, "dont know", "refused")
}

#fixes the party information column
fixParty = function(x){
    switch(x,"republican", "democrat", "independent", "no preference", "other party",
         6,7, "dont know", "refused")
}

#fixes the democrat or republican leaning column
fixDemOrRep = function(x){
  switch(x, "republican", "democrat",3,4,5,6,7,"dont know", "refused")
}

#fixes the opinion on the internet column
fixIntOpin = function(x){
  switch(x, "good thing", "bad thing", "some of both", 4,5,6,7, "dont know", "refused")
}