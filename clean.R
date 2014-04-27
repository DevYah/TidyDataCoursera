library(reshape2)
features = read.table('UCI HAR Dataset/features.txt')
train = read.table('UCI HAR Dataset/train/X_train.txt', colClasses=c('numeric'))
test = read.table('UCI HAR Dataset/test/X_test.txt', colClasses=c('numeric'))

features=features[[2]]

# should i include stuff like  angle(tBodyAccMean,gravity)
meanStdFeatures = features[grep('(mean|std)', features)]

names(train) = features
names(test) = features


merged = rbind(train, test)
merged = merged[, as.character(meanStdFeatures)]

subjectTest = read.table('UCI HAR Dataset/test/subject_test.txt')
yTest = read.table('UCI HAR Dataset/test/y_test.txt')

subjectTrain = read.table('UCI HAR Dataset/train/subject_train.txt')
yTrain = read.table('UCI HAR Dataset/train/y_train.txt')


testOther = cbind(subjectTest, yTest)
names(testOther) = c('subject', 'y')

trainOther = cbind(subject=subjectTrain, y=yTrain)
names(trainOther) = c('subject', 'y')

allOther = rbind(trainOther, testOther)
merged[c('subject', 'y')] = allOther

activityNames = c('WALKING' , 'WALKING_UPSTAIRS', 'WALKING_DOWNSTAIRS', 'SITTING', 'STANDING', 'LAYING')

merged['y'] = factor(merged[,'y'], labels=activityNames)
merged['activity']  = merged['y']
merged['y']= NULL


vars = names(merged)[-c(ncol(merged), ncol(merged)-1)]

merged.m <- melt(merged, measure.vars=vars)


tidy.data = dcast(merged.m, vars ~ subject*activity, fun.aggregate=mean)



# should i include stuff like  angle(tBodyAccMean,gravity)
meanStdFeatures = features[grep('(mean|std)', features)]
meanStdDF = merged[, meanStdFeatures]
