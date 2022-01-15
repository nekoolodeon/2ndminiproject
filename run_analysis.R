## Part 1

filename <- "UCI HAR Dataset.zip"
unzip(filename) 
library(dplyr)

xTrain <- read.table("./UCI HAR Dataset/train/X_train.txt")
xTest <- read.table("./UCI HAR Dataset/test/X_test.txt")
yTrain <- read.table("./UCI HAR Dataset/train/y_train.txt")
yTest <- read.table("./UCI HAR Dataset/test/y_test.txt")
subject_train <- read.table("./UCI HAR Dataset/train/subject_train.txt")
subject_test <- read.table("./UCI HAR Dataset/test/subject_test.txt")
features_data <- read.table("./UCI HAR Dataset/features.txt")
activities_data <- read.table("./UCI HAR Dataset/activity_labels.txt")

## Merges the training and the test sets to create one data set.
subject <- rbind(subject_train, subject_test)
features <- rbind(xTrain, xTest)
activity <- rbind(yTrain, yTest)

colnames(activity) <- "Activity"
colnames(subject) <- "Subject"
colnames(features) <- t(features_data[2])
merged_data <- cbind (features,activity,subject)


## Extracts only the measurements on the mean and standard deviation for each measurement

mean_std <- grep(pattern="Mean|Std", names(merged_data), ignore.case=TRUE)
cols <- c(mean_std, 562, 563)
dataSet <- merged_data[,cols]

## Uses descriptive activity names to name the activities in the dataset

dataSet$Activity <- as.character(dataSet$Activity)
for (i in 1:6){
  dataSet$Activity[dataSet$Activity == i] <- as.character(activities_data[i,2])
}

dataSet$Activity <- as.factor(dataSet$Activity)

## Appropriately labels the data set with descriptive variable names

names(dataSet)<-gsub("Acc", "Accelerometer", names(dataSet))
names(dataSet)<-gsub("Gyro", "Gyroscope", names(dataSet))
names(dataSet)<-gsub("tBody", "TimeBody", names(dataSet))
names(dataSet)<-gsub("Mag", "Magnitude", names(dataSet))
names(dataSet)<-gsub("^t", "Time", names(dataSet))
names(dataSet)<-gsub("^f", "Frequency", names(dataSet))
names(dataSet)<-gsub("BodyBody", "Body", names(dataSet))
names(dataSet)<-gsub("gravity", "Gravity", names(dataSet))
names(dataSet)<-gsub("-mean()", "Mean", names(dataSet), ignore.case = TRUE)
names(dataSet)<-gsub("-std()", "STD", names(dataSet), ignore.case = TRUE)
names(dataSet)<-gsub("-freq()", "Frequency", names(dataSet), ignore.case = TRUE)
names(dataSet)<-gsub("angle", "Angle", names(dataSet))


## From the data set in step 4, create a second, independent tidy data set with 
## the average of each variable for each activity and each subject.


dataSet$Subject <- as.factor(dataSet$Subject)
dataSet <- data.table(Data)

tidyData <- aggregate(. ~Subject + Activity, dataSet, mean)
tidyData <- tidyData[order(tidyData$Subject,tidyData$Activity),]
write.table(tidyData, file = "Tidy Data Set.txt", row.names = FALSE)
str(tidyData)
