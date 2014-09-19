GCD_Courseproject
=================

Coursera Getting and Cleaning Data Course project


Data description
================
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones   


Data source
================
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip   


Script
==============
Run_analysis.R file downloads and extracts Data in local folder. The separeted data for training and testing groups are combined
to a total data set including each subject and the corresponding activity of the examination (see Data description for more information on the examination)
but only for measures mean() and standard deviation std()
Furthemore a tidy data set is created from the total data set containing the aggregated mean by each person and activity using the
aggregate() function.
In a last step the tidy data is saved as a separate text file tidy_data.txt
