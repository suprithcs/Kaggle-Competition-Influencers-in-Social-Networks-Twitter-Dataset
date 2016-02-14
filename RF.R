# Random Forests
library(randomForest)

# train model
modelRandomForest = randomForest(as.factor(traindataNorm$Choice)~.,
                                 data =traindataNorm[, 1:22],
                                 ntree = 1000 ,replace=TRUE,
                                 keep.forest = TRUE)

# predict on test set
testRandomForest = predict(modelRandomForest, 
                           newdata = testdataNorm[,1:22])

# summary and statistics
summary(modelRandomForest)

# gives confusion matrix on train set
modelRandomForest[5]

# plotting number of trees vs error rate
plot(modelRandomForest, main="Random Forest")

# gives MeanDecreaseGini value
modelRandomForest$importance

# plotting variable importance
varImpPlot(modelRandomForest, sort=TRUE, n.var=min(10, nrow(modelRandomForest$importance)), type=NULL, class=NULL, scale=TRUE)
