# CodeBook

This CodeBook describes the variables, the data, and any transformations or work that was performed in run_analysis.R to clean up the data.

# Input Data
The source for data in this project is:
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

File was unzipped to working directory to the folder named "UCI HAR Dataset"
In this project was used the following files:
- UCI HAR Dataset/test/X_test.txt (file with test data for X)
- UCI HAR Dataset/train/X_train.txt (file with train data for X)
- UCI HAR Dataset/test/y_test.txt (file with test data for Y)
- UCI HAR Dataset/train/y_train.txt (file with train data for Y)
- UCI HAR Dataset/test/subject_test.txt (file with test data for subjects)
- UCI HAR Dataset/train/subject_train.txt (file with train data for subjects)
- UCI HAR Dataset/features.txt (file with features)
- UCI HAR Dataset/activity_labels.txt (file with activities)
 
# Transformations and works
## Merges the training and the test sets to create one data set
For merging all data in one data set we do following steps.

1. Merge test and train data for X by reading csv files X_test.txt and X_train.txt.
2. Merge test and train for Y by reading csv files y_test.txt and y_train.txt.
3. Merge test and train for subjects by reading csv files subject_test.txt and subject_train.txt.

So at the end we have 3 data sets: X, Y and subjects. 

## Extracts only the measurements on the mean and standard deviation for each measurement
We extract measurements only with "mean()" and "std()" in the names. Not like "meanFreq()" etc. To do this, we use the grep-function.
At the end we have data set X with -mean- and -std- data. 

## Using descriptive activity names
We use descriptive activity names from file activity_labels.txt to name the activities in the data set. We use low-case names. At the end we have data set Y with activity names.

## Data set with descriptive variable names
We cleaning feature names from brackets and make names to low-case. At the end we have data sets X, Y and subjects with named variables.
After that we merge subjects, X and Y in one data set.

## Tidy data
From the data set from previous part we create a second, independent tidy data set with the average of each variable for each activity and each subject. We use aggregate-function to do it.

# Tidy data set
Tidy data set has 180 observations (30 subjects and 6 activities) of 68 variables. The file of tidy data set (tidy_data_set.txt) is a space-delimited value file. The header line contains the names of the variables.
