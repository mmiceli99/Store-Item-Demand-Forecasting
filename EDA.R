library(tidyverse)
library(vroom)
library(tidymodels)
library(timetk)
library(gridExtra)

train <- vroom("./train.csv")
test <- vroom("./test.csv")

storeItemTrain %>%
plot_time_series(dateVar, responseVar, .interactive=FALSE)






nStores <- max(train$store)
nItems <- max(train$item)
for(s in 1:nStores){
  for(i in 1:nItems){
    storeItemTrain <- train %>%
    filter(store==s, item==i)
    storeItemTest <- test %>%
    filter(store==s, item==i)
    
    storeItemTrain %>%
      plot_time_series(storeItemTrain$date, storeItemTrain$sales, .interactive=FALSE)
    
    ## Fit storeItem models here
    
    ## Predict storeItem sales
    
    ## Save storeItem predictions
    #if(s==1 & i==1){
    #  all_preds <- preds
    #} else {
    #  all_preds <- bind_rows(all_preds, preds)
    #}
    
  }
}


storeItemTrain <- train %>%
  filter(store==1, item==1) 

store1_item1 <- storeItemTrain %>%
  plot_time_series(storeItemTrain$date, storeItemTrain$sales, .interactive=FALSE) + ggtitle('Store 1, Item 1')

storeItemTrain <- train %>%
  filter(store==1, item==2) 

store1_item2 <- storeItemTrain %>%
  plot_time_series(storeItemTrain$date, storeItemTrain$sales, .interactive=FALSE) + ggtitle('Store 1, Item 2')

storeItemTrain <- train %>%
  filter(store==1, item==3) 

store1_item3 <- storeItemTrain %>%
  plot_time_series(storeItemTrain$date, storeItemTrain$sales, .interactive=FALSE) + ggtitle('Store 1, Item 3')

storeItemTrain <- train %>%
  filter(store==1, item==4) 

store1_item4 <- storeItemTrain %>%
  plot_time_series(storeItemTrain$date, storeItemTrain$sales, .interactive=FALSE) + ggtitle('Store 1, Item 4')

grid.arrange(store1_item1, store1_item2, store1_item3, store1_item4, nrow = 2)