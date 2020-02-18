
## loading the dataset ----
# file <- file.choose()
# firstnames <- read.csv(file)

firstnames <- read.csv("data/24037-etatcivil-prenoms-2018.csv", encoding = "UTF-8")

head(firstnames)

## poking around the data set ----

# names()

names(firstnames)
names(firstnames)[1]
names(firstnames)[1] <- "city_name"
names(firstnames)

firstnames <- read.csv("data/24037-etatcivil-prenoms-2018.csv")

names(firstnames) <- c("city_name","insee_code",
                       "child_gender","child_1stname",
                       "occurrences","year")

names(firstnames)

# head()

head(firstnames)

head(firstnames, n = 10)

# summary()

summary(firstnames)

# sum()

firstnames$occurrences
sum(firstnames$occurrences)
sum(firstnames[,5])

# mean(), max(), etc.
mean(firstnames$occurrences)

max(firstnames$occurrences)

median(firstnames$occurrences)

# distribution

firstnames$child_gender

table(firstnames$child_gender)

hist(firstnames$occurrences)

firstnames[4,]

## tidyverse -----

firstnames <- read.csv("data/24037-etatcivil-prenoms-2018.csv")

names(firstnames) <- c("city_name","insee_code","child_gender","child_1stname","occurrences","year")

library(tidyverse)

## tests

firstnames$child_gender == "masculin"

filter(firstnames, child_gender == "Masculin")

filter(firstnames, child_gender == "Masculin" & occurrences > 3)


select(firstnames, child_1stname, occurrences)

var1 <- c("child_1stname","occurrences")

select(firstnames, var1)

filter(firstnames, child_gender == "Féminin") %>%
  select(var1)


firstnames <- read.csv("data/24037-etatcivil-prenoms-2018.csv",
                       encoding = "UTF-8") %>% 
  setNames(c("city_name","insee_code","child_gender","child_1stname",
              "occurrences","year"))

head(firstnames)


## RNE - maires -----

getwd()

file <- file.choose()

maires <- read_delim(file, delim = "\t", skip = 1,
                     locale = locale(encoding = "Latin1"))

maires$`Libellé de la profession`

names(maires) <- c("code_dep", "lib_dep", "city_code", "city_name",
                   "lastname","firstname","gender","birthdate",
                   "occ_code","occ_name",
                   "date_beg_mandate","date_beg_function")

names(maires)

# let's plot genders
maires %>% ggplot() + geom_bar(aes(x = gender, fill = gender))
