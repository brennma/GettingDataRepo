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

- Activity_Name - The factor label for the activity being performed when measurement occurred.
<li>Subject.ID - The factor label for the subject wearing the device.
<li>tBodyAcc.mean...X - Average mean Time measure for the body accelerometer plane X in standard gravity units 'g'
<li>tBodyAcc.mean...Y - Average mean Time measure for the body accelerometer plane Y in standard gravity units 'g'
<li>tBodyAcc.mean...Z - Average mean Time measure for the body accelerometer plane Z in standard gravity units 'g'
<li>tGravityAcc.mean...X - Average mean Time measure for the gravity accelerometer plane X in standard gravity units 'g'
<li>tGravityAcc.mean...Y - Average mean Time measure for the gravity accelerometer plane Y in standard gravity units 'g'
<li>tGravityAcc.mean...Z - Average mean Time measure for the gravity accelerometer plane Z in standard gravity units 'g'
<li>tBodyAccJerk.mean...X - Average mean Time measure for the body jerk  on accelerometer plane X in standard gravity units 'g'
<li>tBodyAccJerk.mean...Y - Average mean Time measure for the body jerk  on accelerometer plane Y in standard gravity units 'g'
<li>tBodyAccJerk.mean...Z - Average mean Time measure for the body jerk  on accelerometer plane Z in standard gravity units 'g'
<li>tBodyGyro.mean...X - Average mean Time measure for the body velocity  on gyroscope plane X, units are radians/second
<li>tBodyGyro.mean...Y - Average mean Time measure for the body velocity  on gyroscope plane Y, units are radians/second
<li>tBodyGyro.mean...Z - Average mean Time measure for the body velocity  on gyroscope plane Z, units are radians/second
<li>tBodyGyroJerk.mean...X - Average mean Time measure for the body jerk  on gyroscope plane X, units are radians/second
<li>tBodyGyroJerk.mean...Y - Average mean Time measure for the body jerk  on gyroscope plane Y, units are radians/second
<li>tBodyGyroJerk.mean...Z - Average mean Time measure for the body jerk  on gyroscope plane Z, units are radians/second
<li>tBodyAccMag.mean.. - Average mean magnitude of the body accelerometer in standard gravity units 'g'
<li>tGravityAccMag.mean.. - Average mean magnitude of the gravity accelerometer in standard gravity units 'g'
<li>tBodyAccJerkMag.mean.. - Average mean magnitude of the body jerk on the accelerometer in standard gravity units 'g'
<li>tBodyGyroMag.mean.. - Average mean magnitude of the body gyroscope, units are radians/second
<li>tBodyGyroJerkMag.mean.. - Average mean magnitude of the body jerk on the gyroscope, units are radians/second
<li>fBodyAcc.mean...X - Average mean frequency measure for the body accelerometer plane X in standard gravity units 'g'
<li>fBodyAcc.mean...Y - Average mean frequency measure for the body accelerometer plane Y in standard gravity units 'g'
<li>fBodyAcc.mean...Z - Average mean frequency measure for the body accelerometer plane Z in standard gravity units 'g'
<li>fBodyAcc.meanFreq...X - Average weighted average of the frequency componentfor the body accelerometer plane X in standard gravity units 'g'
<li>fBodyAcc.meanFreq...Y - Average weighted average of the frequency componentfor the body accelerometer plane Y in standard gravity units 'g'
<li>fBodyAcc.meanFreq...Z - Average weighted average of the frequency componentfor the body jerk accelerometer plane Z in standard gravity units 'g'
<li>fBodyAccJerk.mean...X - Average mean weighted average of the frequency componentfor the body jerk accelerometer plane X in standard gravity units 'g'
<li>fBodyAccJerk.mean...Y - Average mean weighted average of the frequency componentfor the body jerk accelerometer plane Y in standard gravity units 'g'
<li>fBodyAccJerk.mean...Z - Average mean weighted average of the frequency componentfor the body jerk accelerometer plane Z in standard gravity units 'g'
<li>fBodyAccJerk.meanFreq...X - Average weighted average of the frequency componentfor the body jerk accelerometer plane X in standard gravity units 'g'
<li>fBodyAccJerk.meanFreq...Y - Average weighted average of the frequency componentfor the body jerk accelerometer plane Y in standard gravity units 'g'
<li>fBodyAccJerk.meanFreq...Z - Average weighted average of the frequency componentfor the body jerk accelerometer plane Z in standard gravity units 'g'
<li>fBodyGyro.mean...X - Average mean frequency measure for the body velocity  on gyroscope plane X, units are radians/second
<li>fBodyGyro.mean...Y - Average mean frequency measure for the body velocity  on gyroscope plane Y, units are radians/second
<li>fBodyGyro.mean...Z - Average mean frequency measure for the body velocity  on gyroscope plane Z, units are radians/second
<li>fBodyGyro.meanFreq...X - Average weighted average of the frequency component for the body velocity on gyroscope plane X, units are radians/second
<li>fBodyGyro.meanFreq...Y - Average weighted average of the frequency component for the body velocity on gyroscope plane Y, units are radians/second
<li>fBodyGyro.meanFreq...Z - Average weighted average of the frequency component for the body velocity on gyroscope plane Z, units are radians/second
<li>fBodyAccMag.mean.. - Average  mean of the frequency component for the body accelerometer magnitude in standard gravity units 'g'
<li>fBodyAccMag.meanFreq.. - Average weighted average of the frequency componentfor the body accelerometer magnitude in standard gravity units 'g'
<li>fBodyBodyAccJerkMag.mean.. - Average mean of the frequency componentfor the body jerk accelerometer magnitude in standard gravity units 'g'
<li>fBodyBodyAccJerkMag.meanFreq.. - Average weighted average of the frequency componentfor the body jerk accelerometer magnitude in standard gravity units 'g'
<li>fBodyBodyGyroMag.mean.. - Average mean frequency measure for the body velocity on gyroscope plane X, units are radians/second
<li>fBodyBodyGyroMag.meanFreq.. - Average weighted average of the frequency component for body velocity magnitude on the gyroscope, units are radians/second
<li>fBodyBodyGyroJerkMag.mean.. - Average mean frequency measure for the Body jerk velocity magnitude on gyroscope magnitude, units are radians/second
<li>fBodyBodyGyroJerkMag.meanFreq.. - Average weighted average of the frequency component for the body gyroscope magnitude, units are radians/second
<li>tBodyAcc.std...X - Average standard deviation of the time component for the body accelerometer plane X in standard gravity units 'g'
<li>tBodyAcc.std...Y - Average standard deviation of the time component for the body accelerometer plane Y in standard gravity units 'g'
<li>tBodyAcc.std...Z - Average standard deviation of the time component for the body accelerometer plane Z in standard gravity units 'g'
<li>tGravityAcc.std...X - Average standard deviation of the time component for the gravity accelerometer plane X in standard gravity units 'g'
<li>tGravityAcc.std...Y - Average standard deviation of the time component for the gravity accelerometer plane Y in standard gravity units 'g'
<li>tGravityAcc.std...Z - Average standard deviation of the time component for the gravity accelerometer plane Z in standard gravity units 'g'
<li>tBodyAccJerk.std...X - Average standard deviation of the time component for the body jerk accelerometer plane X in standard gravity units 'g'
<li>tBodyAccJerk.std...Y - Average standard deviation of the time component for the body jerk accelerometer plane Y in standard gravity units 'g'
<li>tBodyAccJerk.std...Z - Average standard deviation of the time component for the body jerk accelerometer plane Z in standard gravity units 'g'
<li>tBodyGyro.std...X - Average standard deviation Time measure for the body velocity  on gyroscope plane X, units are radians/second
<li>tBodyGyro.std...Y - Average  standard deviation Time measure for the body velocity  on gyroscope plane y, units are radians/second
<li>tBodyGyro.std...Z - Average standard deviation Time measure for the body velocity  on gyroscope plane z, units are radians/second
<li>tBodyGyroJerk.std...X - Average standard deviation Time measure for the body velocity  on gyroscope plane X, units are radians/second
<li>tBodyGyroJerk.std...Y - Average standard deviation Time measure for the body velocity  on gyroscope plane Y, units are radians/second
<li>tBodyGyroJerk.std...Z - Average standard deviation Time measure for the body velocity  on gyroscope plane Z, units are radians/second
<li>tBodyAccMag.std.. - Average standard deviation Time measure for the body accelerometer magnitude in standard gravity units 'g'
<li>tGravityAccMag.std.. - Average standard deviation Time measure for the gravity accelerometer magnitude in standard gravity units 'g'
<li>tBodyAccJerkMag.std.. - Average standard deviation Time measure for the body jerk accelerometer magnitude in standard gravity units 'g'
<li>tBodyGyroMag.std.. - Average standard deviation Time measure for the body velocity magnitude on gyroscope , units are radians/second
<li>tBodyGyroJerkMag.std.. - Average standard deviation Time measure for the body jerk velocity magnitude on gyroscope plane X, units are radians/second
<li>fBodyAcc.std...X - Average standard deviation of the frequency component for the body accelerometer plane X in standard gravity units 'g'
<li>fBodyAcc.std...Y - Average standard deviation of the frequency component for the body accelerometer plane Y in standard gravity units 'g'
<li>fBodyAcc.std...Z - Average standard deviation of the frequency component for the body accelerometer plane Z in standard gravity units 'g'
<li>fBodyAccJerk.std...X - Average standard deviation of the frequency component for the gravity accelerometer plane X in standard gravity units 'g'
<li>fBodyAccJerk.std...Y - Average standard deviation of the frequency component for the gravity accelerometer plane Y in standard gravity units 'g'
<li>fBodyAccJerk.std...Z - Average standard deviation of the frequency component for the gravity accelerometer plane Z in standard gravity units 'g'
<li>fBodyGyro.std...X - Average standard deviation of the frequency measure for the body velocity on gyroscope plane X, units are radians/second
<li>fBodyGyro.std...Y - Average standard deviation of the frequency measure for the body velocity on gyroscope plane Y, units are radians/second
<li>fBodyGyro.std...Z - Average standard deviation of the frequency measure for the body velocity on gyroscope plane Z, units are radians/second
<li>fBodyAccMag.std.. - Average standard deviation of the frequency measure for the Body accelerometer magnitude in standard gravity units 'g'
<li>fBodyBodyAccJerkMag.std.. - Average standard deviation of the frequency measure for the Body jerk accelerometer magnitude in standard gravity units 'g'
<li>fBodyBodyGyroMag.std.. - Average standard deviation of the frequency measure for the Body velocity magnitude on gyroscope, units are radians/second
<li>fBodyBodyGyroJerkMag.std.. - Average standard deviation of the frequency measure for the Body velocity magnitude on gyroscope, units are radians/second
<li>Activity.ID - number code for the activity.





