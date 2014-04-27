
The data is expected to be in a folder called 'UCI HAR Dataset' unzipped

Table reading was done normally, with classes of ```numeric``` for all columns

Features vector was read, only the second column was saved

column names for both test and train sets were renamed to Features

row-based merging was done for train and test

Subsetting was performed to get columns with mean or std, this was done by grepping ```(mean|std)```

Subject and activity (y) were read respectivty for both train and test sets. y columns were renamed to activity

There are only 6 activityNames, they were hard-coded (but could have been easily read like features)

Reshaping to get the tidy data was done using reshape2 package
