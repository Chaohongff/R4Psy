if (!requireNamespace('pacman', quietly = TRUE)) {
  install.packages('pacman')
}
pacman::p_load(bruceR)
install.packages('gtable')
install.packages("scales")
penguin_data <- bruceR::import(here::here('data', 'penguin', 'penguin_rawdata.csv'))
str(penguin_data)
b=print(3+5*7)
a=b+10
print(a)

#创建向量
v1 <- c(1,2,3,4,5)  # 数值型向量
v1
#创建列表
v2 = c(1:3,5,7)
v2
v2[4]

#创建dataframe
df <- data.frame(matrix(ncol = 3, nrow = 0))
x <- c("participant", "age", "gender")
colnames(df) <- x

#如果想要提取df数据集最后两列的数据
df[1,2:ncol(df)]

## 筛选出生年份大于 1980 且(&)小于 1990 的数据
agedata = penguin_rawdata[
  penguin_data$age >1980 & 
    penguin_data$age < 1990 ,]
unique(agedata$age)

stress_data <- penguin_data
selected_cols <- c('Site', colnames(penguin_data)[base::startsWith(colnames(penguin_data),'stress')])
stress_data_thu <- stress_data[stress_data$Site == 'Tsinghua', ]
stress_data_thu$stress_sum <- rowSums(stress_data_thu[,grep("^stress", names(stress_data_thu))])
mean(stress_data_thu$stress_sum, na.rm = TRUE)
sd(stress_data_thu$stress_sum, na.rm = TRUE)