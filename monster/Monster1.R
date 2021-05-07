# Monster Kaggle Competition
# NOTE TO SELF: increase text size

library(tidyverse)
library(caret)

monster_train <- read.csv(".\\train.csv")
monster_test <- read.csv(".\\test.csv")

tc <- trainControl(method='repeatedcv',
                    number=5,
                    repeats=3)

# Grid <- expand.grid(k=1:10)

knn.model <- train(
  type ~ .,
  data = monster_train %>% select(-id),
  method = 'knn',
  metric='Accuracy',
  tuneLength = 5,
  trControl = tc
)

preds <- predict(knn_model, monster_train)
probs <- predict(knn.model, monster_test, type='prob')
sub <- bind_rows(probs, knn.model)
