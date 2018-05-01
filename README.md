#  Data preparation of UCI Human Activity Recognition (HAR) dataset


## Included files:

### README.md
	This file, which elaborates the connections between the files.

### CodeBook.md 
	Gives details about the underlying data
	Provides steps in preparing the data, including conceptual steps in run_analysis.R 
	Details the names and descriptions of the variables generated in BodyMotionData.txt.

### run_analysis.R
	Acquires data from online source, stores it locally, and opens data
	Reduces the raw data to variables of interst and produces a tidy data set in original wide format
	Transforms the data to get summary values (averages for person and activity)
	Stores the resultant values in BodyMotionData.txt

### BodyMotionData.txt
	This resultant file is provided at the Coursera website, and is also obtained by running run_analysis.R
	The data set is tidy, having only one value per column, with each row containing independent observations (subject to some overlap in acquisition), and no NA values are introduced where the original data had none.
	Despite the columns not being all independent (e.g. magnitude not independent of directional components, like tBodyAcc_mean_X, tBodyAcc_mean_Y, tBodyAcc_mean_Z , tBodyAccMag_mean), the data are still tidy since each value is derived independently from the raw data and may be desired for later analysis.
	


## Opening the final tidy file, BodyMotionData.txt

To open the prepared data file, BodyMotionData.txt, one can do the following:
1. Save the file to a local directory, with path called 'path', a string containing the path.
2. Then use the following code to open it in R (https://thoughtfulbloke.wordpress.com/2015/09/09/getting-and-cleaning-the-assignment/):

>the_table <- read.table(path, header = TRUE)
>View(the_table)