# Support Vector Machines

library(e1071)

# train svm model
modelSVm = svm(traindataNorm$Choice~., data=traindataNorm[1:nrow(traindataNorm), 1:22],
               kernel="linear", epsilon=0.1, probability = TRUE,
               type ="C")

# predict on test
testSvm = predict(modelSVm, newdata = testdataNorm[,1:22], type="class")

#summary and statistics
summary(modelSVm)

# confusion matrix of train set
predicion = predict(modelSVm, data= traindataNorm[,1:22], type="class")

confusionmatrixSVM <- table(pred = predicion, true = traindataNorm$Choice)