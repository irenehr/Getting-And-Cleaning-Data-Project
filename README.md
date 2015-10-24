Hello and welcome to my course project :) 

For my run_analysis.R script, I assumed that you have unzipped the provided data and have "UCI HAR Dataset" directory in your working directory. So all file paths start with "./UCI HAR Dataset" 
I have put detailed comments inside the script for every step of the analysis.
In order to extract the measurements on the mean and standard deviation for each measurement, I took all features with the words "mean" or "std" in them because all of them seem to measure means or standard deviations (for example it says meanFreq(): Weighted average of the frequency components to obtain a mean frequency).
I kept variable names the same with the names given in the features.txt in order to be able to make data reusable and easily changed. Moreover those names sound enough self-explainable. 

In order to view tidy data in R you can use the 2-line-code below:

data <- read.table(file_path, header = TRUE) 
View(data)

where file_path is the path for the "tidydata.txt" file provided

The steps (also written as comments in the run_analysis.R) are the following:

# Read the 6 files inside train and test folders
# Set a name in V1 columns (in y_test, subject_test, y_train, subject_train) to avoid confusion
# Merge the 3 test files (all 3 have same number of rows)
# Merge the 3 train files (all 3 have same number of rows)
# Merge test and train data (both have same number of columns)
# Read the file that contains activities names
# Use descriptive activity names to name the activities in the data set from activity_labels file
# Read the file that contains features names
# Find features containing the words "mean" or "std" (index)
# Subset mergedData based on the features_list to a temporary file (79 columns)
# Besure to also keep "activity" and "subject" to a second temporary file !!! (2 columns)
# Make a list of the names of the features (with the value = TRUE now we have the names returned rather than indexes)
# Rename the columns of the first temporary file
# Merge the two files (total 81 columns)
# load reshape2 library
# create tidy data set with the average of each variable for each activity and each subject using reshape2 library.
# write the tidy data to a txt file

Enjoy :) 
