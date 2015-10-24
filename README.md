Hello and welcome to my course project :) 

For my run_analysis.R script, I assumed that you have unzipped the provided data and have "UCI HAR Dataset" directory in your working directory. So all file paths start with "./UCI HAR Dataset" 
I have put detailed comments inside the script for every step of the analysis.
In order to extract the measurements on the mean and standard deviation for each measurement, I took all features with the words "mean" or "std" in them because all of them seem to measure means or standard deviations (for example it says meanFreq(): Weighted average of the frequency components to obtain a mean frequency).
I kept variable names the same with the names given in the features.txt in order to be able to make data reusable and easily changed. Moreover those names sound enough self-explainable. 

In order to view tidy data in R you can use the 2-line-code below:

data <- read.table(file_path, header = TRUE) 
View(data)

where file_path is the path for the "tidydata.txt" file provided

Enjoy :) 
