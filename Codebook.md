# Code Book for Averaged Accelerometer and Gyroscope Data from Samsung Galaxy S II Phone
### UCI Human Activity Recognition Dataset


## Data preparation remarks

Information on the original data, which is derived from Samsung Galaxy S II smartphone accelerometer and gyroscope measurements of 30 individuals performing one of six activities (e.g. SITTING), can be found here:
http://archive.ics.uci.edu/ml/datasets/Smartphone-Based+Recognition+of+Human+Activities+and+Postural+Transitions
Briefly, the raw data (i.e. the starting data for the data preparation tasks here) are obtained from data collected from the accelerometer and gyroscope at 50 Hz frequency.  The data are segmented into 2.56s windows with 50% overlap for generating the original variables.  Each source data are filtered for noise, where gyroscope data gives 'body' signals and the accelerometer data can be further filtered to separate a 'body' component as well as a 'gravity' component.  The 'body' component of both accelerometer and gyroscope data can be differentiated to give a 'jerk' measurement.  For each measurement (including the accelerometer gravity component), the magnitude is also obtained; and for tri-axial data and magnitude data, several frequency-domain variables are calculated (notably not for gravity component of accelerometer data).  The dataset consists of these values and 17 statistical values (e.g. mean, standard deviation, entropy, kurtosis, angle,etc.) derived from them, often broken down into Cartesian components, X-, Y-, and Z.

