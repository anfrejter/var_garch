# ESTIMATING VALUE-AT-RISK OF A PORTFOLIO WITH GARCH-FAMILY MODELS

Main aim of the project

The objective of this project is to estimate the Value-at-Risk (VaR) of a portfolio consisting of five financial instruments using two GARCH-family models. Specifically, we will utilize the GARCH and EGARCH models for this analysis.

The portfolio will include one equity index, one company stock, one currency pair, one commodity, and one cryptocurrency other than Bitcoin, with each instrument assigned an equal weight of 20% for each day of the analysis. Quotations for the equity index can be sourced from www.stooq.com, and cryptocurrency data can be obtained from www.coinmarketcap.com. Alternatively, both data sets can be downloaded using the getSymbols() function from the R package quantmod.

Our analysis will involve a comparison of the annualized conditional standard deviation estimates produced by the two models in the in-sample period. Additionally, we will compare the Value-at-Risk estimates produced by the two models in the out-of-sample period using a rolling approach. This comprehensive analysis will provide insights into the performance and reliability of the GARCH and EGARCH models in estimating VaR for a diverse portfolio.
