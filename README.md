# pharmacy_counting
testcode\
Run a R code on a small dataset with duplicated prescribers.\
The input file "inputtest.txt" is

id,prescriber_last_name,prescriber_first_name,drug_name,drug_cost\
1000000001,Smith,James,AMBIEN,100\
1000000002,Garcia,Maria,AMBIEN,200\
1000000003,Johnson,James,CHLORPROMAZINE,1000\
1000000004,Rodriguez,Maria,CHLORPROMAZINE,2000\
1000000005,Smith,David,BENZTROPINE MESYLATE,1500\
1000000005,Smith,David,BENZTROPINE MESYLATE,1500\
1000000006,Khaled,Alex,AMOXICILLIN,300\
1000000007,Lee,Kevin,AMOXICILLIN,50

The output file "outputtest.txt" should be

drug_name,num_prescriber,total_cost\
BENZTROPINE MESYLATE,1,3000\
CHLORPROMAZINE,2,3000\
AMOXICILLIN,2,350\
AMBIEN,2,300

In the source code, there are 3 steps.\
1. read the test data file to a dataframe in R
The read.table function was used for the small test case.  But when using the full (large) case, the fread function is much better.

fulldata <- fread("/by57/Insightdata/de_cc_data.txt")
#

# count how many precribers for a certain drug
num_id <- aggregate(data=testdata, id ~ drug_name, function(x) length(unique(x)))
#                    
# calculate the total cost of a certain drug
total_cost <- aggregate(data=testdata, drug_cost ~ drug_name, function(x) sum(x))
#
# prepare the output file by merging the two temporary dataframes
total <- merge(num_id,total_cost)
#
# edit the column names
colnames(total) <- c("drug_name", "num_prescriber","total_cost")
#
# sort/order the data by using descending total cost                       
total <- total[order(-total$total_cost),]
#
# output file
