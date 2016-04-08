# Getting and cleaning gyro data
## Input files
- 'features.txt': List of all features.
- 'activity_labels.txt': Links the class labels with their activity name.
- 'X_train.txt': Training set.
- 'y_train.txt': Training labels.
- 'subject_train.txt': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30. 
- 'X_test.txt': Test set.
- 'y_test.txt': Test labels.
- 'subject_test.txt': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30. 
## Output file
- finalSet.txt: file generated in R with write.table() using row.name=FALSE. Each column is average of each variable for each activity and each subject. Measurements are only mean and standard deviation from original measurements (names of feature contains string mean() or std()).
## Transformations
Files must be in working directory. In R run command source("run_analysis.R"). Script read, merge, transform data and generate file finalSet.txt in wokring direcotry.  All steps of transformations are described in file CodeBook.md.
