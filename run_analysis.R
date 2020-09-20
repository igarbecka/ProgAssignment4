# load train data
x_train <- read.table("X_train.txt", header = FALSE)
y_train <- read.table("y_train.txt", header = FALSE)
subject_train <- read.table("subject_train.txt", header = FALSE)

# load test data
x_test <- read.table("X_test.txt", header = FALSE)
y_test <- read.table("y_test.txt", header = FALSE)
subject_test <- read.table("subject_test.txt", header = FALSE)

# concentrate data by rows
x_data <- rbind(x_train, x_test)
y_data <- rbind(y_train, y_test)
subject_data <- rbind(subject_train, subject_test)

# add names to variables
names(subject_data) <- c("subject")
names(y_data) <- c("activity")
features <- read.table("features.txt", header = FALSE)
names(x_data) <- features$V2

# merge columns to create one data set (STEP 1)
dataMerged <- cbind(subject_data, y_data)
dataSet <- cbind(dataMerged, x_data)

# filter required features
requiredFeatures <- features$V2[grep("mean\\(\\)|std\\(\\)", features$V2)]

# subset data frame by selected features (STEP 2)
names <- c("subject", "activity", as.character(requiredFeatures))
dataSubset <- subset(dataSet, select = names)

# load activity labels
activities <- read.table("activity_labels.txt", header = FALSE)

# update activity names (STEP 3)
dataSubset[, 2] <- activities[dataSubset[, 2], 2]

# label data set with descriptive variable names (STEP 4)
names(dataSubset)<-gsub("^t", "time", names(dataSubset))
names(dataSubset)<-gsub("^f", "frequency", names(dataSubset))
names(dataSubset)<-gsub("Acc", "Accelerometer", names(dataSubset))
names(dataSubset)<-gsub("Gyro", "Gyroscope", names(dataSubset))
names(dataSubset)<-gsub("Mag", "Magnitude", names(dataSubset))
names(dataSubset)<-gsub("BodyBody", "Body", names(dataSubset))

# melt data to get a unique row for each combination of subject and activities
library(reshape2)
dataMelt <- melt(dataSubset, id = c('subject', 'activity'))

# cast data getting mean values
dataFinal <- dcast(dataMelt, subject + activity ~ variable, mean)

# print data to a file (STEP 5)
write.table(dataFinal, file = file.path("tidydataset.txt"), row.names = FALSE, quote = FALSE)

# produce codebook
library(knitr)
knit2html("codebook.md")
