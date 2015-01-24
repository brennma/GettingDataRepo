==================================================================================================
Information about the variables from the source data 
==================================================================================================


The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

<li>tBodyAcc-XYZ
<li>tGravityAcc-XYZ
<li>tBodyAccJerk-XYZ
<li>tBodyGyro-XYZ
<li>tBodyGyroJerk-XYZ
<li>tBodyAccMag
<li>tGravityAccMag
<li>tBodyAccJerkMag
<li>tBodyGyroMag
<li>tBodyGyroJerkMag
<li>fBodyAcc-XYZ
<li>fBodyAccJerk-XYZ
<li>fBodyGyro-XYZ
<li>fBodyAccMag
<li>fBodyAccJerkMag
<li>fBodyGyroMag
<li>fBodyGyroJerkMag

The set of variables that were estimated from these signals are: 

mean(): Mean value
std(): Standard deviation
mad(): Median absolute deviation 
max(): Largest value in array
min(): Smallest value in array
sma(): Signal magnitude area
energy(): Energy measure. Sum of the squares divided by the number of values. 
iqr(): Interquartile range 
entropy(): Signal entropy
arCoeff(): Autorregresion coefficients with Burg order equal to 4
correlation(): correlation coefficient between two signals
maxInds(): index of the frequency component with largest magnitude
meanFreq(): Weighted average of the frequency components to obtain a mean frequency
skewness(): skewness of the frequency domain signal 
kurtosis(): kurtosis of the frequency domain signal 
bandsEnergy(): Energy of a frequency interval within the 64 bins of the FFT of each window.
angle(): Angle between to vectors.

Additional vectors obtained by averaging the signals in a signal window sample. These are used on the angle() variable:

gravityMean
tBodyAccMean
tBodyAccJerkMean
tBodyGyroMean
tBodyGyroJerkMean

The source file contained:

- Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.
- Triaxial Angular velocity from the gyroscope. 
- A 561-feature vector with time and frequency domain variables. 
- Its activity label. 
- An identifier of the subject who carried out the experiment.


==================================================================================================
Transformation logic for creating tidyData.txt
==================================================================================================

The following descripts the logic used to consolidate, reshape and summarize the source data from
the previous section into the tidyData.txt data set.

<ul>Step 1:</ul>
 
The source data from the study consisted of nine seperate files, x data files containing the 561 feature variables, y data files containing the associated labels, feature names for the variables in the data files, and activity label data associated to the data files.  The following is a breakdown of the source files:

- 'UCI HAR Dataset/features_info.txt': Shows information about the variables used on the feature vector.

- 'UCI HAR Dataset/features.txt': List of all features.

- 'UCI HAR Dataset/activity_labels.txt': Links the class labels with their activity name.

- 'UCI HAR Dataset/train/X_train.txt': Training set.

- 'UCI HAR Dataset/train/y_train.txt': Training labels.

- 'UCI HAR Dataset/test/X_test.txt': Test set.

- 'UCI HAR Dataset/test/y_test.txt': Test labels.

- 'UCI HAR Dataset/train/subject_train.txt': Subject ID labels.

- 'UCI HAR Dataset/test/subject_test.txt': Subject ID labels.

The first step was to consolidate all of the data into a single dataset.  The X and Y data sets were consolidated and merged into an X and  Y data tables.  The X data table as created specifing the variable headers from the features.txt file.  Additionally, the subject id's were added to a consolidated data table from the train and test subject files.  The README.md file shows the methods used to produce this output.

<ul>Step 2:</ul>

The second step in the transformation process was to create a filtered dataset that only included the variables related to mean and standard deviation.  The script subsets the X data table to only include variables that contain mean or std in the variable name.  Then the Y data table and subject data table are added to create a consolidated data set.

Finally, the activity lables are added to each row (observation) of the consolidated data set to complete the consolidate and reshaping process.

<ul>Step 3:</ul>

Using the newly created dataset from step 2, the script then summarizes the dataset by getting the average of each variable grouped by the activity and subject.




==================================================================================================
Information about the variables in the tidyData.txt data set.  Details include variable name, variable description and variable units.
==================================================================================================
There are 82 variables in the tidyData.txt.

