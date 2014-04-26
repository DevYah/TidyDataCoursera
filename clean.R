features = read.table('UCI HAR Dataset/features.txt')
train = read.table('UCI HAR Dataset/train/X_train.txt', colClasses=c('numeric'))
test = read.table('UCI HAR Dataset/test/X_test.txt', colClasses=c('numeric'))

features=features[[1]]
names(train) = features
names(test) = features


merged = rbind(train, test)

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

WALKING            
WALKING_UPSTAIRS   
WALKING_DOWNSTAIRS 
SITTING            
STANDING           
LAYING             


# should i include stuff like  angle(tBodyAccMean,gravity)
meanStdFeatures = features[grep('(mean|std)', features)]
meanStdDF = merged[, meanStdFeatures]






