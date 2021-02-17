if_else(CONDITION, CASE_WHEN_TRUE, CASE_WHEN_FALSE)


test <- sample(1:3, 1)

if(test == 1) {
  
  print('Hello')
  
  
  if(...) {
    
  }
  
  
  
} else if(test == 2) {
  
} else if(test == 3) {
  
} else {
  
  a <- 2
  b <- 5
  print('Hello 2')
  
  
}








for(i in 1:5) {
  
  print(i)
}

i <- 1
print(i)

i <- 2
print(i)

i <- 3
print(i)

i <- 4
print(i)

i <- 5
print(i)


for(i in 1) { # You can loop over a single element
  print(paste('At', i))
}

for(i in c(1, -1, 5, 3)) { # Elements don't have to be continuous or ordered
  print(i)
}

for(i in c('E', 'Jordan', '123')) { # Elements don't have to be continuous or ordered
  print(i)
}

for(j in data.frame(A = 1:3, B = 4:6)) {
  print(j)
}

df <- data.frame(A = 1:3, B = 4:6)
for(rowN in 1:nrow(df)) {
  print(df[rowN, ])
}



mData <- datasets::DNase

for(i in 1:nrow(mData)) {
  print(paste(mData$Run[i], mData$conc[i], mData$density[i]))
}


lastRun <- 0
for(i in 1:nrow(mData)) {
  if(lastRun == mData$Run[i]) {
    
  } else {
    print(mData$Run[i])
    print(mData$conc[i])
    print(mData$density[i])
    lastRun <- mData$Run[i]
  }
}

# lapply() or apply() can replace for loops

ans <- 0
for(x in 1:5) {
  ans <- ans + x
}
rm(x)

sum(1:5)


while(TRUE) {
  print('A')
}

something <- 5
while(something > 0) {
  print('Looping!')
  something <- something - 1
}
rm(something)


total_height <- 0
trees[sample(1:31, 31), ]

while(total_height < 600) {
  # Randomly select a tree and
  # add its height to the total
  
  #trees[sample(1:31, 1), 'Height']
  
  # Select a tree at random
  tree <- sample(1:31, 1)
  print(paste('Picked', tree))
  
  # Extract its height
  height <- trees$Height[tree]
  
  # Increment our total height
  total_height <- total_height + height
}

rm(tree, height)


for(variable in range) {
  
}

lapply(range, function(variable) {
  
})

helperVarianble <- ...
for(i in 1:5) {
  print(i)
}

lapply(1:5, function(i) {
  print(i)
}) -> lapplyResults

install.packages('parallel')
library(parallel)

mclapply(1:5, function(i) {
  
  print(i)
}) -> lapplyResults