my_name <-      "Jordan Sicherman"
my_languages <- c("English", "R")

my_n_languages <- 2

print(paste("Your first language is", my_languages[1]))

is_multilingual <-        my_n_languages < 1

TRUE
FALSE

if (is_multilingual) {
  print("You are multilingual!")
}

student_data[, "age"]

observations <- rnorm(10, mean = 100, sd = 5)

student_data <- data.frame(name = c("Jordan Sicherman", "John Doe", "Jane Doe"),
                           age = c(23, 31, 40),
                           favorite_language = c("R", "Python", "C++"),
                           knows_R = c(TRUE, FALSE, NA))

knitr::kable(student_data)

# Get the number of rows of our student_data
n_students <- nrow(student_data)
n_prop <- ncol(student_data)

print(paste(student_data$name[1], 'knows_R is', student_data$knows_R[1]))

# Calculate the mean age of all the students
age_mean <- mean(student_data$age)