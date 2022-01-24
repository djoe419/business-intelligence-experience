#Assignment 3, djoe419, 849913222

#Question 1
bus1 <- read.csv("2017-03-09-22-04.csv") #assinging all values of the file to bus1
dim(bus1)#reads the file

#Question 2
bus1 <- read.csv("2017-03-09-22-04.csv")
aheadMax <- min(bus1$delay, na.rm = TRUE)#checks for the smallest delay value
behindMax <- max(bus1$delay, na.rm = TRUE)#checks for the largest delay value
aheadMax <- aheadMax/60 #want standard time to divide by 60
behindMax <- behindMax/60 #want standard time to divide by 60
aheadMax
behindMax

#Question 3
filenames <- list.files(pattern =".csv")#checks for all files with .csv in their name
head(filenames)
length(filenames)

#Question 4 
filenames <- list.files(pattern =".csv")#checks for all files with .csv in their name
maximum <- Inf
for (i in filenames){
  aucklandTransport <- read.csv(i)#Reads all the files
  aheadMax <- min(aucklandTransport$delay, na.rm = TRUE)/60 #checks for the delay in all files then divides by an hour
  behindMax <- max(aucklandTransport$delay, na.rm = TRUE)/60 #checks for the delay in all files then divides by an hour
  if(aheadMax < maximum){
    maximum <- aheadMax #assign the values
  }
  aheadMax <- maximum #assign the values
}
aheadMax
behindMax

#Question 5 reads every values in delay and if it's divisble by 60 returns true of false
bus1 <- read.csv("2017-03-09-22-04.csv")

for (i in bus1){
  multipleDelay <- bus1$delay %% 60 ==0#checks here if %% 60 is true or false
}
multipleDelay

#Question 6
bus1 <- read.csv("2017-03-09-22-04.csv") #reads the file and assigns to bus1
multiple <- bus1$delay %% 60 != 0 #checks delays in bus1 then finds values not divisble by 60
nonmulti <- !multiple

behind <- bus1$delay/60 #divides by an hour
behindMaxNotMult <- behind[multiple] #performs equations to the given values of mulitple
min(behindMaxNotMult, na.rm = TRUE)#prints min value
max(behindMaxNotMult, na.rm = TRUE)#prints max value

#Question 7 same as question 6 but wants to read all files
filenames <- list.files(pattern =".csv")

amaxNotMult <- Inf
bmaxNotMult <- -Inf
for (i in filenames){ #changed to read all from Q6 instead of 1
  aucklandTransport <- read.csv(i)#follows same procedures
  multiple <- aucklandTransport$delay %% 60 != 0
  
  behind <- aucklandTransport$delay/60
  behindMaxNotMult <- behind[multiple]

  amax <- min(behindMaxNotMult, na.rm = TRUE)
  bmax <- max(behindMaxNotMult, na.rm = TRUE)
  #these if check every value then replaces it with the correct value
  if (amax < amaxNotMult){
    amaxNotMult <- amax
  }
  if (bmaxNotMult > bmax){
    bmax <- bmaxNotMult
  }
  bmaxNotMult <- bmax
}
amaxNotMult
bmaxNotMult

#Question 8 Had to change format a bit from Q7 to get this to work
filenames <- list.files(pattern =".csv")

amaxStop1 <- Inf
bmaxStop1 <- -Inf
for (i in filenames){
  aucklandTransport <- read.csv(i) #reads all file values
  delay <- aucklandTransport$delay %% 60 !=0 #checks for all non %% 60 values
  nomultidelay <- aucklandTransport[delay,] #performs delay function
  seq <- nomultidelay$stop.sequence == 1 #finding all seq of 1
  firstStop <- nomultidelay[seq,] 
  newamaxStop1 <- min(firstStop$delay)/60 #divides by the hour
  newbmaxStop1 <- max(firstStop$delay)/60
  if (newamaxStop1 < amaxStop1){ #assigns new values like previous if in Q7
    amaxStop1 <- newamaxStop1
  }
  if (newbmaxStop1 > bmaxStop1)
    bmaxStop1 <- newbmaxStop1
}
amaxStop1
bmaxStop1
