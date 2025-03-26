install.packages("purrr")
library(tidyverse)
library(dplyr)
# 创建dataframe
data <- data.frame(
  "grammer" = c("R", "SPSS", "Python", "R", NA, "Matlab", "Python", "R"),
  "score" = c(4, 2, 5, 4.5, 5, 4, 2, 5),
  "popularity" = c(1, 2, NA, 4, 5, 6, 7, 10)
) 

# 提取前两列
select_data1 <- data[, 1:2]
# 提取含字符串"R"的行
select_data2 <- select_data1[select_data1$grammer == 'R', ]
#select用于筛选列，filter用于筛选行
#dplyr::select 表示从 dplyr 包中调用 select 函数，这种语法用于明确指定函数来自哪个包，避免不同包中同名函数的冲突。
select_data3 <- data %>%
  dplyr::select(grammer,score) %>%
  dplyr::filter(grammer == 'R')

df1 <- bruceR::import(here::here('data', 'penguin', 'penguin_rawdata.csv')) # 导入数据
colnames(df1)
#计算DEQ和DSI的均值
df2 <- dplyr::summarise(df1, mean_DEQ = mean(DEQ, na.rm = TRUE),mean_DSI = mean(socialdiversity, na.rm = TRUE))
print(df2)

  