The approach used to obtain the data described below takes the UCI HAR dataset (from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip) and prepares it by doing the following (following closely from https://www.coursera.org/learn/data-cleaning/peer/FIZtT/getting-and-cleaning-data-course-project): 

1. Merges the training and the test sets to create one data set.
2. Replaces the numerical activity labels in the data set with descriptive names like e.g. 'SITTING'
3. Extracts all the measurements containing the word 'mean' for mean or 'std'  for standard deviation for each measurement, except those used for the 'angle' calculation (which are not provided independently). These values were chosen to have the most complete dataset of mean values and standard deviations for any purpose that might be needed later.  This is a valid approach, according to https://thoughtfulbloke.wordpress.com/2015/09/09/getting-and-cleaning-the-assignment/.  
4. Combines the subject ID ('participant_index' in description below), the activity ('action' in the description below), and the various data.  Also, it appropriately labels the data set with descriptive variable names.
5. From the reduced dataset (with mean and standard deviation data only), creates a second, independent tidy data set with the average of each variable for each activity and each subject.  The wide form of tidy data is used, where the data are interpreted as dependent outcomes on the independent variables of the participant and activity that the participant performs, which is a valid interpretation as per the disussion at https://thoughtfulbloke.wordpress.com/2015/09/09/getting-and-cleaning-the-assignment/.

The steps are carried out in the included script in this repository, run_analysis.R


## The following are general features of the data, which are not repeated or are abbreviated in the descriptions of the individual variables for the sake of clarity and brevity:

### The values in this codebook are *all* **average values**.  The individual values are not labeled as 'average' because this distinction is not needed to differentiate the values.

### The variable name contains either 'Acc' or 'Gyro'
When the variable name contains 'Acc', this refers to accelerometer data, whose values are in units of *g* = 9.8 m/s^2, normalized to [-1,1]. Descriptions of the accelerometer data will only state 'Acc' to refer to accelerometer data.

When the variable name contains 'Gyro', this refers to gyroscope data, whose values are in units of rads/s, normalized to [-1,1]. Descriptions of the gyroscope data will only state 'Gyro' to refer to gyroscope data.


### The variable name begins either with't' or 'f'
When the variable begins with 't', the data is in the time domain and will be referred to as 't-domain' in the descriptions.

When the variable begins with 'f', the data is in the frequency domain and will be referred to as 'f-domain' in the descriptions.


### Some variables contain the term 'Jerk'
This jerk signal is from the body component of either accelerometer data or the gyroscope data.  Since this signal is understood as a body signal, the description will not include 'body' for the variables containing 'Jerk' 


### Some variables contain the term 'Mag'
'Mag' refers to magnitude. It does not contain directional information. The description will refer to magnitude as 'Mag' for the variables containing 'Mag' 



## Variable List and Description

participant_index: Number representing the participant, an integer from 1 to 30

action: Action in progress during measurement, one of 6 values: LAYING,SITTING,STANDING,WALKING,WALKING_DOWNSTAIRS, OR WALKING_UPSTAIRS

tBodyAcc_mean_X: Mean of t-domain Acc data for body signal in X direction

tBodyAcc_mean_Y: Mean of t-domain Acc data for body signal in Y direction

tBodyAcc_mean_Z: Mean of t-domain Acc data for body signal in Z direction

tBodyAcc_std_X: Standard deviation of t-domain Acc data for body signal in X direction

tBodyAcc_std_Y: Standard deviation of t-domain Acc data for body signal in Y direction

tBodyAcc_std_Z: Standard deviation of t-domain Acc data for body signal in Z direction

tGravityAcc_mean_X: Mean of t-domain Acc data for gravity signal in X direction

tGravityAcc_mean_Y: Mean of t-domain Acc data for gravity signal in Y direction
tGravityAcc_mean_Z: Mean of t-domain Acc data for gravity signal in Z direction

tGravityAcc_std_X: Standard deviation of t-domain Acc data for gravity signal in X direction

tGravityAcc_std_Y: Standard deviation of t-domain Acc data for gravity signal in Y direction

tGravityAcc_std_Z: Standard deviation of t-domain Acc data for gravity signal in Z direction

tBodyAccJerk_mean_X: Mean of t-domain Acc data for jerk signal in X direction

tBodyAccJerk_mean_Y: Mean of t-domain Acc data for jerk signal in Y direction

tBodyAccJerk_mean_Z: Mean of t-domain Acc data for jerk signal in Z direction

tBodyAccJerk_std_X: Standard deviation of t-domain Acc data for jerk signal in X direction

tBodyAccJerk_std_Y: Standard deviation of t-domain Acc data for jerk signal in Y direction

tBodyAccJerk_std_Z: Standard deviation of t-domain Acc data for jerk signal in Z direction

tBodyGyro_mean_X: Mean of t-domain Gyro data for body signal in X direction

tBodyGyro_mean_Y: Mean of t-domain Gyro data for body signal in Y direction

tBodyGyro_mean_Z: Mean of t-domain Gyro data for body signal in Z direction

tBodyGyro_std_X: Standard deviation of t-domain Gyro data for body signal in X direction

tBodyGyro_std_Y: Standard deviation of t-domain Gyro data for body signal in Y direction

tBodyGyro_std_Z: Standard deviation of t-domain Gyro data for body signal in Z direction

tBodyGyroJerk_mean_X: Mean of t-domain Gyro data for jerk signal in X direction

tBodyGyroJerk_mean_Y: Mean of t-domain Gyro data for jerk signal in Y direction

tBodyGyroJerk_mean_Z: Mean of t-domain Gyro data for jerk signal in Z direction

tBodyGyroJerk_std_X: Standard deviation of t-domain Gyro data for jerk signal in X direction

tBodyGyroJerk_std_Y: Standard deviation of t-domain Gyro data for jerk signal in Y direction

tBodyGyroJerk_std_Z: Standard deviation of t-domain Gyro data for jerk signal in Z direction

tBodyAccMag_mean: Mean of t-domain Acc data for body signal Mag

tBodyAccMag_std: Standard deviation of t-domain Acc data for body signal Mag

tGravityAccMag_mean: Mean of t-domain Acc data for gravity signal Mag

tGravityAccMag_std: Standard deviation of t-domain Acc data for gravity signal Mag

tBodyAccJerkMag_mean: Mean of t-domain Acc data for jerk signal Mag

tBodyAccJerkMag_std: Standard deviation of t-domain Acc data for jerk signal Mag

tBodyGyroMag_mean: Mean of t-domain Gyro data for body signal Mag


tBodyGyroMag_std: Standard deviation of t-domain Gyro data for body signal Mag

tBodyGyroJerkMag_mean: Mean of t-domain Gyro data for jerk signal Mag

tBodyGyroJerkMag_std: Standard deviation of t-domain Gyro data for jerk signal Mag

fBodyAcc_mean_X: Mean of f-domain Acc data for body signal in X direction

fBodyAcc_mean_Y: Mean of f-domain Acc data for body signal in Y direction

fBodyAcc_mean_Z: Mean of f-domain Acc data for body signal in Z direction

fBodyAcc_std_X: Standard deviation of f-domain Acc data for body signal in X direction

fBodyAcc_std_Y: Standard deviation of f-domain Acc data for body signal in Y direction

fBodyAcc_std_Z: Standard deviation of f-domain Acc data for body signal in Z direction

fBodyAcc_meanFreq_X: Mean frequency of f-domain Acc data for body signal in X direction

fBodyAcc_meanFreq_Y: Mean frequency of f-domain Acc data for body signal in Y direction

fBodyAcc_meanFreq_Z: Mean frequency of f-domain Acc data for body signal in Z direction

fBodyAccJerk_mean_X: Mean of f-domain Acc data for jerk signal in X direction

fBodyAccJerk_mean_Y: Mean of f-domain Acc data for jerk signal in Y direction

fBodyAccJerk_mean_Z: Mean of f-domain Acc data for jerk signal in Z direction

fBodyAccJerk_std_X:  Standard deviation of f-domain Acc data for jerk signal in X direction

fBodyAccJerk_std_Y: Standard deviation of f-domain Acc data for jerk signal in Y direction

fBodyAccJerk_std_Z: Standard deviation of f-domain Acc data for jerk signal in Z direction

fBodyAccJerk_meanFreq_X: Mean frequency of f-domain Acc data for jerk signal in X direction

fBodyAccJerk_meanFreq_Y: Mean frequency of f-domain Acc data for jerk signal in y direction

fBodyAccJerk_meanFreq_Z: Mean frequency of f-domain Acc data for jerk signal in Z direction

fBodyGyro_mean_X: Mean of f-domain Gyro data for body signal in X direction

fBodyGyro_mean_Y: Mean of f-domain Gyro data for body signal in Y direction 

fBodyGyro_mean_Z: Mean of f-domain Gyro data for body signal in Z direction

fBodyGyro_std_X: Standard deviation of f-domain Gyro data for body signal in X direction

fBodyGyro_std_Y: Standard deviation of f-domain Gyro data for body signal in Y direction

fBodyGyro_std_Z: Standard deviation of f-domain Gyro data for body signal in Z direction

fBodyGyro_meanFreq_X: Mean frequency of f-domain Gyro data for body signal in X direction

fBodyGyro_meanFreq_Y: Mean frequency of f-domain Gyro data for body signal in Y direction

fBodyGyro_meanFreq_Z: Mean frequency of f-domain Gyro data for body signal in Z direction

fBodyAccMag_mean: Mean of f-domain Acc data for body signal Mag

fBodyAccMag_std: Standard deviation of f-domain Acc data for body signal Mag

fBodyAccMag_meanFreq: Mean frequency of f-domain Acc data for body signal Mag

fBodyAccJerkMag_mean: Mean of f-domain Acc data for jerk signal Mag

fBodyAccJerkMag_std: Standard deviation of f-domain Acc data for jerk signal Mag

fBodyAccJerkMag_meanFreq: Mean frequency of f-domain Acc data for jerk signal Mag

fBodyGyroMag_mean: Mean of f-domain Gyro data for body signal Mag

fBodyGyroMag_std: Standard deviation of f-domain Gyro data for body signal Mag

fBodyGyroMag_meanFreq: Mean frequency of f-domain Gyro data for body signal Mag

fBodyGyroJerkMag_mean: Mean of f-domain Gyro data for jerk signal Mag

fBodyGyroJerkMag_std: Standard deviation of f-domain Gyro data for jerk signal Mag

fBodyGyroJerkMag_meanFreq: Mean frequency of f-domain Gyro data for jerk signal Mag