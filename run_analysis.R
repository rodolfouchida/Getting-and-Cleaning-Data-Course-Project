library()

## Preparing the data for the analysis

## Reading the data

features <- read.table("~/UCI HAR Dataset/features.txt")
activity <- read.table("~/UCI HAR Dataset/activity_labels.txt")
subjectTrain <- read.table("~/UCI HAR Dataset/train/subject_train.txt")
subjectTest <- read.table("~/UCI HAR Dataset/test/subject_test.txt")
xTrain <-  read.table("~/UCI HAR Dataset/train/x_train.txt")
yTrain <-  read.table("~/UCI HAR Dataset/train/y_train.txt")
xTest <-  read.table("~/UCI HAR Dataset/test/x_test.txt")
yTest <-  read.table("~/UCI HAR Dataset/test/y_test.txt")

## Assigin the column names to the data

colnames(xTrain) <- features[,2]
colnames(xTest) <- features[,2]
colnames(subjectTrain) <- "SubjectId"
colnames(subjectTest) <- "SubjectId"
colnames(yTrain) <- "ActivityId"
colnames(yTest) <- "ActivityId"
colnames(activity) <- c("ActivityId", "Activity")


## Combining the labels with the subjects to form the final train and test datasets

train <- cbind(subjectTrain, yTrain, xTrain)
test  <- cbind(subjectTest, yTest, xTest)


## 1. Merges the training and the test sets to create one data set

data <- rbind(train, test)

## 2. Extracts only the measurements on the mean and standard deviation for each measurement 

x <- grep("mean\\(\\)|std\\(\\)",names(data)) ## search which columns match with mean and std
data2 <-  cbind(data[,1], data[,2], data[,x])
colnames(data2)[1:2] <- c("SubjectId","ActivityId")   


## 3. Uses descriptive activity names to name the activities in the data set

data2<- merge(activity, data2 , by="ActivityId", all.x=TRUE)

## 4. Appropriately labels the data set with descriptive variable names. 

names(data2)<-gsub("std()", "SD", names(data2))
names(data2)<-gsub("mean()", "MEAN", names(data2))
names(data2)<-gsub("^t", "time", names(data2))
names(data2)<-gsub("^f", "frequency", names(data2))
names(data2)<-gsub("Acc", "Accelerometer", names(data2))
names(data2)<-gsub("Gyro", "Gyroscope", names(data2))
names(data2)<-gsub("Mag", "Magnitude", names(data2))
names(data2)<-gsub("BodyBody", "Body", names(data2))

## .5 From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

tidydata <- ddply(data2, .(SubjectId, Activity), function(x) colMeans(x[, 4:69]))

write.table(tidydata, "TidyData.txt", row.name=FALSE) ## export the table




