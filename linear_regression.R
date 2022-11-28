data = read.csv("E:/7th Sem/DSC LAB/income.data_/income.data.csv")
View(data)
str(data)
summary(data)
library(ggplot2)
library(dplyr)
library(broom)
library(ggpubr)
#hist(data$income)
hist(data$happiness)
plot(data$income,data$happiness,xlab = "income",ylab = "happiness",main = "income vs happiness scatter plot")

lin = lm(happiness~income, data = data)
summary(lin)

par(mfrow=c(2,2))
plot(lin)
par(mfrow=c(1,1))

grp <- ggplot(data,aes(x=income,y=happiness))+ geom_point()
grp

grp <- grp + geom_smooth(method = "lm",col='blue')
grp

grp <- grp + stat_regline_equation(label.x = 3, label.y=7)
grp
