# Decision Trees and Random Forests

install.packages(("rpart"))

library(rpart)

# rpart() fun used to build a decision tree

str(kyphosis)

head(kyphosis)

tree <- rpart(Kyphosis ~ . , method = "class", data = kyphosis)

printcp(tree)

# tree visualization

plot(tree, uniform = T, main = "Main Title")

text(tree, use.n = T, all = T)

# improve visual

install.packages("rpart.plot")

library(rpart.plot)

prp(tree)

# Random Forests

install.packages("randomForest")

library(randomForest)

model <- randomForest(Kyphosis ~ . , data = kyphosis)

print(model)

#Call:
# randomForest(formula = Kyphosis ~ ., data = kyphosis) 
# Type of random forest: classification
# Number of trees: 500
# No. of variables tried at each split: 1

#OOB estimate of  error rate: 19.75%
# Confusion matrix:
#  absent present class.error
# absent      60       4   0.0625000
# present     12       5   0.7058824

importance(model)

# MeanDecreaseGini
# Age            8.703010
# Number         5.429708
# Start          9.959737