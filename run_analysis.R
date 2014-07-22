#Read in necessary files
X_test<-read.table("c:/Users/241003h/Documents/Documents/Rfiles/CleanDataCourse/Project/projectFiles/test/X_test.txt")
Y_test<-read.table("c:/Users/241003h/Documents/Documents/Rfiles/CleanDataCourse/Project/projectFiles/test/Y_test.txt")
Y_train<-read.table("c:/Users/241003h/Documents/Documents/Rfiles/CleanDataCourse/Project/projectFiles/train/Y_train.txt")
X_train<-read.table("c:/Users/241003h/Documents/Documents/Rfiles/CleanDataCourse/Project/projectFiles/train/X_train.txt")
features<-read.table("c:/Users/241003h/Documents/Documents/Rfiles/CleanDataCourse/Project/projectFiles/features.txt")
testSubjects<-read.table("c:/Users/241003h/Documents/Documents/Rfiles/CleanDataCourse/Project/projectFiles/test/subject_test.txt")
trainSubjects<-read.table("c:/Users/241003h/Documents/Documents/Rfiles/CleanDataCourse/Project/projectFiles/train/subject_train.txt")

#Define 2 new levels in <features> and add them to the start of the data.frame
levels(features[,2])<-c(levels(features[,2]),"Subject","Activity")
features<-rbind(c(562,"Subject"),c(536,"Activity"),features)

#combine the data into a single data.frame and rename the columns based on <features>
testData<-cbind(testSubjects,Y_test,X_test)
trainData<-cbind(trainSubjects,Y_train,X_train)
allData<-rbind(testData,trainData)
colnames(allData)<-features[,2]

#Set Activity as a factor and re-label the levels.
allData$Activity<-as.factor(allData$Activity)
levels(allData$Activity)[levels(allData$Activity)=="1"] <- "Walking"
levels(allData$Activity)[levels(allData$Activity)=="2"] <- "Walking_Upstairs"
levels(allData$Activity)[levels(allData$Activity)=="3"] <- "Walking_Downstairs"
levels(allData$Activity)[levels(allData$Activity)=="4"] <- "Sitting"
levels(allData$Activity)[levels(allData$Activity)=="5"] <- "Standing"
levels(allData$Activity)[levels(allData$Activity)=="6"] <- "Laying"

#Select only the variables that are calculared means or standard deviations and retaining the Activity and Subject columns 
dataSummary<-allData[,grepl("mean|std|Activity|Subject",names(allData))]

##This creates a data.frame with a variable for the subject, one for the activity and each of the variables that relate to a mean or std
##So up to here I've done up to step 3. Next step is to define sensible variable names for each of the measurements.

#varLabels<-as.data.frame(colnames(dataSummary))
#write.csv(varLabels,"c:/Users/241003h/Documents/Documents/Rfiles/CleanDataCourse/Project/projectFiles/codebook.csv")

codeBook<-read.csv("c:/Users/241003h/Documents/Documents/Rfiles/CleanDataCourse/Project/projectFiles/codebook.csv",header=TRUE)
newVarNames<-as.vector(codeBook[,"newNames"])
colnames(dataSummary)<-newVarNames

