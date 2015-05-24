# Getting &amp; Cleaning Data Course Project README
Submission for Course Project in Coursera Getting &amp; Cleaning Data course

### Contents:
* run_analysis.R
* CodeBook.md
* README.md

### Description of Script (run_analysis.R)
This repo contains the script 'run_analysis.R' that does the following:

* Merges the training and the test UCI HAR Datasets provided to create one data set.
  * Combines the columns in X_test.txt, y_test.txt, & subject_test.txt tables
  * Combines the columns in X_train.txt, y_train.txt, & subject_train.txt tables
  * Combines the train and test tables into a single table
* Extracts only the measurements on the mean and standard deviation for each measurement.
  * Subsets measurement columns containing "mean()" or "std()"
* Labels each record with the corresponding descriptive activity name from activity_labels.txt
* Labels each variable column with descriptive names from features.txt
* Creates a summary table with the average of each variable for each activity and subject combination
* Writes summary table to tidyData_avgByActivityAndSubject.txt"

See CodeBook.md for details about the summary table (tidy data) output.

### Prerequisites:
* UCI HAR Dataset folder must be in working directory before running script
