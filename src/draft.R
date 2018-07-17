data <- "https://raw.githubusercontent.com/boyangMAE/pharmacy_counting/master/input/inputtest.txt"
testdata <- read.table(data,header=TRUE, sep=",")

num_id <- aggregate(data=testdata, id ~ drug_name, function(x) length(unique(x)))
total_cost <- aggregate(data=testdata, drug_cost ~ drug_name, function(x) sum(x))
total <- merge(num_id,total_cost)
colnames(total) <- c("drug_name", "num_prescriber","total_cost")
total <- total[order(-total$total_cost),]

write.table(total,file="./outputtest.txt",sep=",",quote=FALSE,row.name=FALSE)
