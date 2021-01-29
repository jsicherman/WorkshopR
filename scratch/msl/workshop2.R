#install.packages("dplyr")
#install.packages("vroom")
#install.packages("readxl")
#install.packages('devtools')

library('dplyr')
library(vroom)
library(readxl)
library(Rphenopgraph)

covid_data <- vroom('data/covid-19-polls-master/covid_approval_polls_adjusted.csv')

head(covid_data)
glimpse(covid_data)
colnames(covid_data)
dim(covid_data)

ihiw_data <- vroom('https://github.com/rivas-lab/covid19/raw/158f8c42387a6368dcb236d0f0d5c87561193966/HLA/17ihiw-Family-FQ.tsv',
                   col_names = c('locus', 'allele', 'ethnicity', 'frequency', 'allele_count', 'family_count', 'sample_count'))

excel_sheets('data/internet-users.xlsx')
internet_data <- read_excel('data/internet-users.xlsx')

########

covid_data <- mutate(covid_data,
                     other = 100 - (approve + disapprove))

group_by(covid_data, party)

pollster_statistics <- group_by(covid_data, pollster)

mean_statistics <- summarize(pollster_statistics,
                             mean_approve_adjusted = mean(approve_adjusted),
                             mean_disapprove_adjusted = mean(disapprove_adjusted))
mean_statistics2 <- summarize(covid_data,
                              mean_approve_adjusted = mean(approve_adjusted, na.rm = TRUE),
                              mean_disapprove_adjusted = mean(disapprove_adjusted, na.rm = TRUE))

covid_data <- filter(covid_data, party == 'D' | party == 'R' | party == 'I')