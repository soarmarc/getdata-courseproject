# Code Book for UCI HAR Data

### Description of Original Dataset
This dataset consists of accelerometer and gyroscope readings from the Samsung Galaxy S II smartphone collected during a series of experiments involving 30 volunteers performing 6 activities.

Full description of the dataset is here: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

Citation:
Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. A Public Domain Dataset for Human Activity Recognition Using Smartphones. 21th European Symposium on Artificial Neural Networks, Computational Intelligence and Machine Learning, ESANN 2013. Bruges, Belgium 24-26 April 2013.

### Description of Tidy Data Summary
As part of the Course Project for the Coursera Getting & Cleaning Data course, the original HAR dataset has been transformed into a summary table of tidy data as follows:

* There is one row for each combination of subject and activity:
  * 30 subjects x 6 activities  = 180 rows
* Each column contains one variable:
  * subject_index: identifier of individual participant in the original experiment (range: 1-30) [1 column]
  * activity_label: description of the activity [1 column]
  * activity_index: numerical identifier of the activity (range: 1-6) [1 column]
  * *measure*-mean() and *measure*-std(): the **average** of each variable for each subject and activity [66 columns]

### Measurements
The mean() and std() values of the following 33 measurements are included in the tidy dataset. Hence, there are 66 columns of measurement data. Measures with "-XYZ" are represented as 3 separate columns, one for each of the component measurements.

- tBodyAcc-XYZ (3)
- tGravityAcc-XYZ (3)
- tBodyAccJerk-XYZ (3)
- tBodyGyro-XYZ (3)
- tBodyGyroJerk-XYZ (3)
- tBodyAccMag (1)
- tGravityAccMag (1)
- tBodyAccJerkMag (1)
- tBodyGyroMag (1)
- tBodyGyroJerkMag (1)
- fBodyAcc-XYZ (3)
- fBodyAccJerk-XYZ (3)
- fBodyGyro-XYZ (3)
- fBodyAccMag (1)
- fBodyAccJerkMag (1)
- fBodyGyroMag (1)
- fBodyGyroJerkMag (1)

See original data source for full detail and definition of each measurement.
As in the original data, the values of the variables are normalized and bounded within [-1,1].

### Data Cleaning & Transformation
The tidy dataset is a subset and summary of the original HAR dataset, using the following process:

1. Merge HAR training and test datasets
2. Extract only the mean() and std() columns for each measure
3. Compute the average of each variable for each combination of subject and activity
4. Output a summary table containing the averages computed in #3
