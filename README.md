Getting and Cleaning Data: Course Project
=========================================

Introduction
------------
Repository containing the result for the course project for the Coursera course "Getting and Cleaning data", part of the Data Science specialization.

The dataset used is coming the Human Activity Recognition Using Smartphones Data Set: The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data.

About the script and the tidy dataset
-------------------------------------
I created a script called run_analysis.R according to the requirements of the assignment which will merge the test and training sets together.

The columns that have to do with mean and standard deviation are kept after merging testing and training and labels are added.

The script creates a tidy data set containing the means of all the columns per test subject and per activity.
This tidy dataset will be written to a tab-delimited file called tidy.txt, which can also be found in this repository.

About the Code Book
-------------------
The CodeBook.md file explains the transformations performed and the resulting data and variables.

