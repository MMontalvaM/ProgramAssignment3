# ProgramAssignment3
Getting and Cleaning Data Course Project

This script does:
- Merges the training and the test sets to create one data set.
- Extracts only the measurements on the mean and standard deviation for each measurement. 
- Uses descriptive activity names to name the activities in the data set
- Appropriately labels the data set with descriptive variable names. 
- From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

Chapter 0.- Previous steps: The working directory is setted, the data downloaded and unzipped. Later, the raw data is loaded in R in 2 lists and one dataframe. The lists are for the test and train datas and the dataframe for the activity labels. Each element of each list is a dataframe with the raw datas. Finally, names are given to the test and train lists. The subchapters are:
      0.1.- Set working directory
      0.2.- Download data
      0.3.- Unzip data
      0.4.- Loading data
      0.4.1.- Loading general data
      0.4.2.- Loading test data
      0.4.3.- Loading train data
      0.5.- Naming lists

Chapter 1.- Calculating means and standard deviation for each measurement: This is a mid-step to reach a tidy data. Temporal data is created to manipulate the raw data. Means, standard deviation are calculated and setted in 4 different lists: one list with the means of each measurement of the test data, one list with the standard deviation of each measurement of the test data, one list with the means of each measurement of the train data and the last list with the standard deviation of each measurement of the train data. Finally, names are given for each dataset. Each list has this elements:
-Subject: ID of the subject
-Activity: Name of the activity: 
-BodyAccelerationXMean or BodyAccelerationXSD: Mean or standard deviation of the body acceleration X axis observation
-BodyAccelerationYMean or BodyAccelerationYSD: Mean or standard deviation of the body acceleration Y axis observation
-BodyAccelerationZMean or BodyAccelerationZSD: Mean or standard deviation of the body acceleration Z axis observation
-BodyGyroscopeXMean or BodyGyroscopeXSD:  Mean or standard deviation of the body gyroscope X axis observation
-BodyGyroscopeYMean or BodyGyroscopeYSDn:  Mean or standard deviation of the body gyroscope Y axis observation
-BodyGyroscopeZMean or BodyGyroscopeZSD:  Mean or standard deviation of the body gyroscope Z axis observation
-TotalAccelerationXMean or TotalAccelerationXSD:  Mean or standard deviation of the total acceleration X axis observation
-TotalAccelerationYMean or TotalAccelerationYSD:  Mean or standard deviation of the total acceleration Y axis observation
-TotalAccelerationZMean or TotalAccelerationZSD:  Mean or standard deviation of the total acceleration Z axis observation
-SetMean or SetSD:  Mean or standard deviation of the set observation
The subchapters are:
      1.1.- Setting new variables
      1.2.- Calculating means, standard deviation and setting names for each variable

Chapter 2.- Merging: Here the tidy data is created. First, the train data of both lists (mean and standard deviation) created in the previous chapter are merged by Subject and Activity. Second, the test data of both lists (mean and standard deviation) created in the previous chapter are merged by Subject and Activity, too. Third, train and test data are merged in only one tidy data set named Obseervations. Fourth, descriptive activity names are gived in Observations. Finally, the enviroment is cleared for temporal data. The subchapters are:
      2.1.- Merging train data and setting colnames
      2.2.- Merging test data and setting colnames
      2.3.- Merging train and test data
      2.4.- Setting descriptive activity names to name the activities data set
      2.4.- Clearing environment

Chapter 3.- Creating a data set with the average of each variable for each activity and each subject:  Here the summarized tidy data is created and will be named ObservationsSummary. First, an ID is created to group the observations. The ID is a character string with the form AA-BBBBBB, where:
      - AA: 2 digit integer. Is the Subject ID.
      - BBBBBB: character string. Is the activity name
