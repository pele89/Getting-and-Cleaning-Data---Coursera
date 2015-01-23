tidy_data<- function(){
	library(dplyr)

##reading varible names for the data set
	names.table<-read.table("features.txt")
	names<-as.character(names.table[,2])
	names<-make.names(names,unique=TRUE)

##reading the test data	
	table.x<-read.table("test\\X_test.txt")
	colnames(table.x)<-names
##converting to the tbl format for use with dplyr commands
	table.x<-tbl_df(table.x)
##extracting mean and std variables from the test dataset
	x.means<-select(table.x,contains("mean"))
	x.std<-select(table.x,contains("std"))
##combinig mean and std variables in one dataset
	x.tidy<-cbind(x.means,x.std)

##loading activity set and recoding it based on the provided labels
	activity.x<-read.table("test\\y_test.txt")
	colnames(activity.x)<-"Activity"
	activity.x[activity.x==1]<-"WALKING"
	activity.x[activity.x==2]<-"WALKING_UPSTAIRS"
	activity.x[activity.x==3]<-"WALKING_DOWNSTAIRS"
	activity.x[activity.x==4]<-"SITTING"
	activity.x[activity.x==5]<-"STANDING"
	activity.x[activity.x==6]<-"LAYING"

##loading subjects file
	subj.x<-read.table("test/subject_test.txt")
	colnames(subj.x)<-"Subject"

##Combinig Subject, Activity and Measurement Dataset into one 

	x.tidy<- cbind (activity.x,x.tidy)
	x.tidy<-cbind (subj.x,x.tidy)



##reading the train data
	table.y<-read.table("train\\X_train.txt")
	colnames(table.y)<-names
##converting to the tbl format for use with dplyr commands
	table.y<-tbl_df(table.y)
##extracting mean and std variables from the test dataset
	y.means<-select(table.y,contains("mean"))
	y.std<-select(table.y,contains("std"))
##combinig mean and std variables in one dataset
	y.tidy<-cbind(y.means,y.std)

##loading activity set and recoding it based on the provided labels
	activity.y<-read.table("train\\y_train.txt")
	colnames(activity.y)<-"Activity"
	activity.y[activity.y==1]<-"WALKING"
	activity.y[activity.y==2]<-"WALKING_UPSTAIRS"
	activity.y[activity.y==3]<-"WALKING_DOWNSTAIRS"
	activity.y[activity.y==4]<-"SITTING"
	activity.y[activity.y==5]<-"STANDING"
	activity.y[activity.y==6]<-"LAYING"

##loading subjects file
	subj.y<-read.table("train/subject_train.txt")
	colnames(subj.y)<-"Subject"

##Combinig Subject, Activity and Measurement Dataset into one
	y.tidy<- cbind (activity.y,y.tidy)
	y.tidy<- cbind(subj.y,y.tidy)

##Combining test and train Datasets
	combined<-rbind(x.tidy,y.tidy)

##Converting combined Dataset to tbl format	
	combined<-tbl_df(combined)

##Builidng a new Dataset with means of all the variables for each Subject in all Activities
	combined<-group_by(combined,Subject,Activity)%>%summarise_each(funs(mean),-(Subject:Activity))


}