Activity_Name - The factor label for the activity being performed when measurement occurred.
Subject.ID - The factor label for the subject wearing the device.
tBodyAcc.mean...X - Average mean Time measure for the body accelerometer plane X in standard gravity units 'g'
tBodyAcc.mean...Y - Average mean Time measure for the body accelerometer plane Y in standard gravity units 'g'
tBodyAcc.mean...Z - Average mean Time measure for the body accelerometer plane Z in standard gravity units 'g'
tGravityAcc.mean...X - Average mean Time measure for the gravity accelerometer plane X in standard gravity units 'g'
tGravityAcc.mean...Y - Average mean Time measure for the gravity accelerometer plane Y in standard gravity units 'g'
tGravityAcc.mean...Z - Average mean Time measure for the gravity accelerometer plane Z in standard gravity units 'g'
tBodyAccJerk.mean...X - Average mean Time measure for the body jerk  on accelerometer plane X in standard gravity units 'g'
tBodyAccJerk.mean...Y - Average mean Time measure for the body jerk  on accelerometer plane Y in standard gravity units 'g'
tBodyAccJerk.mean...Z - Average mean Time measure for the body jerk  on accelerometer plane Z in standard gravity units 'g'
tBodyGyro.mean...X - Average mean Time measure for the body velocity  on gyroscope plane X, units are radians/second
tBodyGyro.mean...Y - Average mean Time measure for the body velocity  on gyroscope plane Y, units are radians/second
tBodyGyro.mean...Z - Average mean Time measure for the body velocity  on gyroscope plane Z, units are radians/second
tBodyGyroJerk.mean...X - Average mean Time measure for the body jerk  on gyroscope plane X, units are radians/second
tBodyGyroJerk.mean...Y - Average mean Time measure for the body jerk  on gyroscope plane Y, units are radians/second
tBodyGyroJerk.mean...Z - Average mean Time measure for the body jerk  on gyroscope plane Z, units are radians/second
tBodyAccMag.mean.. - Average mean magnitude of the body accelerometer in standard gravity units 'g'
tGravityAccMag.mean.. - Average mean magnitude of the gravity accelerometer in standard gravity units 'g'
tBodyAccJerkMag.mean.. - Average mean magnitude of the body jerk on the accelerometer in standard gravity units 'g'
tBodyGyroMag.mean.. - Average mean magnitude of the body gyroscope, units are radians/second
tBodyGyroJerkMag.mean.. - Average mean magnitude of the body jerk on the gyroscope, units are radians/second
fBodyAcc.mean...X - Average mean frequency measure for the body accelerometer plane X in standard gravity units 'g'
fBodyAcc.mean...Y - Average mean frequency measure for the body accelerometer plane Y in standard gravity units 'g'
fBodyAcc.mean...Z - Average mean frequency measure for the body accelerometer plane Z in standard gravity units 'g'

fBodyAcc.meanFreq...X - Average weighted average of the frequency componentfor the body accelerometer plane X in standard gravity units 'g'
fBodyAcc.meanFreq...Y - Average weighted average of the frequency componentfor the body accelerometer plane Y in standard gravity units 'g'
fBodyAcc.meanFreq...Z - Average weighted average of the frequency componentfor the body jerk accelerometer plane Z in standard gravity units 'g'
fBodyAccJerk.mean...X - Average mean weighted average of the frequency componentfor the body jerk accelerometer plane X in standard gravity units 'g'
fBodyAccJerk.mean...Y - Average mean weighted average of the frequency componentfor the body jerk accelerometer plane Y in standard gravity units 'g'
fBodyAccJerk.mean...Z - Average mean weighted average of the frequency componentfor the body jerk accelerometer plane Z in standard gravity units 'g'
fBodyAccJerk.meanFreq...X - Average weighted average of the frequency componentfor the body jerk accelerometer plane X in standard gravity units 'g'
fBodyAccJerk.meanFreq...Y - Average weighted average of the frequency componentfor the body jerk accelerometer plane Y in standard gravity units 'g'
fBodyAccJerk.meanFreq...Z - Average weighted average of the frequency componentfor the body jerk accelerometer plane Z in standard gravity units 'g'
fBodyGyro.mean...X - Average mean frequency measure for the body velocity  on gyroscope plane X, units are radians/second
fBodyGyro.mean...Y - Average mean frequency measure for the body velocity  on gyroscope plane Y, units are radians/second
fBodyGyro.mean...Z - Average mean frequency measure for the body velocity  on gyroscope plane Z, units are radians/second
fBodyGyro.meanFreq...X - Average weighted average of the frequency component for the body velocity on gyroscope plane X, units are radians/second
fBodyGyro.meanFreq...Y - Average weighted average of the frequency component for the body velocity on gyroscope plane Y, units are radians/second
fBodyGyro.meanFreq...Z - Average weighted average of the frequency component for the body velocity on gyroscope plane Z, units are radians/second
fBodyAccMag.mean.. - Average  mean of the frequency component for the body accelerometer magnitude in standard gravity units 'g'
fBodyAccMag.meanFreq.. - Average weighted average of the frequency componentfor the body accelerometer magnitude in standard gravity units 'g'
fBodyBodyAccJerkMag.mean.. - Average mean of the frequency componentfor the body jerk accelerometer magnitude in standard gravity units 'g'
fBodyBodyAccJerkMag.meanFreq.. - Average weighted average of the frequency componentfor the body jerk accelerometer magnitude in standard gravity units 'g'
fBodyBodyGyroMag.mean.. - Average mean frequency measure for the body velocity on gyroscope plane X, units are radians/second
fBodyBodyGyroMag.meanFreq.. - Average weighted average of the frequency component for body velocity magnitude on the gyroscope, units are radians/second
fBodyBodyGyroJerkMag.mean.. - Average mean frequency measure for the Body jerk velocity magnitude on gyroscope magnitude, units are radians/second
fBodyBodyGyroJerkMag.meanFreq.. - Average weighted average of the frequency component for the body gyroscope magnitude, units are radians/second
tBodyAcc.std...X - Average standard deviation of the time component for the body accelerometer plane X in standard gravity units 'g'
tBodyAcc.std...Y - Average standard deviation of the time component for the body accelerometer plane Y in standard gravity units 'g'
tBodyAcc.std...Z - Average standard deviation of the time component for the body accelerometer plane Z in standard gravity units 'g'
tGravityAcc.std...X - Average standard deviation of the time component for the gravity accelerometer plane X in standard gravity units 'g'
tGravityAcc.std...Y - Average standard deviation of the time component for the gravity accelerometer plane Y in standard gravity units 'g'
tGravityAcc.std...Z - Average standard deviation of the time component for the gravity accelerometer plane Z in standard gravity units 'g'
tBodyAccJerk.std...X - Average standard deviation of the time component for the body jerk accelerometer plane X in standard gravity units 'g'
tBodyAccJerk.std...Y - Average standard deviation of the time component for the body jerk accelerometer plane Y in standard gravity units 'g'
tBodyAccJerk.std...Z - Average standard deviation of the time component for the body jerk accelerometer plane Z in standard gravity units 'g'
tBodyGyro.std...X - Average standard deviation Time measure for the body velocity  on gyroscope plane X, units are radians/second
tBodyGyro.std...Y - Average  standard deviation Time measure for the body velocity  on gyroscope plane y, units are radians/second
tBodyGyro.std...Z - Average standard deviation Time measure for the body velocity  on gyroscope plane z, units are radians/second
tBodyGyroJerk.std...X - Average standard deviation Time measure for the body velocity  on gyroscope plane X, units are radians/second
tBodyGyroJerk.std...Y - Average standard deviation Time measure for the body velocity  on gyroscope plane Y, units are radians/second
tBodyGyroJerk.std...Z - Average standard deviation Time measure for the body velocity  on gyroscope plane Z, units are radians/second

