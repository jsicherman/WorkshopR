library(dplyr)

rm(t, tmp)

gradebook <- c(86.5, 91.0, 70.3, 0.0, 100.0)

grade_mean <- mean(gradebook)
# Or, as a pipe...
grade_mean <- gradebook %>%
  mean() %>%
  `*`(2)

covid_data <- vroom::vroom('data/covid-19-polls-master/covid_approval_polls_adjusted.csv')
covid_data <- mutate(covid_data,
                     modeldate = as.Date(modeldate, format = '%m/%d/%Y'),
                     startdate = as.Date(startdate, format = '%m/%d/%Y'),
                     enddate = as.Date(enddate, format = '%m/%d/%Y'))







covid_data_feb <- filter(covid_data, months(startdate) == 'February')

covid_data_feb_clean <- mutate(covid_data_feb,
                               largesamplesize = samplesize > 500,
                               party = recode(party,
                                              D = 'Democrats',
                                              I = 'Independents',
                                              R = 'Republicans'))



covid_data_feb_clean_final <- summarise(group_by(covid_data_feb_clean, pollster, party),
                                        sufficiently_large = sum(largesamplesize) > n() / 3)




covid_data_feb_clean_final <- covid_data %>%
  # Keep only months starting in Feb
  filter(months(startdate) == 'February') %>% # Keep only months starting in Feb
  mutate(largesamplesize = samplesize > 500,
         party = recode(party,
                        D = 'Democrats',
                        I = 'Independents',
                        R = 'Republicans')) %>%
  # Maybe you
  # want a bunch
  # of comments here
  # to make sure you know
  # what is happening
  group_by(pollster, party) %>%
  summarise(sufficiently_large = sum(largesamplesize) > n() / 3)



room_of_students <- data.frame(name = c('Jordan', 'Francois', 'Natalya', 'Fernando'),
                               first_language = c('English', 'French', 'Russian', 'Spanish'),
                               greeting = NA)
room_of_students

room_of_students %>%
  mutate(greeting = c('Hello', 'Bonjour', 'Privet', 'Hola'))

room_of_students %>%
  mutate(greeting = if_else(first_language == 'English', 'Hello',
                            if_else(first_language == 'French', 'Bonjour', '?')))

room_of_students %>%
  mutate(greeting = case_when(
    # 
    first_language == 'English' ~ 'Hi!',
    first_language == 'French' ~ 'Bonjour!',
    first_language == 'Russian' ~ 'Privet!',
    first_language == 'Spanish' ~ 'Hola!',
    
    TRUE ~ '?'
  ))


glimpse(starwars)
c('orange', 'brown', 'Ewok') %in% starwars$eye_color


film_characters <- starwars %>%
  filter(c('Human', 'Droid') %in% species)

film_characters <- starwars %>%
  filter(c('Human', 'Droid') %in% species,
         height >= if_else(species == 'Human', 190, 90)) %>%
  mutate(height = height / 100) %>%
  select(name, species, height)


authors <- data.frame(
  surname = I(c("Tukey", "Venables", "Tierney", "Ripley", "McNeil")),
  nationality = c("US", "Australia", "US", "UK", "Australia"),
  deceased = c("yes", rep("no", 4)))

authorN <- within(authors, { name <- surname; rm(surname) })

books <- data.frame(
  name = I(c("Tukey", "Venables", "Tierney",
             "Ripley", "Ripley", "McNeil", "R Core")),
  title = c("Exploratory Data Analysis",
            "Modern Applied Statistics ...",
            "LISP-STAT",
            "Spatial Statistics", "Stochastic Simulation",
            "Interactive Data Analysis",
            "An Introduction to R"),
  other.author = c(NA, "Ripley", NA, NA, NA, NA,
                   "Venables & Smith"))

merge(authors, books, by.x = 'surname', by.y = 'name')
merge(books, authorN, by = c('name', 'last name'))