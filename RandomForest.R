data(iris)

str(iris)

install.packages("caTools")	 # For sampling the dataset
install.packages("randomForest")

# Loading package
library(caTools)
library(randomForest)

# Splitting data in train and test data
split <- sample.split(iris, SplitRatio = 0.7)
split

train <- subset(iris, split == "TRUE")
test <- subset(iris, split == "FALSE")

# Fitting Random Forest to the train dataset
set.seed(120) # Setting seed
classifier_RF = randomForest(x = train[-5], y = train$Species, ntree = 500)

classifier_RF

# Predicting the Test set results
y_pred = predict(classifier_RF, newdata = test[-5])

confusion_mtx = table(test[, 5], y_pred) # Confusion Matrix
confusion_mtx

plot(classifier_RF)

importance(classifier_RF) # Importance plot

varImpPlot(classifier_RF) # Variable importance plot

acc=sum(diag(confusion_mtx))/sum(confusion_mtx) #accuracy
