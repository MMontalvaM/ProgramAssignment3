#This script does:
#- Merges the training and the test sets to create one data set.
#- Extracts only the measurements on the mean and standard deviation for each 
#     measurement. 
#- Uses descriptive activity names to name the activities in the data set
#- Appropriately labels the data set with descriptive variable names. 
#- From the data set in step 4, creates a second, independent tidy data set
#     with the average of each variable for each activity and each subject.

#0.- Previous steps:
#0.1.- Set working directory
wd<-"C:/Users/mmont/OneDrive/Documents/R/Codigos/Ciencia Datos/03 - Getting and Cleaning Data/Project"
setwd(wd)
#0.2.- Download data
# urldir<-"https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
# download.file(urldir,destfile = "projectdata.zip")
# #0.3.- Unzip data
# unzip("projectdata.zip")
#0.4.- Loading data
#0.4.1.- Loading general data
activity_labels<-read.delim("UCI HAR Dataset/activity_labels.txt",
                             header = FALSE,
                             sep=" ")
#0.4.2.- Loading test data
list_test<-list(read.table("UCI HAR Dataset/test/subject_test.txt",
                            header = FALSE),
                read.table("UCI HAR Dataset/test/Y_test.txt",
                                   header = FALSE),
                 read.table("UCI HAR Dataset/test/Inertial Signals/body_acc_x_test.txt",
                            header = FALSE,),
                 read.table("UCI HAR Dataset/test/Inertial Signals/body_acc_y_test.txt",
                            header = FALSE),
                 read.table("UCI HAR Dataset/test/Inertial Signals/body_acc_z_test.txt",
                            header = FALSE),
                 read.table("UCI HAR Dataset/test/Inertial Signals/body_gyro_x_test.txt",
                             header = FALSE),
                 read.table("UCI HAR Dataset/test/Inertial Signals/body_gyro_y_test.txt",
                             header = FALSE),
                 read.table("UCI HAR Dataset/test/Inertial Signals/body_gyro_z_test.txt",
                             header = FALSE),
                 read.table("UCI HAR Dataset/test/Inertial Signals/total_acc_x_test.txt",
                             header = FALSE),
                 read.table("UCI HAR Dataset/test/Inertial Signals/total_acc_y_test.txt",
                             header = FALSE),
                 read.table("UCI HAR Dataset/test/Inertial Signals/total_acc_z_test.txt",
                             header = FALSE),
                 read.table("UCI HAR Dataset/test/X_test.txt",
                   header = FALSE))

#0.4.3.- Creating ID for test data
#ID is composed by 3 identifications in the form: AA-B-CCC.
# AA is a 2 digits integer that represents the ID of the subject
# B is a 1 digit integer that represents the activity, acording to the activity label
# CCC is a 3 digits correlative integer that represents each observation.

# ID_test<-

#0.4.4.- Naming test list
names(list_test)<-c("Subject",
                    "Activity",
                    "BodyAccelerationX",
                    "BodyAccelerationY",
                    "BodyAccelerationZ",
                    "BodyGyroscopeX",
                    "BodyGyroscopeY",
                    "BodyGyroscopeZ",
                    "TotalAccelerationX",
                    "TotalAccelerationY",
                    "TotalAccelerationZ",
                    "Set")

#0.4.4.- Loading train data
list_train<-list(read.table("UCI HAR Dataset/train/subject_train.txt",
                            header = FALSE),
                 read.table("UCI HAR Dataset/train/Y_train.txt",
                                   header = FALSE),
                 read.table("UCI HAR Dataset/train/Inertial Signals/body_acc_x_train.txt",
                            header = FALSE,),
                 read.table("UCI HAR Dataset/train/Inertial Signals/body_acc_y_train.txt",
                            header = FALSE),
                 read.table("UCI HAR Dataset/train/Inertial Signals/body_acc_z_train.txt",
                            header = FALSE),
                 read.table("UCI HAR Dataset/train/Inertial Signals/body_gyro_x_train.txt",
                            header = FALSE),
                 read.table("UCI HAR Dataset/train/Inertial Signals/body_gyro_y_train.txt",
                            header = FALSE),
                 read.table("UCI HAR Dataset/train/Inertial Signals/body_gyro_z_train.txt",
                            header = FALSE),
                 read.table("UCI HAR Dataset/train/Inertial Signals/total_acc_x_train.txt",
                            header = FALSE),
                 read.table("UCI HAR Dataset/train/Inertial Signals/total_acc_y_train.txt",
                            header = FALSE),
                 read.table("UCI HAR Dataset/train/Inertial Signals/total_acc_z_train.txt",
                            header = FALSE),
                 read.table("UCI HAR Dataset/train/X_train.txt",
                            header = FALSE))

