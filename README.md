SCRIPTS
========================================================
I use only one script for the calculation:
# tp getting and cleaning data.R

- 1. The script first analize wich are the features related to the mean and the standard deviation.
- 2. Then it read the x_test file with only the columns related to the calculations taken before.
- 3.Then it read the y_test file (wich has the numbers of the activities) and read the "activity labels" file to know wich activity is each number. 
- 4. Then combine it with the data taken from "xtest" in only one dataset.
- 5. Then it read the "subject_test" file that has the subject that corresponds to each row of the dataset. and combine it with the dataset named before
- 6. Now it repeats the steps 2 to 5 with the "train" data(it has the same structure as "test" data)
- 7. Finaly, it use the rbind function to combine both big datasets into the final one.
