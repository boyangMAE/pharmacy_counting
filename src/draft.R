# This is an R script to test the function by using a test input file
# "https://raw.githubusercontent.com/boyangMAE/pharmacy_counting/master/input/inputtest.txt"
# read the test data file to a dataframe in R
testdata <- read.table("inputtest.txt",header=TRUE, sep=",",fill=TRUE)
#
# please use this "fread" function to read the full dataset
# library(data.table)
# fulldata <- fread("de_cc_data.txt")
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
write.table(total,file="./output/outputtest.txt",sep=",",quote=FALSE,row.name=FALSE)                     
                        
#########################code for the full dataset below this
## Two ## signs mean comments and One # sign means R code for the full dataset.                        
## To run the full dataset, please change the data to fulldata
## count how many precribers for a certain drug
# num_id <- aggregate(data=fulldata, id ~ drug_name, function(x) length(unique(x)))
#                    
## calculate the total cost of a certain drug
# total_cost <- aggregate(data=fulldata, drug_cost ~ drug_name, function(x) sum(x))
#
## prepare the output file by merging the two temporary dataframes
# total <- merge(num_id,total_cost)
#
## edit the column names
# colnames(total) <- c("drug_name", "num_prescriber","total_cost")
#
## sort/order the data by using descending total cost                       
# total <- total[order(-total$total_cost),]
#
## output file
# fwrite(total,"output.txt")                    
######################### end
