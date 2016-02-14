# Reading train and test set

# Reading discrete data
traindata = read.csv("C:/Users/Shreya/Desktop/ML/mlproject/TrainD.csv")

testdata = read.csv("C:/Users/Shreya/Desktop/ML/mlproject/TestD.csv")


for(i in 1:23) 
{
  testdata[[i]] = as.factor(testdata[[i]])
}

#---------------------------------------------------------------------------------------------------

traindataNorm = read.csv("C:/Users/Shreya/Desktop/ML/mlproject/trainN.csv")

testdataNorm = read.csv("C:/Users/Shreya/Desktop/ML/mlproject/testN.csv")

#----------------------------------------------------------------------------------------------------

trainFeature11 = read.csv("C:/Users/Shreya/Desktop/ML/mlproject/trainNFeature11.csv")

testFeature11 = read.csv("C:/Users/Shreya/Desktop/ML/mlproject/testNFeature11.csv")

#-----------------------------------------------------------------------------------------------------

trainFeature6 = read.csv("C:/Users/Shreya/Desktop/ML/mlproject/trainNFeature6.csv")

testFeature6 = read.csv("C:/Users/Shreya/Desktop/ML/mlproject/testNFeature6.csv")
