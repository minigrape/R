getwd()
test<-read.csv("1.csv",header=TRUE)
test1<-read.csv("2.csv",header=TRUE)
com<-rbind(test,test2)#记录合并
head(com,n=2)
dim(com) #行数 列数
library(reshape2)
testmelt <- melt(com, id=c(1:5), na.rm=TRUE,value.name="度量值") 
#定义分类变量1:55列，未定义的就是数字变量variable value,na.rm:NA values be removed from the data set?
head(testmelt,n=2)
library(plyr) #acast()，配合.函数
summelt<-acast(testmelt,ttd.门票~年.使用日期.+月.使用日期.,sum,subset= . (variable == "可选项票量"+年.使用日期.== 2015))
summelt<-acast(testmelt,ttd.门票~年.使用日期.+月.使用日期.,sum,subset= . (年.使用日期.== 2015 & variable == "可选项票量"))
summelt<-acast(testmelt,ttd.门票~年.使用日期.+月.使用日期.,sum,subset= . (年.使用日期.==c(2016:2017) ))
#解释上句：筛选条件：可选项票量,列：ttd.门票,行：年月

a<-c("2017-08-12","2016-08-12")
b<-as.Date(a)
format(b,"%Y")

##清除变量相应object=A
rm(A)
##清除all变量
rm(list=ls())
