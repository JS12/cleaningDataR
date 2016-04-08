1. import libraries plyr, dplyr
2. read activity names from "activity_labels.txt" (activityLabels)
3. read variable names from "features.txt" (featureNames)
4. transform variable names to vector for using as column names (variableNames)
5. read label data for train and test sample. Column name is activityId, variable is trainLabel for train data and testLabel for test data
6. read subject data for train and test sample. Column name is subjectId, variable is trainSubject for train data and testSubject for test data
7. read train and test measurment. Read all data from fixed width data file (width=16, number of variables=561)
8. Extracts only the measurements on the mean and standard deviation for each measurement. Mean are identified by feature containing string "mean()" in feature name. Standard deviation are identified by feature containing string "std()" in feature name. Names are extracting from featureNames variable. Output variables are testSet and trainSet
9. join subject, activity names and data set in trainData (testData). data frame contains subject in subjectId column, activity name from activityLabels in column activityName and all measurement from original files.
10. all rows from test and train data sets are unified in one data frame  named allData
11. group allData by subjectId, activityName and compute mean of each group and feature (finalSet)
12. write finalSet to file named finalSet.txt
