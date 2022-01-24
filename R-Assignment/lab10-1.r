#lab10 Stats220
#Question1
imm2011 <- read.csv("immunisation-ethnicity-2011-6-months.csv", row.names = 1)

immunised <- imm2011[,seq(2,10,2)]#Reads immunised 
eligible <- imm2011[,seq(1,10,2)]#Reads eligible

immhb <- rowSums(immunised, na.rm = TRUE)
elidhb <- rowSums(eligible, na.rm = TRUE)

smalleli <- elidhb < 5000 #finds all eligible in dhb below 5000
largeeli <- elidhb > 5000 #finds all elegibile in dhb over 500

small <- sum(immhb[smalleli])/sum(elidhb[smalleli])#calculates the small values
large <- sum(immhb[largeeli])/sum(elidhb[largeeli])#calculates all the large values

small
large

#Question 2
years <- 2011:2018#set the years to read each file

for (i in years){#for loop lets me check every years file
  imm2011 <- read.csv(paste("immunisation-ethnicity-",i,"-6-months.csv", sep=""), row.names = 1)
  #follows same procedures as Q1
  immunised <- imm2011[,seq(2,10,2)]
  eligible <- imm2011[,seq(1,10,2)]
  
  immhb <- rowSums(immunised, na.rm = TRUE)
  elidhb <- rowSums(eligible, na.rm = TRUE)
  
  smalleli <- elidhb < 5000
  largeeli <- elidhb > 5000
  
  small <- sum(immhb[smalleli])/sum(elidhb[smalleli])
  large <- sum(immhb[largeeli])/sum(elidhb[largeeli])
  
  #rounded both the small and large values
  roundsmall = round(small,digits = 2)
  roundlarge = round(large, digits =2)
  
  #printing out the message 
  message <- paste(i,": small = ", roundsmall," : large = ", roundlarge,sep="","\n")
  cat(message)
  
}

#Question 3 
years <- 2011:2018 

for (i in years){ #reading each file based of years
  imm <- read.csv(paste("immunisation-ethnicity-",i,"-6-months.csv", sep=""), row.names = 1)
  
  count <- 0
  for (j in 1:20){ 
    NZE <- FALSE #set as false 
    if (imm$NZE.Immunised[j]/imm$NZE.Eligible[j] > 0.7){ #finding all values that are greater than 0.7
      NZE <- TRUE #once check sets to true
      
    }
    Maori <- FALSE
    if (imm$Maori.Immunised[j]/imm$Maori.Eligible[j] > 0.7){
      Maori <- TRUE
      
    }
    Pacific <- FALSE
    if(is.na(Pacific)){ #this checks for NA values in each file
      Pacific <- FALSE #then assigns it as false
      if (imm$Pacific.Immunised[j]/imm$Pacific.Eligible[j] > 0.7){
        Pacific <- TRUE
      }
    }
    Asian <- FALSE 
    if(is.na(Asian)){
      Asian <- FALSE
      if (imm$Asian.Immunised[j]/imm$Asian.Eligible[j] > 0.7){
        Asian <- TRUE
      }
    }
    Other <- FALSE
    if(is.na(Other)){
      Other <- FALSE
      if (imm$Other.Immunised[j]/imm$Other.Eligible[j] > 0.7){
        Other <- TRUE
      }
    }
    count = count + 1 #for each sequence i'm adding +1 to count to find all values that are over 0.7
  }
  message <- paste(i," :", count, " DHBs had high immunisation rates for all ethnicities", sep="", "\n")
  cat(message)
}