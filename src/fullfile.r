# This is the R script for the full data file
# https://drive.google.com/file/d/1fxtTLR_Z5fTO-Y91BnKOQd6J0VC9gPO3/view?usp=sharing
# The structure is the same as the R script "draft.R".
#
# read the test data file
# please use this "fread" function to read the full dataset
# This library is only for reading and writing the full dataset
library(data.table)
fulldata <- fread("https://drive.google.com/file/d/1fxtTLR_Z5fTO-Y91BnKOQd6J0VC9gPO3/view?usp=sharing")

# count how many precribers for a certain drug
num_id <- aggregate(data=fulldata, id ~ drug_name, function(x) length(unique(x)))
#                    
# calculate the total cost of a certain drug
total_cost <- aggregate(data=fulldata, drug_cost ~ drug_name, function(x) sum(x))
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
write.table(total,file="./outputtest.txt",sep=",",quote=FALSE,row.name=FALSE)
