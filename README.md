# ProgAssignment4

#"Getting and Cleaning Data" Course Project

##Project Summary
The goal of this project is to prepare tidy data to analyze results collected from the accelerometers from the Samsung Galaxy S smartphone (full description: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones).

The R script run_analysis.R completes the following steps:
1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement.
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive variable names.
5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

##Initial Data

features.txt - includes the descriptions for measured features 
X_train.txt - includes the measurements of the features in train set
X_test.txt - includes the measurements of the features in test set
subject_train.txt - subject for each measurement from the train set
subject_test.txt - subject for each measurement from the test set
y_train.txt - activity (from 1 to 6) for each measurement from the train set
y_test.txt - activity (from 1 to 6) for each measurement from the test set

