runAnalysis <- function(){
  
  
  loadData()
  filterAndClean()
  summarizeAndWrite()
  
  
}




loadData <- function(){
    # Load the Test and Training Data into data tables using dplyr
    library(data.table)
    
    XColNames <- read.table("UCI HAR Dataset/features.txt", sep = " ", header=FALSE, col.names = c("ID", "NAME"))
    activityLabels <- read.table("UCI HAR Dataset/activity_labels.txt", sep = " ", header=FALSE, col.names = c("ID", "LABEL"), stringsAsFactors = FALSE)
    subjectTrain <- read.table("UCI HAR Dataset/train/subject_train.txt", sep = " ", header=FALSE, col.names = c("Subject ID"))
    subjectTest <- read.table("UCI HAR Dataset/test/subject_test.txt", sep = " ", header=FALSE, col.names = c("Subject ID"))
    
    wearTest <- read.table("UCI HAR Dataset/test/X_test.txt", sep = "", header=FALSE, col.names = XColNames$NAME )
    yTest <- read.table("UCI HAR Dataset/test/y_test.txt", sep = "", header=FALSE, col.names = "Activity ID" )
    wearTrain <- read.table("UCI HAR Dataset/train/X_train.txt", sep = "", header=FALSE, col.names = XColNames$NAME )
    yTrain <- read.table("UCI HAR Dataset/train/y_train.txt", sep = "", header=FALSE, col.names = "Activity ID" )
    
    
    
    #  1.  Merges the training and the test sets to create one data set.
    
    wearData <- rbind(wearTest,wearTrain)
    wearActivity <- rbind(yTest,yTrain)
    wearSubjects <- rbind(subjectTest, subjectTrain)

}


filterAndClean <- function(){

    #  2.  Extracts only the measurements on the mean and standard deviation for each measurement. 
    
    dataFilter <- c(grep("mean", names(wearData)),grep("std", names(wearData)))
    
    wearData <- wearData[,dataFilter]
    wearData <- cbind(wearData,wearSubjects)
    wearData <- cbind(wearData,wearActivity)
    
    
    #  3.  Uses descriptive activity names to name the activities in the data set
    
    wearData <- cbind(wearData,data.frame(Activity_Name = rep(0,nrow(wearData))))
    #  4.  Appropriately labels the data set with descriptive variable names. 
    for (i in 1:nrow(activityLabels)){
      wearData[wearData$Activity.ID == activityLabels[i,{"ID"}] ,{"Activity_Name"}] <- activityLabels[i,{"LABEL"}]
    }

}


summarizeAndWrite <- function(){
    #  5.  From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
    
    wearDT <- data.table(wearData)
    
    summaryTable <- wearDT[,lapply(.SD,mean),by=c("Activity_Name","Subject.ID")]
    
    # Write table output with write.table() row.name = FALSE
    write.table(summaryTable,row.name=FALSE,file = "Assignment/output/tidyData.txt")
}