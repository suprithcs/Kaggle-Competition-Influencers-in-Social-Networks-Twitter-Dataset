library(pROC)
library(caret)
library(infotheo)
library(gbm)
library(mlbench)
library(corrplot)
library(dismo)
library(ROCR)

#train set and test set location
Train = read.csv("D:\\machineLearning\\kaggle\\train.csv")
testData = read.csv("D:\\machineLearning\\kaggle\\test.csv")


set.seed(825)
#Currently for 3 fold cv but the parameters can be altered
fitControl = trainControl(
  method = "repeatedcv",
  number = 2,
  repeats = 3)

#regularization parameters tuning using cross validation  
gbmGrid = expand.grid(interaction.depth = c(1, 3, 5, 7), # set of tree depths to experiment 
        n.trees = (1:30)*50, #number of trees in the forest
        shrinkage = 0.1, #learning rate/shrinkage
        n.minobsinnode = c(10,30,50,60, 80)) #set of min number of nodes at leaf
		
nrow(gbmGrid)

#train a model with just cross validation
gbmFit1 = train(as.factor(Train$Choice) ~ ., data =Train[1:NROW(Train), 1:22],
                method = "gbm",
                trControl = fitControl,
                verbose = FALSE)
gbmFit1

set.seed(825)
#train a model with previously determined parameters by passing the fit control object and train set, inlcuding cross validation
gbmFit2 = train(as.factor(Train$Choice) ~ ., data = Train[1:NROW(Train), 1:22],
                method = "gbm",
                trControl = fitControl,
                verbose = FALSE,
                tuneGrid = gbmGrid)
gbmFit2


#best configuration for gbm model
model = gbm.fit(x = twitterDataset[1:NROW(Train), 1:22],
                                y = Train$Choice,
                                distribution="adaboost",
                                n.trees = 700,
                                shrinkage= 0.001,
                                interaction.depth = 6,
                                n.minobs = 30,
                                verbose = TRUE

                               )
							   
best.iter = gbm.perf(model)

gbm.plot(model)

#plotting graphs related to gbm
trellis.par.set(caretTheme())
plot(gbmFit2)


trellis.par.set(caretTheme())
plot(gbmFit2, metric = "Kappa")


trellis.par.set(caretTheme())
plot(gbmFit2, metric = "Kappa", plotType = "level",
     scales = list(x = list(rot = 90)))


summary(gbmFit2)

ggplot(gbmFit)