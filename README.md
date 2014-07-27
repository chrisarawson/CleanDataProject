Getting and Cleaning Data Course Project
========================================

Christopher Rawson  
Curtin University  
Western Australia  
c.rawson@curtin.edu.au


This Repository contains the project assignment for the Getting and Cleaning Data course run through Coursera by Johns Hopkins University. Thanks to Jeff and the TAs (particularly David Hood) for the course and the feedback through the discussion boards.

Interpretation and Approach
========================================
My interpretation of the assignment was to write an R script that produced two tidy datasets:

###Steps 1-4: 
####Tidy Data Set containing all columns that are a mean or standard deviation of a measurement
 
The first dataset produced by run_analysis.R in this repo is called ```dataSummary```. The script performs the following steps:

1. Adds new elements called "Subject" and "Activity" to a table ('''features''')read from "features.txt"
2. Combines the 2 test sets (X and Y) and the subject identifiers (read from subject_test.txt)
3. Combines the 2 training sets (X and Y) and the subject identifiers (read from subject_train.txt)
4. Adds the training sets below the test set in a single dataset ('''allData''')
5. Adds factor and variable names from ```features```
6. Re-lables the levels of the factor column "Activity" as per the designation in activity_labels.txt (but doesn't read that file).
7. Subsets ```allData``` using regular expression ```grepl``` into ```dataSummary```
8. Re-names the variables in ```dataSummary``` with readable names.
  * Note that I first did this using a local file ("codebook.csv") but wasn't sure how this would work with Github so re-wrote defining ```newVarNames``` as a silly long vector with each of the new variable names

So the dataset ```dataSummary``` is a tidy dataset 

* There are no missing data
* Each column has a unique variable name
* Each variable name is readable with reference to "codebook.txt"
* Each column is a variable containing one type of data
* Each individual observation is represented on a single row 

###Step 5: 
####Tidy Data Set that summarises the previous dataset by subject and activity

The second dataset produced by run_analysis.R in this repo is called ```summaryBySubject```. The script performs the following steps:

1. Defines a vector ```subjects``` which contains a single element for each unit (calls ```unique```)
2. Defines a vector ```activity``` which contains each level of the factor "Activity (calls ```levels```)
3. Calls an embedded ```for``` loop that subsets ```dataSummary``` by a subject and then calls ```lapply``` for each activity and adds the result as a row of a new ```data.frame``` called ```summaryBySubject```
4. Creates columns in ```summaryBySubject``` for the "Subject" and "Activity"

So the dataset ```summaryBySubject``` is a tidy dataset - 
* There are no missing data
* Each column has a unique variable name
* EAch variable name is readable with reference to "codebook.txt"
* Each column is a variable containing one type of data
* Each individual observation is represented on a single row
  


Included files:
========================================

File     |Contents
---------|-----------
README.md |  Information for the repository
run_analysis.R | An R script for returning a tidy dataset for the Samsung data
codebook.txt | Describes the factors and variables in the tidy dataset produced by run_analysis.R


Files Required:
=======================================

run_analysis.R requires the following files in the working directory (for me this was the result of unzipping to the working directory)

Filepath from working directory | Contents
--------------------------------|-----------
"UCI HAR Dataset/UCI HAR Dataset/test/X_test.txt"| Variable data for the test dataset
"UCI HAR Dataset/UCI HAR Dataset/test/Y_test.txt"| Activity descgnation for the test dataset
"UCI HAR Dataset/UCI HAR Dataset/train/Y_train.txt"|Activity designation for the training dataset
"UCI HAR Dataset/UCI HAR Dataset/train/X_train.txt"|Variable data for the training dataset
"UCI HAR Dataset/UCI HAR Dataset/features.txt"|Names for each variable
"UCI HAR Dataset/UCI HAR Dataset/test/subject_test.txt"| Subject designation for each row of the test dataset
"UCI HAR Dataset/UCI HAR Dataset/train/subject_train.txt"| Subject designation for each row of the training dataset



_Author: Christopher Rawson_

