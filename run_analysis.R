if (!exists("Data")) {
    dir.create("Data")
    setwd("./Data")
}

if (!file.exists("courseproject.zip")){
  download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip", "courseproject.zip")
}
unzip("courseproject.zip")
setwd("./UCI HAR Dataset/")

#Getting features
features  <- read.table("features.txt")

#Getting activity labels
activity_labels <- read.table("activity_labels.txt")



extractFunc <- function(x) {
 if (!is.na((grep("mean()", x, fixed=TRUE) || grep("std()", x, fixed=TRUE) ))) {
   x <- 1
 } else {
   x <- 0
 }
 x  
}

#Indicator variable indicating if measure is mean or standard deviation
features$V3 <- sapply(features$V2, function(x) extractFunc(x))
indVariable <- as.numeric(features$V1) * as.numeric(features$V3)
indVariable <- indVariable[indVariable>0]


#Getting training subjects
subject_train <-  read.table("train/subject_train.txt")

#Getting training activity identifiers
activity_train <- read.table("train/y_train.txt")

#Getting features training set
features_train <- read.table("train/X_train.txt")


#Getting testing subjects
subject_test <-  read.table("test/subject_test.txt")

#Getting training activity identifiers
activity_test <- read.table("test/y_test.txt")

#Getting features training set
features_test <- read.table("test/X_test.txt")



total_data <- rbind(cbind(activity_train, subject_train, features_train[,indVariable] ),
                    cbind(activity_test,subject_test, features_test[,indVariable] )
                    )
names(total_data) <- c("activity", "subject", as.character(features$V2[indVariable]))
total_data$activity <- factor(total_data$activity, levels = activity_labels$V1, labels = activity_labels$V2)

tidy_data <- aggregate(.~ activity + subject, data=total_data, mean)
write.table(tidy_data, "tidy_data.txt", row.names=FALSE)


test <- read.table("tidy_data.txt", header=TRUE)






