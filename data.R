###import data set and library----
library(tidyverse)
library(forecast)
library(tidyquant)
library(tsfknn)
library(prophet)

df<-tq_get(c("XRP-USD","MATIC-USD","BTC-USD","ADA-USD","ETH-USD" ,"BNB-USD" ,"USDT-USD") ,get = "stock.prices", from = "2020-01-01")

#fit the prophet model----
dataset<-data.frame(ds = df$date , y  = as.numeric(df$close))
prophet_1<-prophet(dataset)

#fit the forecast prophet model-----
future<- make_future_dataframe(prophet_1 , periods =30)
forecastprophet <-predict(prophet_1 , future)

#fit knn model----
dataset_knn<-data.frame(ds = df$date , y  = as.numeric(df$close))
predknn <- knn_forecasting(dataset_knn$y , h = 30 , lags = 1:30 , k = 3 , msas = "MIMO")


