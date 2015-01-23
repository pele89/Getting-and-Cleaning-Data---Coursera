# Getting-and-Cleaning-Data---Coursera
Course Project for Getting and Cleaning Data

This script takes the inital data avaliable from the following web adress http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones and provides the user with the tidy dataset of means of variables.
Measured variables were collected with wearable techology, this script only does the cleaning for the Means and Standarrd Deviation of the measured variables (e.g. it does not provide the user with Min or Max for the variables).

Detailed description:
1. loads in the dplyr library
2. loads in the table with the variable names
3. loads test data
4. Extracts only Mean and Standard Deviation variables from this data set
5. Adds labeled Activity variable and Subject variable to the dataset
6. Loads train data and repeats steps 4. and 5. with this dataset
7. Combines train and test datasets into one
8. Creates a new Dataset with the calculated means for each variable for each Subject and each Activity

Script assumes that its working directory is the root directory of both test and train data.
