---
title: "README"
output: html_document
---



==================================================================================================
Study Design
==================================================================================================

tidyData.txt contains sensor data from Smartphones Dataset.  The data summarizes and cleans detailed data from the Human Activity Recognition Using Smartphones Dataset version 1.0.  The source of the data collected is:

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain. 



==================================================================================================
The following is a summary of the logic used to clean 
and summarize the data in the tidyData.txt file.
==================================================================================================




To create a consolidated and summarized data set, an R script was written to reshape the raw data.  The following is a description of of the functions used:


1. runAnalysis():
    This is the main function for running the full analysis.  It calls the following functions in sequence:  loadData(), filterAndClean(), summarizeAndWrite().
1. loadData():  
    The activity lables were loaded into a table from activity_labels.txt
    The feature names were loaded into a table from features.txt
    The subject details were loaded from the training and test data sets and merged into a unified dataset.
    The training and test x_data files were loaded into data frames, setting the colNames to the feature names table,  and merged into a single dataset.
    The training and test y_data files were loaded into data frames and merged into a single dataset.

2. filterAndClean():
    The unified x dataset was filtered to only include variables with measurements on the mean and standard deviation.
    The unified y dataset was added to the filtered x dataset
    The unified subject dataset was added to the filtered x dataset
    The activity lables are then added to each row in the filtered dataset.


3.  summarizeAndWrite():
    The filtered data frame is converted into a data table object.
    Each variable of standard deviation and mean are summarized grouped by activity name and subject.id
    The new summerized table is written to the tidyData.txt file in the output directory.  



==============================================================================================
tidyData.txt CODE BOOK:  Please see Code Book.txt in the respository.
==============================================================================================