Second, the ObservationsSummary dimensions are setted: [number of ID's, number of Means + 3] (+3 are the next columns: ID, Subject and Activity). Third, the means by ID are calculated and setted in the ObservationsSummary dataframe. Finally, the enviroment is cleared for temporal data. The subchapters are:
      3.1.- Creating an ID
      3.2.- Setting ID's [,1], Subjects [,2] and Activities [,3] in ObservationsSummary table
      3.3.- Obtaining averages by ID
      3.3.- Clearing environment

Chapter 4.- Writing txt's: txt archives are created.
      write.table(ObservationsSummary, file="Observations.txt",row.name=FALSE)
      write.table(ObservationsSummary, file="ObservationsSummary.txt",row.name=FALSE)

Variables:
- wd: Working directory. String of characters.
- list_test, list_train: list with the 12 raw test/train dataframes loaded with the command read.table. The elements are:
      -Subject: ID of the subject
      -Activity: Name of the activity 
      -BodyAccelerationX: Body acceleration X axis observation
      -BodyAccelerationY: Body acceleration Y axis observation
      -BodyAccelerationZ: Body acceleration Z axis observation
      -BodyGyroscopeX: Body gyroscope X axis observation
      -BodyGyroscopeY: Body gyroscope Y axis observation
      -BodyGyroscopeZ: Body gyroscope Z axis observation
      -TotalAccelerationX: Total acceleration X axis observation
      -TotalAccelerationY: Total acceleration Y axis observation
      -TotalAccelerationZ: Total acceleration Z axis observation
      -Set: Set observation
- list_test_mean, list_test_sd, list_train_mean, list_train_sd: list with the 12 raw test/train dataframes with the mean/standard deviation of each measurent calculated. The elements are:
      -Subject: ID of the subject
      -Activity: Name of the activity.
      -BodyAccelerationXMean or BodyAccelerationXSD: Mean or standard deviation of the body acceleration X axis observation
      -BodyAccelerationYMean or BodyAccelerationYSD: Mean or standard deviation of the body acceleration Y axis observation
      -BodyAccelerationZMean or BodyAccelerationZSD: Mean or standard deviation of the body acceleration Z axis observation
      -BodyGyroscopeXMean or BodyGyroscopeXSD:  Mean or standard deviation of the body gyroscope X axis observation
      -BodyGyroscopeYMean or BodyGyroscopeYSDn:  Mean or standard deviation of the body gyroscope Y axis observation
      -BodyGyroscopeZMean or BodyGyroscopeZSD:  Mean or standard deviation of the body gyroscope Z axis observation
      -TotalAccelerationXMean or TotalAccelerationXSD:  Mean or standard deviation of the total acceleration X axis observation
      -TotalAccelerationYMean or TotalAccelerationYSD:  Mean or standard deviation of the total acceleration Y axis observation
      -TotalAccelerationZMean or TotalAccelerationZSD:  Mean or standard deviation of the total acceleration Z axis observation
      -SetMean or SetSD:  Mean or standard deviation of the set observation
- df_test, df_train: Dataframes with the test/train tidy data. It contains all the information of the list before.
- names_test_mean, names_test_sd, names_train_mean, names_train_sd, namesObservation: Temporal vectors/lists with the names of the elements/columns of the raw/pre-processed/tidy data.
- activity_labels: dataframe with the levels and labels of the activities.
- Observations: Tidy dataframe. The elements are:
      -Subject: ID of the subject
      -Activity: Name of the activity.
      -BodyAccelerationXMean/BodyAccelerationXSD: Mean/standard deviation of the body acceleration X axis observation
      -BodyAccelerationYMean/BodyAccelerationYSD: Mean/standard deviation of the body acceleration Y axis observation
      -BodyAccelerationZMean/BodyAccelerationZSD: Mean/standard deviation of the body acceleration Z axis observation
      -BodyGyroscopeXMean/BodyGyroscopeXSD:  Mean/standard deviation of the body gyroscope X axis observation
      -BodyGyroscopeYMean/BodyGyroscopeYSDn:  Mean/standard deviation of the body gyroscope Y axis observation
      -BodyGyroscopeZMean/BodyGyroscopeZSD:  Mean/standard deviation of the body gyroscope Z axis observation
      -TotalAccelerationXMean/TotalAccelerationXSD:  Mean/standard deviation of the total acceleration X axis observation
      -TotalAccelerationYMean/TotalAccelerationYSD:  Mean/standard deviation of the total acceleration Y axis observation
      -TotalAccelerationZMean/TotalAccelerationZSD:  Mean/standard deviation of the total acceleration Z axis observation
      -SetMean/SetSD:  Mean/standard deviation of the set observation
- ObservationsSummary: Tidy dataframe. The elements are:
      -ID: Character string with the form AA-BBBBBB, where:
            - AA: 2 digit integer. Is the Subject ID.
            - BBBBBB: character string. Is the activity name
      -Subject: ID of the subject
      -Activity: Name of the activity.
      -BodyAccelerationXMean: Mean of the body acceleration X axis observation for each subject and activity
      -BodyAccelerationYMean: Mean of the body acceleration Y axis observation for each subject and activity
      -BodyAccelerationZMean: Mean of the body acceleration Z axis observation for each subject and activity
      -BodyGyroscopeXMean:  Mean of the body gyroscope X axis observation for each subject and activity
      -BodyGyroscopeYMean:  Mean of the body gyroscope Y axis observation for each subject and activity
      -BodyGyroscopeZMean:  Mean of the body gyroscope Z axis observation for each subject and activity
      -TotalAccelerationXMean:  Mean of the total acceleration X axis observation for each subject and activity
      -TotalAccelerationYMean:  Mean of the total acceleration Y axis observation for each subject and activity
      -TotalAccelerationZMean:  Mean of the total acceleration Z axis observation for each subject and activity
      -SetMean:  Mean of the set observation for each subject and activity