#Or this for renaming with direct reference
newVarNames1<-c("Subject","Activity","BodyAcceleration_Xaxis_Mean","BodyAcceleration_Yaxis_Mean",
                "BodyAcceleration_Zaxis_Mean","BodyAcceleration_Xaxis_St.Dev","BodyAcceleration_Yaxis_Std.Dev",
                "BodyAcceleration_Zaxis_Std.Dev","GravityAcceleration_Xaxis_Mean","GravityAcceleration_Yaxis_Mean",
                "GravityAcceleration_Zaxis_Mean","GravityAcceleration_Xaxis_St.Dev","GravityAcceleration_Yaxis_Std.Dev",
                "GravityAcceleration_Zaxis_Std.Dev","BodyAccelerationJerk_Xaxis_Mean","BodyAccelerationJerk_Yaxis_Mean",
                "BodyAccelerationJerk_Zaxis_Mean","BodyAccelerationJerk_Xaxis_St.Dev","BodyAccelerationJerk_Yaxis_Std.Dev",
                "BodyAccelerationJerk_Zaxis_Std.Dev","BodyGyroscope_Xaxis_Mean","BodyGyroscope_Yaxis_Mean",
                "BodyGyroscope_Zaxis_Mean","BodyGyroscope_Xaxis_St.Dev","BodyGyroscope_Yaxis_Std.Dev",
                "BodyGyroscope_Zaxis_Std.Dev","BodyGyroscopeJerk_Xaxis_Mean","BodyGyroscopeJerk_Yaxis_Mean",
                "BodyGyroscopeJerk_Zaxis_Mean","BodyGyroscopeJerk_Xaxis_St.Dev","BodyGyroscopeJerk_Yaxis_Std.Dev",
                "BodyGyroscopeJerk_Zaxis_Std.Dev","BodyAccelerationMagnitude_Mean","BodyAccelerationMagnitude_Std",
                "GravityAccelerationMagnitude_Mean","GravityAccelerationMagnitude_Std","BodyAccelerationJerkMagnitude_Mean",
                "BodyAccelerationJerkMagnitude_Std","BodyGyroscopeMagnitude_Mean","BodyGyrocopeMagnitude_Std",
                "BodyGyroscopeJerkMagnitude_Mean","BodyGyrocopeJerkMagnitude_Std","fft_BodyAcceleration_Xaxis_Mean",
                "fft_BodyAcceleration_Yaxis_Mean","fft_BodyAcceleration_Zaxis_Mean","fft_BodyAcceleration_Xaxis_St.Dev",
                "fft_BodyAcceleration_Yaxis_Std.Dev","fft_BodyAcceleration_Zaxis_Std.Dev",
                "fft_BodyAcceleration_Xaxis_MeanFrequency","fft_BodyAcceleration_Yaxis_MeanFrequency",
                "fft_BodyAcceleration_Zaxis_MeanFrequency","fft_BodyAccelerationJerk_Xaxis_Mean",
                "fft_BodyAccelerationJerk_Yaxis_Mean","fft_BodyAccelerationJerk_Zaxis_Mean",
                "fft_BodyAccelerationJerk_Xaxis_St.Dev","fft_BodyAccelerationJerk_Yaxis_Std.Dev",
                "fft_BodyAccelerationJerk_Zaxis_Std.Dev","fft_BodyAccelerationJerk_Xaxis_MeanFrequency",
                "fft_BodyAccelerationJerk_Yaxis_MeanFrequency","fft_BodyAccelerationJerk_Zaxis_MeanFrequency",
                "fft_BodyGyroscope_Xaxis_Mean","fft_BodyGyroscope_Yaxis_Mean","fft_BodyGyroscope_Zaxis_Mean",
                "fft_BodyGyroscope_Xaxis_St.Dev","fft_BodyGyroscope_Yaxis_Std.Dev","fft_BodyGyroscope_Zaxis_Std.Dev",
                "fft_BodyGyroscope_Xaxis_MeanFrequency","fft_BodyGyroscope_Yaxis_MeanFrequency",
                "fft_BodyGyroscope_Zaxis_MeanFrequency","fft_BodyAccelerationMagnitude_Mean",
                "fft_BodyAccelerationMagnitude_Std","fft_BodyAccelerationMagnitude_MeanFrequency",
                "fft_BodyAccelerationJerkMagnitude_Mean","fft_BodyAccelerationJerkMagnitude_Std",
                "fft_BodyAccelerationJerkMagnitude_MeanFrequency","fft_BodyGyroscopeMagnitude_Mean",
                "fft_BodyGyrocopeMagnitude_Std","fft_BodyGyroscopeMagnitude_MeanFrequency",
                "fft_BodyGyroscopeJerkMagnitude_Mean","fft_BodyGyrocopeJerkMagnitude_Std",
                "fft_BodyGyroscopeJerkMagnitude_MeanFrequency")
dataSummary1<-dataSummary
colnames(dataSummary1)<-newVarNames1

#
subjects<-unique(dataSummary$Subject)
activity<-levels(dataSummary$Activity)
measurement<-newVarNames[-c(1,2)]

nextSummary<-data.frame()

for (i in subjects) {
  tmp<-dataSummary[dataSummary$Subject==i,]
  for (j in activity) {
    tmp1<-tmp[tmp$Activity==j,]
    smSummary<-lapply(tmp1[,3:81],mean)
    nextSummary<-rbind(nextSummary,smSummary)
  }
}
row.names(nextSummary)<-NULL
nextSummary<-cbind(rep(subjects,each=6),rep(activity,times=30),nextSummary)
colnames(nextSummary)[c(1,2)]<-c("Subject","Activity")
