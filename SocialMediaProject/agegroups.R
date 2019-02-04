##issue is that an answer of 98 is dont know
##and an answer for 99 is refused
##this can skew data as it has not been dealt with
#groups the ages in factors
ageGroupMaker <- function(x) {
  if (x < 25)
    y = "18-24"
  else if (x < 35)
    y = "25-34"
  else if (x < 45)
    y = "35-44"
  else if (x < 55)
    y = "45-54"
  else if (x < 65)
    y = "55-64"
  else if (x < 75)
    y = "65-74"
  else if (x < 98)
    y = "75+"
  else if (x == 98)
    y = "don't know"
  else
    y = "refused"
}