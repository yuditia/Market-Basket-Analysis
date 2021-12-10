#menggunakan library arules
library(arules)

#membaca data transaksi
data <- read.transactions("D:/DATA SCIEN/PROJECT/1 MARKET BASKET ANALYSIS/transaksi_dqlab_retail.tsv", format = "single", sep = "\t", cols = c(1,2),skip=1)

data_item <- itemFrequency(data, type="absolute")

#melakukan shorting
data_item <- sort(data_item, decreasing = T)

#mengambil 10 item teratas
data_item <- data_item[1:10]

#konversi data item menjadi data frame nama produk dan jumlah
data_item <- data.frame("Nama Produk"=names(data_item),"Jumlah"=data_item,
                        row.names = NULL)


#memunculkan hasil top 10
print(data_item)

library(dplyr)
#membaca data transaksi
data <- read.transactions("transaksi_dqlab_retail.tsv",
                          format="single",
                          cols=c(1,2),
                          sep="\t",
                          skip=1)

data_transaksi <- apriori(data, parameter=list(supp=10/length(data),confidence=0.1,minlen=2,maxlen=3))
#membuat pasangan item yang jarang laku tas make up dan baju renang pria anak
data1 <- subset(data_transaksi,rhs%in% "Tas Makeup", lift >1)
data1 <- sort(data1, decreasing=TRUE,by="lift")
data1 <- data1[1:3]
data2 <- subset(data_transaksi,rhs%in% "Baju Renang Pria Anak-anak", lift>1)
data2 <- sort(data2, decreasing=TRUE, by="lift")
data2 <- data2[1:3]
data3 <- c(data1, data2)
inspect(data3)

write(data3, file="kombinasi_retail_slow_moving.txt")

install.packages("knitr")
library(knitr)
