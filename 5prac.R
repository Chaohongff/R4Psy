gender <- c('男','女','女','男')
gender1 <- factor(gender)
score <- c(97,99,95,96)
scorelevel <- c("A","A","B","B")
judge <- c("T","F","T","F")
data <-data.frame(gender,score,scorelevel,judge)


# 加载ggplot2包
library(ggplot2)

# 创建数据框，包含两个同心圆的坐标
theta <- seq(0, 2 * pi, length.out = 100)  # 角度
r1 <- 1  # 第一个圆的半径
r2 <- 0.5  # 第二个圆的半径

circle1 <- data.frame(
  x = r1 * cos(theta),
  y = r1 * sin(theta),
  group = "圆1"
)

circle2 <- data.frame(
  x = r2 * cos(theta),
  y = r2 * sin(theta),
  group = "圆2"
)

# 合并两个圆的数据
circles <- rbind(circle1, circle2)

# 创建小王子的形象（简单版）
# 头部
head <- data.frame(
  x = 0.3 * cos(theta) + 0,  # 头部中心在原点
  y = 0.3 * sin(theta) + 0.2,  # 头部中心在y=0.2
  group = "小王子"
)

# 身体
body <- data.frame(
  x = c(-0.1, -0.1, 0.1, 0.1),
  y = c(0.2, -0.3, -0.3, 0.2),
  group = "小王子"
)

# 手臂
arms <- data.frame(
  x = c(-0.1, -0.3, 0.1, 0.3),
  y = c(0, 0, 0, 0),
  group = c("左臂", "右臂", "左臂", "右臂")
)

# 腿部
legs <- data.frame(
  x = c(-0.05, -0.05, 0.05, 0.05),
  y = c(-0.3, -0.5, -0.5, -0.3),
  group = c("左腿", "右腿", "左腿", "右腿")
)

# 合并小王子的数据
prince <- rbind(head, body, arms, legs)

# 使用ggplot2绘制同心圆和小王子
ggplot(circles, aes(x = x, y = y, group = group, color = group)) +
  geom_path(linewidth = 1) +  # 绘制圆的路径
  geom_path(data = prince, aes(x = x, y = y, group = group), linewidth = 1, color = "yellow") +  # 绘制小王子
  coord_fixed(ratio = 1) +    # 保持比例，确保圆不被拉伸
  theme_minimal() +           # 使用简约主题
  labs(title = "同心圆与小王子", x = "X轴", y = "Y轴") +  # 添加标题和轴标签
  scale_color_manual(values = c("blue", "red"))  # 自定义颜色

# 加载ggplot2包
library(ggplot2)

# 创建玫瑰的花瓣（使用极坐标）
theta <- seq(0, 2 * pi, length.out = 1000)  # 角度
r <- 0.5 * sin(5 * theta) + 0.5  # 花瓣的半径，使用正弦函数生成花瓣形状

rose <- data.frame(
  x = r * cos(theta),
  y = r * sin(theta)
)

# 创建花茎
stem <- data.frame(
  x = c(0, 0),
  y = c(-0.5, -2)
)

# 创建叶子
leaf1 <- data.frame(
  x = c(-0.2, 0, 0.2, 0),
  y = c(-1, -1.5, -1, -1.25)
)

leaf2 <- data.frame(
  x = c(-0.1, 0, 0.1, 0),
  y = c(-1.5, -2, -1.5, -1.75)
)

# 使用ggplot2绘制玫瑰
ggplot() +
  geom_path(data = rose, aes(x = x, y = y), color = "red", linewidth = 1.5) +  # 绘制花瓣
  geom_path(data = stem, aes(x = x, y = y), color = "green4", linewidth = 1.5) +  # 绘制花茎
  geom_polygon(data = leaf1, aes(x = x, y = y), fill = "green3", color = "green4", linewidth = 0.5) +  # 绘制叶子1
  geom_polygon(data = leaf2, aes(x = x, y = y), fill = "green3", color = "green4", linewidth = 0.5) +  # 绘制叶子2
  coord_fixed(ratio = 1) +  # 保持比例，确保图形不被拉伸
  theme_void() +  # 去掉坐标轴和背景
  labs(title = "玫瑰花") +  # 添加标题
  theme(plot.title = element_text(hjust = 0.5, face = "bold"))  # 调整标题位置和样式

