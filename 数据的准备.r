getwd() #查看当前目录，就不用写完整路径了
setwd() #设置目录，就不用写完整路径了

# 完整路径写法 反双杠setwd("D://**//Rfile")
#更改默认路径方法：右键R桌面快捷方式,选择属性,然后在快捷方式下的起始位置(start in)输入你想要的路径即可.
dispatch<-read.csv("dispatch analysis.csv",header=TRUE)
#读取csv格式，对xls格式支持不好。object命名为dispatch。
head(dispatch,n=10)
#查看前十条，不加后缀n默认5条，另外还有函数tail
plot(y~x,data=)
plot(sales~jitter(article.count),data=dispatch)
#jitter是添加噪音，使数据相互分离，易于在散点图上识别

> attach(mtcars)
> plot(wt,mpg)#plot(x,y) 数据用attach引用

ls() #查看当前object
结果：
[1] "arti"      "employees"

library(lattice)
#加载lattice数据包

xyplot(y~x|分组字段,data=)
xyplot(webhits~commentcount|authorName,data=arti)
#绘制lattice散点图。|代表告诉R按什么分组

###处理数据流程
newlastname <- sub("\\(.*\\)","",hfhh$LastName) #step1:正规表达式处理复杂的数据模式
hfhh$LastName <- NULL #step2：删除LastName列
hfhh["LastName"] <- newlastname #step3：写入csv表格中新列 命名为LastName
write.csv(hfhh,file="hfhh.csv") #step4:另存为名为hfhh.csv的文件

###删除重复项（还是excel方便！！！）
hfhhsorted<-hfhh[order(hfhh$PersonID),] #按PersonID顺序排列
hfhhnameonly<-hfhhsorted
hfhhnameonly$CallID<-NULL
hfhhnameonly$Time<-NULL  #删除两列不同的列
hfhhnameonly<-unique(hfhhnameonly) #删除重复项
head(hfhhnameonly)
write.csv(hfhhnameonly,file="hfhhnamesonly.csv")

###升级R
install.packages("installr")
library(installr)
updateR()

##记录合并
rbind (dataframe1, dataframe2…)

##字段合并 sep：合并后的分隔符，默认为空格
paste (数据1, 数据2, …, sep = "")
cbind(One,Two) #无需匹配

##智能匹配的字段合并merge函数
merge(x, y, by = , by.x = , by.y = , all = , all.x = , all.y = , sort = , suffixes = , incomparables = , ...)

#两个数据集有相同的列名（ID）时，by参数可以省略（by="ID"）
total_student1<-merge(数据1,数据2,by="ID") 

#inner（内部链接）只合并交集
m1 <- merge(数据1,数据2, by.x = "surname", by.y = "name")

#left join（左连接）
m2 <- merge(数据1, 数据2, by.x = "surname", by.y = "name",all.x=TRUE)

#right join（右连接）
m3 <- merge(数据1, 数据2, by.x = "surname", by.y = "name",all.y=TRUE)

#all_join（外连接）
m4 <- merge(数据1, 数据2, by.x = "surname", by.y = "name",all=TRUE)

###R in Action 笔记
向量c
a<-c(1,2,3) # c是向量专用，一维。括弧里的数据类型要一致。
矩阵mytrix
mymatrix<-matrix(vector,nrow=nr,ncol=nc,byrow=TRUE/FALSE,dimnames=list(a,b)) #矩阵matrix，vector矩阵元素，nrow和ncol指定行列的维数，byrow按行填充TRUE，按列填充FALSE，默认按列填充。dimnames行名和列名。
矩阵是二维，括弧里的数据类型要一致。如需多种模式，要用数据框。
创建矩阵实例1：
y<-matrix(1:20,nrow=5,ncol=4)
> y
     [,1] [,2] [,3] [,4]
[1,]    1    6   11   16
[2,]    2    7   12   17
[3,]    3    8   13   18
[4,]    4    9   14   19
[5,]    5   10   15   20
实例2：

> cells<-c(1,26,24,68)
> rnames<-c("R1","R2")
> cnames<-c("C1","C2")
> mymatrix<-matrix(cells,nrow=2,ncol=2,byrow=TRUE,dimnames=list(rnames,cnames)) 
#数据是cells的，2*2行列，按行填充，行名和列名。
> mymatrix
   C1 C2
R1  1 26
R2 24 68
下标的使用 实例3：
> x<-matrix(1:10,nrow=2)
> x
     [,1] [,2] [,3] [,4] [,5]
[1,]    1    3    5    7    9
[2,]    2    4    6    8   10
> x[2,]
[1]  2  4  6  8 10
> x[,2]
[1] 3 4
> x[1,4]
[1] 7
> x[1,c(4,5)]
[1] 7 9
>
数组array 和矩阵类似，但维度可以>2，括弧里的数据类型要一致
创建数组实例1：
> dim1<-c("A1","A2")
> dim2<-c("B1","B2","B3")
> dim3<-c("C1","C2","C3","C4")
> z<-array(1:24,c(2,3,4),dimnames=list(dim1,dim2,dim3))
#24为=2*3*4数据，维度数行列高，命名可选行列高
> z
, , C1

   B1 B2 B3
A1  1  3  5
A2  2  4  6

, , C2

   B1 B2 B3
A1  7  9 11
A2  8 10 12

, , C3

   B1 B2 B3
A1 13 15 17
A2 14 16 18

, , C4

   B1 B2 B3
