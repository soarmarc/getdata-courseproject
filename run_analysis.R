## R Script for Course Project in Getting & Cleaning Data course on Coursera
## See README.md and CodeBook.md files for details

## Read in test data
X_test <- read.table('UCI HAR Dataset/test/X_test.txt',header=FALSE)
y_test <- read.table('UCI HAR Dataset/test/y_test.txt',header=FALSE,col.names=c("activity_index"))
subject_test <- read.table('UCI HAR Dataset/test/subject_test.txt',header=FALSE,col.names=c("subject"))

## Read in training data
X_train <- read.table('UCI HAR Dataset/train/X_train.txt',header=FALSE)
y_train <- read.table('UCI HAR Dataset/train/y_train.txt',header=FALSE,col.names=c("activity_index"))
subject_train <- read.table('UCI HAR Dataset/train/subject_train.txt',header=FALSE,col.names=c("subject"))

## Read in variable names
features <- read.table('UCI HAR Dataset/features.txt',header=FALSE)

## Read in activity labels
activity_labels <- read.table('UCI HAR Dataset/activity_labels.txt',header=FALSE)

## Label columns in test and train data tables with variable names
feature_labels <- as.vector(features$V2)
colnames(X_test) <- feature_labels
colnames(X_train) <- feature_labels

## Combine test data columns
testData <- cbind(X_test,y_test,subject_test)

## Combine train data columns
trainData <- cbind(X_train,y_train,subject_train)

## Combine test and train data rows
allData <- rbind(testData,trainData)

## Extract variable columns containing mean() or std()
## Also keep activity and subject index columns
extract_cols <- grep("-(mean|std)\\(\\)",names(allData),perl=TRUE)
allData_extract <- allData[,c(extract_cols,562:563)]

## Label activity label data
colnames(activity_labels) <- c("activity_index","activity_label")
## Join activity labels to data table
finalData <- merge(allData_extract,activity_labels)

## Generate a summary table of mean values for each variable
## subset by subject and activity
library(plyr)
summary <- ddply(finalData, .(subject, activity_label),numcolwise(mean))

## Output summary table to a text file
write.table(summary, file="tidyData_avgByActivityAndSubject.txt", row.names=FALSE)
