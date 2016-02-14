# Decision Trees
library(rpart)
library(caret)



#train model 
modelDTreeN = rpart(traindataNorm$Choice~. ,
                    data= traindataNorm[,1:22], 
                    method="class", 
                    control = rpart.control(maxdepth = 4) )

#predict on test set
testDTreeN = predict(object = modelDTreeN, newdata =testdataNorm[,1:22],
                     type="class")

# model summary and statistics
summary(modelDTreeN)

# writing predictions to csv for kaggle submission

write.csv(testDTreeN, "C:/Users/Shreya/Desktop/New results/trees.csv", row.names = TRUE)

#performing 10 fold CV
train_control = trainControl(method="repeatedcv", number=10, repeats=10)

modelTree = train(as.factor(traindataNorm$Choice)~., data = traindataNorm[1:NROW(traindataNorm),1:22],
                  method="rpart", trControl=train_control)

predicions = predict(modelTree, traindataNorm[1:NROW(traindataNorm),1:22])

# confusion matrix on train set
confusionMatrix(predicions, traindataNorm$Choice)

# plot roc
plot.roc(predicions, traindataNorm$Choice)

# pruned tree depth 

num  = which.min(modelDTreeN$cptable[,"xerror"])
print(num)


# plot the learned tree
plot(modelDTreeN, main="TREE")
text(modelDTreeN, use.n=TRUE, all = TRUE, cex=.8)