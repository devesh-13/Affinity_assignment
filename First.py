# Import Libraries
# pip install textblob needs to be run

import pandas as pd
from textblob import TextBlob


# Read csv
# here I downloaded a kaggle tweet data, for this assignment
# and I will load it into a dataframe

df = pd.read_csv("First_input.csv")

#This df has three columns but only tweet is required, I take 1000 rows.

df_new = pd.DataFrame(df['tweet'][:1000])

#In this function I apply regex to simplify tweet sentences, I apply basic regex assuming normal sentences and typos 
def regex_text(df_new):

	# Making all to lower case
	df_new['tweet'] = df_new['tweet'].apply(lambda x: " ".join(x.lower() for x in x.split()))
	
	# To remove punctuations like (.,@#)
	df_new['tweet'] = df_new['tweet'].str.replace('[^\w\s]','')
	
	# To correct spellings 
	df_new['tweet'] = df_new['tweet'].apply(lambda x: str(TextBlob(x).correct()))

	# To convert sentence to , separated list
	df_new['tweet'] = df_new['tweet'].str.split()

	return df_new

def count_offensive (df_new, list_words):

	# To store number of occurance of offensive words each row
	df_new['counter']=0


	#for loop to iterate though each row, count number of offensive words and write in  counter column
	for i in range(0, len(df_new)):
		count = 0
		for j in df_new['tweet'][i]:
			if j in list_words:
				count +=1

		df_new['counter'][i]= count

	'''Then I will create new column to indicate degree of profanity
    Not offensive if counter is 0
    Offensive if counter is more than 0, less than 3
    Very Offensive if counter is >=3'''

	df_new['degree'] = ['Not offensive' if x == 0 else 'Offensive' if 0<x<3 else 'Very Offensive' for x in df_new['counter']]
	return df_new


# Creating list of few offensive words 
list_words = ['shit', 'bitch', 'bastard', 'nigga']

# For Racial slurs this list can be considered ['jews', 'black', 'white', 'negro', 'darky', 'chink']
# Since i did not have data including racial slurs I used the above list
#List can be changed as required

# Calling function for regex

df_new = regex_text(df_new)

# Calling function to count offensive words and return degree

df_new = count_offensive (df_new, list_words)


#Saving it into csv
df_new.to_csv("first_output.csv")


#Since not many sentences have any offensive words, I print to check for the ones that have
# df_new.loc[df_new['counter'] > 0]



