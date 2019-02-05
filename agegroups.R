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