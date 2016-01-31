# Step 1 - Combine or merge training and test datasets to create one data set
trainDat <- read.table("data/train/X_train.txt")
trainLab <- read.table("data/train/y_train.txt")
trainSub <- read.table("data/train/subject_train.txt")
testDat <- read.table("data/test/X_test.txt")
testLab <- read.table("data/test/y_test.txt") 
testSub <- read.table("data/test/subject_test.txt")
joinDat <- rbind(trainDat, testDat)
joinLab <- rbind(trainLab, testLab)
joinSub <- rbind(trainSub, testSub)

# Step 2 - Extracts measurements on the mean and standard deviation for each measurement
features <- read.table("data/features.txt")
meanStdIndices <- grep("mean\\(\\)|std\\(\\)", features[, 2])
joinDat <- joinDat[, meanStdIndices]
names(joinDat) <- gsub("\\(\\)", "", features[meanStdIndices, 2]) # remove "()"
names(joinDat) <- gsub("mean", "Mean", names(joinDat)) # capitalize M
names(joinDat) <- gsub("std", "Std", names(joinDat)) # capitalize S
names(joinDat) <- gsub("-", "", names(joinDat)) # remove "-" in column names 

# Step 3 - Use descriptive activity names to name the activities in the data set
act <- read.table("data/activity_labels.txt")
act[, 2] <- tolower(gsub("_", "", act[, 2]))
substr(act[2, 2], 8, 8) <- toupper(substr(act[2, 2], 8, 8))
substr(act[3, 2], 8, 8) <- toupper(substr(act[3, 2], 8, 8))
actLab <- act[joinLab[, 1], 2]
joinLab[, 1] <- actLab
names(joinLab) <- "activity"

# Step 4 - Create and write a tidy data set with the average of each variable for each activity and each subject
names(joinSub) <- "subject"
cleanedData <- cbind(joinSub, joinLab, joinDat)
subjectLen <- length(table(joinSub))
activityLen <- dim(act)[1]
columnLen <- dim(cleanedData)[2]
result <- matrix(NA, nrow=subjectLen*activityLen, ncol=columnLen) 
result <- as.data.frame(result)
colnames(result) <- colnames(cleanedData)
row <- 1
for(i in 1:subjectLen) {
  for(j in 1:activityLen) {
    result[row, 1] <- sort(unique(joinSub)[, 1])[i]
    result[row, 2] <- act[j, 2]
    bool1 <- i == cleanedData$subject
    bool2 <- act[j, 2] == cleanedData$activity
    result[row, 3:columnLen] <- colMeans(cleanedData[bool1&bool2, 3:columnLen])
    row <- row + 1
  }
}
write.table(result, "tidy.txt", quote = FALSE, sep = "; ")


