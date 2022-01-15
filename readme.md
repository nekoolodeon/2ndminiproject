Getting and Cleaning Mini Project 2
Samsung Galaxy-S Accelerometers Data -- README

The data set is about Human Activity Recognition Using Smartphones. The data includes were collected from the accelerometers from the
Samsung Galaxy S smartphone. The full description of the dataset is from
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones.

To use the raw data:
• Save the .zip file to your computer.
• Unzip the contents of the file into a new folder in your working directory named UCI HAR Dataset.

The script includes the following:

• One data set merged from the training and the test sets

features_data <- features.txt
This includes data from the accelerometer and gyroscope 3-axial raw signals from the text

activities_data <- activity_labels.txt
List of activities with their corresponding measurements and activity labels 

subject_test <- test/subject_test.txt 
Contains test data of the subjects under observation

xTest <- test/X_test.txt
Contains recorded features test data

yTest <- test/y_test.txt
Contains test data of activities’code labels

subject_train <- test/subject_train.txt 
Contains train data of subjects under observation

xTrain <- test/X_train.txt 
Contains recorded features train data

yTrain <- test/y_train.txt 
Contains train data of activities’code labels

merged_data - merges the data by using rbind and cbind functions to create one data set

• Measurements on the mean and standard deviation for each measurement

Only columns with mean or STD are extracted

• Descriptive activity names to name the activities in the dataset

Entire numbers from the second column of the activities dataset are given descriptive labels 
with their corresponding activity taken 

• Labels for the data set with descriptive variable names

gsub function is used to appropriately replace and label the data set with descriptive variable names

• A second, independent tidy data set with the average of each variable for each activity and each subject.

tidyData is created by splitting the data into subsets, computes summary statistics for each, taking the means of each variable for each activity
and each subject

Then, tidyData is exported into Tidy Data Set.txt file.



