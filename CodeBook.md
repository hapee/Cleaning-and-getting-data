CodeBook for the tidy dataset
=============================

Data source
-----------
This dataset is downloaded from the "Human Activity Recognition Using Smartphones Data Set" which was originally made available at this website: 
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

Processing
-----------------
I refer you to the README and features.txt files in the original dataset to learn more about the feature selection for this dataset. And there you will find the follow description:

# Step 1 - Combine or merge training and test datasets to create one data set
the data is coming from the (X_train.txt, X_test.txt), subject ids (subject_train.txt, subject_test.txt) and activity ids (y_train.txt, y_test.txt) tables and are merged to obtain a single data set. Variables are labelled with the names assigned by original collectors (features.txt).

# Step 2 - Extracts measurements on the mean and standard deviation for each measurement
We are only using the values of estimated mean (variables with labels that contain "mean") and standard deviation (variables with labels that contain "std") by using:
meanStdIndices <- grep("mean\\(\\)|std\\(\\)", features[, 2])
joinDat <- joinDat[, meanStdIndices]

# Step 3 - Use descriptive activity names to name the activities in the data set

# Step 4 - Create and write a tidy data set with the average of each variable for each activity and each subject
using write.table(result, "tidy.txt", quote = FALSE, sep = "; ")

The Result:
Extracted Feature Fields

    tBodyAccMeanX
    tBodyAccMeanY
    tBodyAccMeanZ
    tBodyAccStdX
    tBodyAccStdY
    tBodyAccStdZ
    tGravityAccMeanX
    tGravityAccMeanY
    tGravityAccMeanZ
    tGravityAccStdX
    tGravityAccStdY
    tGravityAccStdZ
    tBodyAccJerkMeanX
    tBodyAccJerkMeanY
    tBodyAccJerkMeanZ
    tBodyAccJerkStdX
    tBodyAccJerkStdY
    tBodyAccJerkStdZ
    tBodyGyroMeanX
    tBodyGyroMeanY
    tBodyGyroMeanZ
    tBodyGyroStdX
    tBodyGyroStdY
    tBodyGyroStdZ
    tBodyGyroJerkMeanX
    tBodyGyroJerkMeanY
    tBodyGyroJerkMeanZ
    tBodyGyroJerkStdX
    tBodyGyroJerkStdY
    tBodyGyroJerkStdZ
    tBodyAccMagMean
    tBodyAccMagStd
    tGravityAccMagMean
    tGravityAccMagStd
    tBodyAccJerkMagMean
    tBodyAccJerkMagStd
    tBodyGyroMagMean
    tBodyGyroMagStd
    tBodyGyroJerkMagMean
    tBodyGyroJerkMagStd
    fBodyAccMeanX
    fBodyAccMeanY
    fBodyAccMeanZ
    fBodyAccStdX
    fBodyAccStdY
    fBodyAccStdZ
    fBodyAccJerkMeanX
    fBodyAccJerkMeanY
    fBodyAccJerkMeanZ
    fBodyAccJerkStdX
    fBodyAccJerkStdY
    fBodyAccJerkStdZ
    fBodyGyroMeanX
    fBodyGyroMeanY
    fBodyGyroMeanZ
    fBodyGyroStdX
    fBodyGyroStdY
    fBodyGyroStdZ
    fBodyAccMagMean
    fBodyAccMagStd
    fBodyBodyAccJerkMagMean
    fBodyBodyAccJerkMagStd
    fBodyBodyGyroMagMean
    fBodyBodyGyroMagStd
    fBodyBodyGyroJerkMagMean
    fBodyBodyGyroJerkMagStd

Activity labels

    walking (value 1)
    walkingUpstairs (value 2)
    walkingDownstairs (value 3)
    sitting (value 4)
    standing (value 5)
    laying (value 6)


