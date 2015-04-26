## The source for data in this project is:
## https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
## File was unzipped to working directory to the folder named "UCI HAR Dataset"

## We should create one R script called run_analysis.R that does the following:
## 1. Merges the training and the test sets to create one data set.
## 2. Extracts only the measurements on the mean and standard deviation for each measurement.
## 3. Uses descriptive activity names to name the activities in the data set
## 4. Appropriately labels the data set with descriptive activity names.
## 5. Creates a second, independent tidy data set with the average of each variable for each activity and each subject.

## Part 1: Merges the training and the test sets to create one data set
## merge test and train data for X
X <- rbind(read.table("./UCI HAR Dataset/test/X_test.txt"), read.table("./UCI HAR Dataset/train/X_train.txt"))

## merge test and train for Y
Y <- rbind(read.table("./UCI HAR Dataset/test/y_test.txt"), read.table("./UCI HAR Dataset/train/y_train.txt"))

## merge test and train for subjects
subjects <- rbind(read.table("./UCI HAR Dataset/test/subject_test.txt"), read.table("./UCI HAR Dataset/train/subject_train.txt"))

## Part 2: Extracts only the measurements on the mean and standard deviation for each measurement
## We extract measurements only with "mean()" and "std()" in the names. Not like "meanFreq()" etc.
features <- read.table("./UCI HAR Dataset/features.txt")
mean_std <- grep("-mean\\(\\)|-std\\(\\)",tolower(features[,2]))
X <- X[,mean_std]

## Part 3
## We use descriptive activity names to name the activities in the data set
activity <- read.table("./UCI HAR Dataset/activity_labels.txt")
activity[,2] = tolower(as.character(activity[, 2]))
Y[,1] = activity[Y[,1],2]

## Part 4
## Appropriately labels the data set with descriptive variable names
feature_names <- gsub("\\(|\\)","",features[mean_std,2])
feature_names <- tolower(feature_names)#we clean names from brackets and make to lower case

names(X) <- feature_names
names(Y) <- "activity"
names(subjects) <- "subject"

#merge X, Y and subjects
data_set <- cbind(subjects,Y,X)

## Part 5: From the data set in step 4, creates a second, independent tidy data set with the average
## of each variable for each activity and each subject.
tidy_data_set <- aggregate(data_set[,3:68], by=list(activity = data_set$activity, subject = data_set$subject), FUN=mean)

write.table(tidy_data_set, "tidy_data_set.txt",row.names=FALSE)
