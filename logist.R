# Logistic Regression
library(caret)
library(pROC)


# Train LR model
modelLR = train(as.factor(traindataNorm$Choice) ~., 
                family = binomial(link='logit'),
                data =trainFeature6[1:NROW(traindataNorm), 1:22], 
                method="glm")

# predict on test
testResultsLR = predict(object = modelLR, newdata = testdataNorm[,1:22],
                        type="raw")

# summary and statistics
summary(modelLR)


# 10 fold CV
train_control = trainControl(method="repeatedcv", number=10, repeats=10)

modelLR = train(as.factor(traindataNorm$Choice)~., data = traindataNorm[1:NROW(traindataNorm),1:22],
                method="glm", trControl=train_control)

predicions = predict(modelLR, traindataNorm[1:NROW(traindataNorm),1:22])

# confusion matrix of train set
confusionMatrix(predicions, traindataNorm$Choice)

# ROC curve plot
plot.roc(predicions, traindataNorm$Choice)
