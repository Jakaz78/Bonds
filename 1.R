
library(corrplot)
library(readxl)
data2 <- read_excel("data2.xlsx")


data_numeric <- data2[, c("Close", "Inflation", "10YUSBOND", "XAUUSD", 
                          "USDPLN", "WIBOR", "10YDEBOND", 
                          "WIG20", "S&P500", "UNEMPLOYMENT", "PMI", "DETAL","OIL")]


data_numeric <- data_numeric[sapply(data_numeric, is.numeric)]

cor_matrix <- cor(data_numeric, use = "pairwise.complete.obs", method = "pearson")


corrplot(cor_matrix, method = "color",
         order = "hclust",
         addCoef.col = "black", # dodaj wartości korelacji
         tl.col = "black", tl.cex = 0.8)