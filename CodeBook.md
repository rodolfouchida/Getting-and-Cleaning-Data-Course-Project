
# Getting and Cleaning Data Project

## Description

Additional information about the variables, data and transformations used in the course project for the Johns Hopkins Getting and Cleaning Data course.

## Source Data

A full description of the data used in this project can be found at The UCI Machine Learning Repository

The source data for this project can be found here.

## Data Set Information

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain.

## Attribute Information

For each record in the dataset it is provided:

- Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration. 
- Triaxial Angular velocity from the gyroscope. 
- A 561-feature vector with time and frequency domain variables. 
- Its activity label. 
- An identifier of the subject who carried out the experiment.

## Reading the data

First we set the source directory for the files, then read into tables and assign them the following objects: 

- features <- features.txt
- activity <- activity_labels.txt
- subjectTrain <- subject_train.txt
- subjectTest <- subject_test.txt
- xTrain <- x_train.txt
- yTrain <- y_train.txt
- xTest <-  x_test.txt
- yTest <-  y_test.txt

Then, assign the labels and merge the x,y and subject data sets to creat te train and test data sets


## Section 1. Merge the training and the test sets to create one data set.

The train and test data sets were merged by rows with the rbind function, it creates the "data" dataset

## Section 2. Extracts only the measurements on the mean and standard deviation for each measurement 

In order to extract the measurement on the mean and standard deviation for each measurement first we need to know what columns have those measures, the grep function was used for this purpose. Then cbind was used to merge the activities, subjects with the columns with the means and stardard deviations. The final dataset created is named "data2"

## Section 3. Uses descriptive activity names to name the activities in the data set

We merge data2 and the activity dataset by ActivityId

## Section 4. Appropriately labels the data set with descriptive variable names.

The function gsub was deployed to replace abreviated words such as std, Acc, Gyro, f, etc... We searched for all abreviated words throughout "data2" and replace them with the complete word

## Section .5 From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

As we have two levels of classification for the average of each column in "data2" we deployed the ddply function to generate a dataset with the means for each collumns grouped by activities and subjects 