tBodyAccMag.std.. - Average standard deviation Time measure for the body accelerometer magnitude in standard gravity units 'g'
tGravityAccMag.std.. - Average standard deviation Time measure for the gravity accelerometer magnitude in standard gravity units 'g'
tBodyAccJerkMag.std.. - Average standard deviation Time measure for the body jerk accelerometer magnitude in standard gravity units 'g'
tBodyGyroMag.std.. - Average standard deviation Time measure for the body velocity magnitude on gyroscope , units are radians/second
tBodyGyroJerkMag.std.. - Average standard deviation Time measure for the body jerk velocity magnitude on gyroscope plane X, units are radians/second

fBodyAcc.std...X - Average standard deviation of the frequency component for the body accelerometer plane X in standard gravity units 'g'
fBodyAcc.std...Y - Average standard deviation of the frequency component for the body accelerometer plane Y in standard gravity units 'g'
fBodyAcc.std...Z - Average standard deviation of the frequency component for the body accelerometer plane Z in standard gravity units 'g'
fBodyAccJerk.std...X - Average standard deviation of the frequency component for the gravity accelerometer plane X in standard gravity units 'g'
fBodyAccJerk.std...Y - Average standard deviation of the frequency component for the gravity accelerometer plane Y in standard gravity units 'g'
fBodyAccJerk.std...Z - Average standard deviation of the frequency component for the gravity accelerometer plane Z in standard gravity units 'g'
fBodyGyro.std...X - Average standard deviation of the frequency measure for the body velocity on gyroscope plane X, units are radians/second
fBodyGyro.std...Y - Average standard deviation of the frequency measure for the body velocity on gyroscope plane Y, units are radians/second
fBodyGyro.std...Z - Average standard deviation of the frequency measure for the body velocity on gyroscope plane Z, units are radians/second
fBodyAccMag.std.. - Average standard deviation of the frequency measure for the Body accelerometer magnitude in standard gravity units 'g'
fBodyBodyAccJerkMag.std.. - Average standard deviation of the frequency measure for the Body jerk accelerometer magnitude in standard gravity units 'g'
fBodyBodyGyroMag.std.. - Average standard deviation of the frequency measure for the Body velocity magnitude on gyroscope, units are radians/second
fBodyBodyGyroJerkMag.std.. - Average standard deviation of the frequency measure for the Body velocity magnitude on gyroscope, units are radians/second
Activity.ID - number code for the activity.





