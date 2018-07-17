# pharmacy_counting
# testcode
Run a R code on a small dataset with duplicated prescribers with the same id.\
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

# Method
In the source code, there are 4 steps.
1. read the test data file to a dataframe in R
The read.table function was used for the small test case.  But when using the full (large) case, the fread function is much better.

fulldata <- fread("de_cc_data.txt",header=TRUE, sep=",")

2. count how many precribers for a certain drug by using the "aggregate" function with the "unique" function.\
The unique function will handle the duplicated prescribers. They have the same id, first name, and last name.

3. calculate the total cost of each drug by using the "aggregate" function.

4. sort the file by ordering the total cost by using the "order" function.

# Comment
The draft.R was successfully tested on the local desktop for both the test input and the full dataset, but I cannot run it through Github. I have some reading or path settings challenges but I think it is not a real math or logical challenge.  Hopefully, you still could evaluate my code.  Thanks.
The whole code could be written in a function, but I write down each part separately for readers.
