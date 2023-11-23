# txt 파일가져오기
ex_data <- read.table("data/data_ex.txt", encoding = "EUC-KR",
                      fileEncoding = "UTF-8", header = T)
ex_data 

varname <- c("ID", "SEX", "AGE", "AREA")
ex_data1 <- read.table("data/data_ex_col.txt", encoding = "EUC-KR",
                      fileEncoding = "UTF-8", col.names = varname)
ex_data1 


ex_data2 <- read.table("data/data_ex.txt", encoding = "EUC-KR",
                      fileEncoding = "UTF-8", header = T, skip = 2)
ex_data2 


ex_data3 <- read.table("data/data_ex.txt", encoding = "EUC-KR",
                       fileEncoding = "UTF-8", header = T,
                       nrows = 7)
ex_data3 

ex_data4 <- read.table("data/data_ex1.txt", encoding = "EUC-KR",
                       fileEncoding = "UTF-8", header = T, sep = ",")
ex_data4

library(readxl)
excel_data_ex <- read_excel("data/data_ex.xlsx")

install.packages("XML")
library(XML)
xml_data <- xmlToDataFrame("data/data_ex.xml")
xml_data

install.packages("jsonlite")
library(jsonlite)
json_data <- fromJSON("data/data_ex.json")
json_data
