# Kaggle-Competition-Influencers-in-Social-Networks-Twitter-Dataset

Problem Statement
Given a test data point describing two users on twitter, predict who is popular.

Dataset Description
• The dataset has 22 features
o Each data point represents two users ‘A’ and ‘B’
o Both have 11 features
• Training set consists of 5500 data points
• Test set contains 5952 rows
• Binary classification problem
o Predicting human judgement on who is more influential ‘A’ or ‘B’.
o Class label 1 indicates ‘A’ is more popular
o Class label 0 indicates ‘B’ is more popular
• Data is human judged
o Train set has about 350 duplicates - Set of examples where all features have exactly similar values but class labels are different
• No class imbalance in train data
o Class Distribution: 48.83% (label 0) , 51.16% (label 1)

Feature Scaling
• Normalized data set using the standard normalization formula
o Re-scaling all features to the range [0, 1]

Performance Evaluation
• This is a standard Kaggle dataset. Hence, we do not have class labels in the test set.
• Kaggle uses AUC value as the evaluation metric which will be displayed after every submission.
• Model accuracy was measured using cross-validation techniques on train set.
• Each classifier’s prediction accuracy on test set has been evaluated with the help of Kaggle’s AUC metric.
