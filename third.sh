# curl -v https://www.amfiindia.com/spages/NAVAll.txt | grep [0-9]> file2.csv

#Bash script
(echo "Scheme_Code;ISIN_Div_Payout/ISIN _Growth;ISIN_Div_Reinvestment;Scheme_Name;Net_Asset_Value;Date" ; curl -v https://www.amfiindia.com/spages/NAVAll.txt | grep [0-9]) | sed 's/;/\t/g' > third_input.csv
cat third_input.csv | cut -f4,5 -s >third_output.csv
exit


# First fetch api response using curl. 
#Then use grep to remove unwanted rows
# Create schema for csv table using column names 
# Separate entries using tab spaces
#save it in csv third_input.csv
#Take only required columns to third_output csv.