
#Acquiring the data files and unzipping
setwd("C:/JHUDataSciGetCleanProject")
webadd<-"https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
den<-"./acc_data.zip"
download.file(webadd,den,mode="wb")
unzip("acc_data.zip",exdir="." ) #explicit to show default "exdir"
setwd("./UCI HAR Dataset")

#extracting the data into variables
setwd("./train")
train_set<-read.table("X_train.txt")
train_actions<-read.table("y_train.txt")
train_subjects<-read.table("subject_train.txt")
setwd("../test")
test_set<-read.table("X_test.txt") 
test_actions<-read.table("y_test.txt")
test_subjects<-read.table("subject_test.txt")



#appending the  'train' and 'test' sets together
full_set<-rbind(train_set,test_set) 
full_actions<-rbind(train_actions,test_actions)
full_subjects<-rbind(train_subjects,test_subjects)


#Replacing numeric actions tags with descriptive action titles
setwd("../")
action_list<-as.list(read.table("activity_labels.txt")[,2])
for (mark in 1:6) {
full_actions[,1]<-gsub(mark,action_list[[mark]],full_actions[,1])
}
rm(action_list,mark)

#Selecting only columns with mean or standard deviation, delete variables to save memory
rm(test_actions,test_set,test_subjects,train_actions,train_set,train_subjects)
features<-read.table("features.txt")
mean_std_features_index<-grep("mean|std",features[,2])
mean_std_features<-features[grep("mean|std",features[,2]),2] 
mean_std_full_set<-full_set[,mean_std_features_index]
rm(full_set)
rm(features,mean_std_features_index)



#Combining subject number, action descriptions, and accelerometer/gyroscope data
full_actions_names<-full_actions[,1];rm(full_actions) #change name to show numbers now replaced
full_subjects<-full_subjects[,1] #change data.frame into vector for easier combination
subject_action_mean_std_full<-cbind(full_subjects,full_actions_names,mean_std_full_set)
rm(full_actions_names,full_subjects,mean_std_full_set)
mean_std_names_features<-c("participant_index","action", mean_std_features)
colnames(subject_action_mean_std_full)<-mean_std_names_features
rm(mean_std_names_features,mean_std_features)

#Creating a new table with the average of all variables for all 
avg_table<-subject_action_mean_std_full%>%group_by_at(vars('participant_index',action))%>%
summarize_all(mean)
names(avg_table)<-sub("\\(\\)","",names(avg_table))
names(avg_table)<-gsub("-","_",names(avg_table))
names(avg_table)<-gsub("BodyBody","Body",names(avg_table))
setwd('..')
write.table(avg_table,'BodyMotionData.txt', row.names=F)
