# Affinity_assignment


##First Question -
To indicate degree of twitter tweets

####Requirements: 
1)Python 
2)Pandas
3)textblob
The above packages needs to be installed to run the file.

All the code is in "First.py" file (Comments are included at each step for easy readability.)

I used a data set from kaggle with some twitter tweets since I was not able to find specific racial slurs dataset
Any data set can be pased, Here I pass csv file "first_input.csv"

The data is first passed into a function for reg ex and to convert sentences to comma separated list.
Then I assume a list of offensive words.

Iterating through each row and word comparing it to list of words, Define neew column with the count.

Based on count create new column with degree as Not Offensive, Offensive and Very Offensive.

Here is a screenshot of a part of output.
<img width="916" alt="Screenshot 2023-06-03 at 7 37 29 PM" src="https://github.com/devesh-13/Affinity_assignment/assets/92622788/6048fc08-b456-4df8-aab4-02b5bf5c156d">

Finally output is save in a csv named "first_output.csv"


##Second Question - 
I have uploaded a txt file answering this question.

##Thrid Question -
For this question I wrote a bash script in file "third.sh"

Here I fetch response from api using curl. Then I remove lines that do not end with number using grep.
This logic helped me to remove black/extra lines that were not being able to adjust into table format.

As this was not json file, I convert it to table format by passing column Names and separating column entries by tab spacing separator.
I save this to a "Third_input.csv"

Then I use cut to take only required columns i.e. Scheme Name and Asset Value into other csv "Third_output.csv"