A1 19 21 23
A2 20 22 24
数据框data.frame() 不同的列可以包含不同模式（数值型、字符型），它是最常处理的数据结构
mydata<-data.frame(col1,col2,col3,...)
创建数据框实例1：
> patientid<-c(1,2,3,4)
> age<-c(25,34,28,52)
> diabetes<-c("Type1","Type2","Type1","Type1")
> status<-c("Poor","Improved","Excellent","Poor")
> patientdata<-data.frame(patientid,age,diabetes,status)
> patientdata
  patientid age diabetes    status
1         1  25    Type1      Poor
2         2  34    Type2  Improved
3         3  28    Type1 Excellent
4         4  52    Type1      Poor
选取数据框元素实例2：
> patientdata[1:2]
  patientid age
1         1  25
2         2  34
3         3  28
4         4  52
> patientdata[c("diabetes","status")]
  diabetes    status
1    Type1      Poor
2    Type2  Improved
3    Type1 Excellent
4    Type1      Poor
> patientdata[2]
  age
1  25
2  34
3  28
4  52
> patientdata$age #用来选取特定变量
[1] 25 34 28 52
列连表生成实例3：
> table(patientdata$diabetes,patientdata$status)
       
        Excellent Improved Poor
  Type1         1        0    2
  Type2         0        1    0
实例标识符（类似主键）实例4：
> patientdata<-data.frame(patientid,age,diabetes,status,row.names=patientid)
> patientdata
  patientid age diabetes    status
1         1  25    Type1      Poor
2         2  34    Type2  Improved
3         3  28    Type1 Excellent
4         4  52    Type1      Poor
变量的定义

diabetes 为名义型变量，无序；
status 为有序型变量，有顺序，但具体数值不知；
age 为连续型变量。
名义型变量/有序型变量
因子factor
因子在R中很重要，决定数据的分析方式以及如何视觉呈现。 通过因子factor函数，为数据储存变量类型让R知晓。

1）. 定义名义型变量

> diabetes<-factor(diabetes) #将向量储存为（1，2，1，1），内部关联为1=Type1，2=Type2，根据字母顺序而定。
> diabetes
[1] Type1 Type2 Type1 Type1
Levels: Type1 Type2
2）. 定义有序型变量 实例1：

> status
[1] "Poor"      "Improved"  "Excellent" "Poor"  
> status<-factor(status,ordered=TRUE)  #将向量储存为（3,2,1,3）,1=Excellent,根据字母顺序而定。这个顺序很少让人满意，所以需要调整。通过指定levels来覆盖默认排序。
> status
[1] Poor      Improved  Excellent Poor     
Levels: Excellent < Improved < Poor
有序型变量指定顺序实例2：

> status<-factor(status,ordered=TRUE,levels=c("Poor","Improved","Excellent"))  #通过指定levels来覆盖默认排序。
> status
[1] Poor      Improved  Excellent Poor     
Levels: Poor < Improved < Excellent
#赋值为1=Poor，2=Improved，3=Excellent
3）. 查看对象结构

> str(patientdata)
'data.frame':   4 obs. of  4 variables:
 $ patientid: num  1 2 3 4
 $ age      : num  25 34 28 52
 $ diabetes : Factor w/ 2 levels "Type1","Type2": 1 2 1 1
 $ status   : Ord.factor w/ 3 levels "Excellent"<"Improved"<..: 3 2 1 3
>
4）. 查看对象统计概要

> summary(patientdata)
   patientid         age         diabetes       status 
 Min.   :1.00   Min.   :25.00   Type1:3   Excellent:1  
 1st Qu.:1.75   1st Qu.:27.25   Type2:1   Improved :1  
 Median :2.50   Median :31.00             Poor     :2  
 Mean   :2.50   Mean   :34.75                          
 3rd Qu.:3.25   3rd Qu.:38.50                          
 Max.   :4.00   Max.   :52.00                          
>
5）. 其他实用函数

> class(patientdata)
[1] "data.frame"
> mode(patientdata)
[1] "list"
列表list() ——一些对象的有序集合，整合若干个对象到单个对象名下。
mylist<-list(ob1,ob2,ob3,...)
mylist<-list(name1=ob1,name2=ob2,name3=ob3,...) #命名
创建列表实例1：
> g<-"My First List" #字符串
> h<-c(25,26,18,39)#数值型
> j<-matrix(1:10,nrow=5)#矩阵
> j
     [,1] [,2]
[1,]    1    6
[2,]    2    7
[3,]    3    8
[4,]    4    9
[5,]    5   10
> k<-c("one","two","three")#字符型
> mylist<-list(title=g,ages=h,j,k)
> mylist
$title
[1] "My First List"

$ages
[1] 25 26 18 39

[[3]]
     [,1] [,2]
[1,]    1    6
[2,]    2    7
[3,]    3    8
[4,]    4    9
[5,]    5   10

[[4]]
[1] "one"   "two"   "three"

> mylist[[2]]  #输出第二部分
[1] 25 26 18 39
> mylist[["ages"]]
[1] 25 26 18 39
使用键盘输入数据

> mydata<-data.frame(age=numeric(0),gender=character(0),weight=numeric(0))
> mydata
[1] age    gender weight
<0 rows> (or 0-length row.names)
> mydata<-edit(mydata) #弹出对话框
Warning message:
In edit.data.frame(mydata) : added factor levels in 'gender'
> mydata
  age gender weight
1  25      m    166
2  30      f    115
3  18      f    120
> fix(mydata) #弹出对话框，简易写法