names(list_train)<-c("Subject",
                     "Activity",
                     "BodyAccelerationX",
                     "BodyAccelerationY",
                     "BodyAccelerationZ",
                     "BodyGyroscopeX",
                     "BodyGyroscopeY",
                     "BodyGyroscopeZ",
                     "TotalAccelerationX",
                     "TotalAccelerationY",
                     "TotalAccelerationZ",
                     "Set")

#1.- Calculating means and standard deviation for each measurement
#1.1.- Setting new variables
list_train_mean<-list_train[3:12]
list_test_mean<-list_test[3:12]
list_train_sd<-list_train[3:12]
list_test_sd<-list_test[3:12]
names_train_mean<-rep("A",10)
names_test_mean<-rep("A",10)
names_train_sd<-rep("A",10)
names_test_sd<-rep("A",10)

#1.2.- Calculating means, standard deviation and setting names for each variable
for (i in 3:length(list_train)){
  list_train_mean[i-2]<-as.data.frame(sapply(as.data.frame(t(as.data.frame(list_train[i]))),mean))
  list_test_mean[i-2]<-as.data.frame(sapply(as.data.frame(t(as.data.frame(list_test[i]))),mean))
  list_train_sd[i-2]<-as.data.frame(sapply(as.data.frame(t(as.data.frame(list_train[i]))),sd))
  list_test_sd[i-2]<-as.data.frame(sapply(as.data.frame(t(as.data.frame(list_test[i]))),sd))
  names_train_mean[i-2]<-paste0(names(list_train[i]),"Mean")
  names_test_mean[i-2]<-paste0(names(list_test[i]),"Mean")
  names_train_sd[i-2]<-paste0(names(list_train[i]),"SD")
  names_test_sd[i-2]<-paste0(names(list_test[i]),"SD")
}


#2.- Merging
#2.1.- Merging train data and setting colnames
df_train<-cbind.data.frame(c(list_train$Subject,
                             list_train$Activity,
                             list_train_mean,
                             list_train_sd))
colnames(df_train)<-c("Subject",
                      "Activity",
                      names_train_mean,
                      names_train_sd)

#2.2.- Merging test data and setting colnames
df_test<-cbind.data.frame(c(list_test$Subject,
                            list_test$Activity,
                            list_test_mean,
                            list_test_sd))
colnames(df_test)<-c("Subject",
                     "Activity",
                     names_test_mean,
                     names_test_sd)

#2.3.- Merging train and test data
Observations<-merge(df_test,df_train,all=TRUE)

#2.4.- Setting descriptive activity names to name the activities data set
Observations$Activity<-factor(Observations$Activity,
                              levels = activity_labels[,1],
                              labels = activity_labels[,2])

#2.4.- Clearing environment
rm(df_test,
   df_train,
   list_test_mean,
   list_test_sd,
   list_train_mean,
   list_train_sd,
   list_test,
   list_train,
   i,
   names_test_mean,
   names_test_sd,
   names_train_mean,
   names_train_sd,
   wd,
   activity_labels)

#4.- Creating a data set with the average of each variable for each activity
# and each subject.
#4.1.-Creating an ID
dfTemp<-mutate(Observations[,1:12],
                      ID=paste0(Subject,"-",Activity),
                      .before = Subject)
dfTemp$ID<-as.factor(dfTemp$ID)

#4.2.- Setting ID's [,1], Subjects [,2] and Activities [,3] in 
#       ObservationsSummary table
ObservationsSummary<-dfTemp[1:length(levels(dfTemp$ID)),] #Creating

dfTemp2<-as.data.frame(tapply(dfTemp[,4],dfTemp[,1],mean))
ObservationsSummary[,1]<-rownames(dfTemp2)

namesObservations<-strsplit(ObservationsSummary[,1],"-")

firstElement<-function(x){x[1]}
secondElement<-function(x){x[2]}

ObservationsSummary[,2]<-sapply(namesObservations,firstElement)
ObservationsSummary[,3]<-sapply(namesObservations,secondElement)

#4.3.- Obtaining averages by ID
for (i in 4:ncol(dfTemp)){
  ObservationsSummary[,i]<-tapply(dfTemp[,i],dfTemp[,1],mean)
}

#4.3.- Clearing environment
rm(dfTemp,
   dfTemp2,
   namesObservations,
   firstElement,
   secondElement,
   i)

#5.- Writing txt's
write.table(ObservationsSummary, file="Observations.txt",row.name=FALSE)
write.table(ObservationsSummary, file="ObservationsSummary.txt",row.name=FALSE)

#end