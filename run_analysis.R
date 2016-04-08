library(plyr); library(dplyr)
##read activity names
activityLabels <- tbl_df(read.csv("activity_labels.txt", header = F, sep = " ",stringsAsFactors = F, col.names = c("activityId","activityName")))
##read column names
featureNames <- tbl_df(read.csv("features.txt", header = F, sep = " ", col.names = c("columnId","featureName")))
##names of variables as vector
variableNames <- unlist(featureNames$featureName)
##rread label data for train and test sample
testLabel <- tbl_df(read.csv("y_test.txt", header = F, col.names = "activityId"))
trainLabel <- tbl_df(read.csv("y_train.txt", header = F, col.names = "activityId"))
##read subject data for train and test sample
testSubject <- tbl_df(read.csv("subject_test.txt", header = F, col.names = "subjectId"))
trainSubject <- tbl_df(read.csv("subject_train.txt", header = F, col.names = "subjectId"))
##all data for test data
testSet <- tbl_df(read.fwf("X_test.txt",widths = rep(16, 561)))
##only mean and standard deviation (contains string mean() or std())
testSet <- testSet[,grep("[s][t][d][()][)]|[m][e][a][n][()][)]",variableNames,value = F)]
##all data for train set
trainSet <- tbl_df(read.fwf("X_train.txt",widths = rep(16, 561)))
##only mean and standard deviation (contains string mean() or std())
trainSet <- trainSet[,grep("[s][t][d][()][)]|[m][e][a][n][()][)]",variableNames,value = F)]
##add colnames to datasets
variableNames <- grep("[s][t][d][()][)]|[m][e][a][n][()][)]",variableNames,value = T)
colnames(testSet) <- variableNames
colnames(trainSet) <- variableNames
##bind data together
testData <- bind_cols(testSubject, testLabel, testSet)
trainData <- bind_cols(trainSubject, trainLabel, trainSet)
##add activity names
testData <- inner_join(testData, activityLabels)
trainData <- inner_join(trainData, activityLabels)
allData <- rbind(testData,trainData)
##group by subject and activity
groupedAll <- group_by(allData,subjectId,activityName)
#get mean for each value
finalSet <- summarise_each(groupedAll,funs(mean))
##save 
write.table(finalSet,"finalSet.txt", row.names = F)
