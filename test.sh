# echo $(curl -X GET --header "Accept: */*" "https://www.amfiindia.com/spages/NAVAll.txt")
# exit

# # result =  $(curl -X GET --header "Accept: */*" "https://www.amfiindia.com/spages/NAVAll.txt")
# # echo "Response from server"
# # echo $result
# # exit


# # echo $(curl -X GET --header "Accept: */*" "https://www.amfiindia.com/spages/NAVAll.txt"| jq -r '.Date')
# # exit

# curl -s 'https://www.amfiindia.com/spages/NAVAll.txt' | jq -r '.name'
# curl -s 'https://api.github.com/users/lambda' | \
#     python3 -c "import sys, json; print(json.load(sys.stdin)['name'])"

# echo $(curl -X GET --header "Accept: */*" "https://www.amfiindia.com/spages/NAVAll.txt") > test-gen.csv; \
# exit

# echo "Scheme Code;ISIN Div Payout/ ISIN Growth;ISIN Div Reinvestment;Scheme Name;Net Asset Value;Date
#  " ; $(curl -X GET --header "Accept: */*" "https://www.amfiindia.com/spages/NAVAll.txt") | sed 's/;/<tab>/g' > file.csv
# exit

# curl -v https://www.amfiindia.com/spages/NAVAll.txt | grep [0-9]> file2.csv
(echo "Scheme_Code;ISIN_Div_Payout/ISIN _Growth;ISIN_Div_Reinvestment;Scheme_Name;Net_Asset_Value;Date" ; curl -v https://www.amfiindia.com/spages/NAVAll.txt | grep [0-9]) | sed 's/;/\t/g' > input.csv
cat input.csv | cut -f4,5 -s >output.csv
exit
