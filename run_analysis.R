# Read the 6 files inside train and test folders
X_test <- read.table("./UCI HAR Dataset/test/X_test.txt")
y_test <- read.table("./UCI HAR Dataset/test/y_test.txt")
subject_test <- read.table("./UCI HAR Dataset/test/subject_test.txt") 
X_train <- read.table("./UCI HAR Dataset/train/X_train.txt")
y_train <- read.table("./UCI HAR Dataset/train/y_train.txt")
subject_train <- read.table("./UCI HAR Dataset/train/subject_train.txt") 
# Put a name in V1 columns (in y_test, subject_test, y_train, subject_train) to avoid confusion
colnames(y_test) <- "activity"
colnames(subject_test) <- "subject"
colnames(y_train) <- "activity"
colnames(subject_train) <- "subject"
# Merge the 3 test files (all 3 have same number of rows)
test <- cbind(X_test, y_test, subject_test)
# Merge the 3 train files (all 3 have same number of rows)
train <- cbind(X_train, y_train, subject_train)
# Merge test and train data (both have same number of columns)
mergedData <- rbind(train, test)
# Read the file that contains activities names
activity_labels <- read.table("./UCI HAR Dataset/activity_labels.txt") 
# Uses descriptive activity names to name the activities in the data set from activity_labels file
mergedData$activity <- as.factor(activity_labels$V2[mergedData$activity])
# Read the file that contains features names
features <- read.table("./UCI HAR Dataset/features.txt") 
# Find features containing the words "mean" or "std" (index)
features_list <- grep("mean|std", features$V2)
# Subset mergedData based on the features_list (79 columns)
cols <- c(features_list)
tempData <- mergedData[,cols]
# Besure to also keep "activity" and "subject"!!! (2 columns)
cols2 <- c("activity", "subject")
tempData2 <- mergedData[,cols2]
# Make a list of the names of the features (with the value = TRUE now we have the names returned rather than indexes)
# Rename the columns of the first temporary file
features_names <- grep("mean|std", features$V2, value = TRUE)
colnames(tempData) <- features_names
# Merge the above two files (total 81 columns)
mergedData <- cbind(tempData, tempData2)
# load reshape2 library
library(reshape2)
# create tidy data set with the average of each variable for each activity and each subject using reshape2 library.
meltdata <- melt(mergedData, id.vars = c("activity", "subject"))
tidydata <- dcast(meltdata, activity + subject ~ variable, mean)
# write the tidy data to a txt file
write.table(tidydata, file = "tidydata.txt", row.names = FALSE)
