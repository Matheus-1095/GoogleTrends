library(gtrendsR)
library(reshape2)
library(plotly)
library(ggplot2)

google.trends = gtrends(c("blu-ray"), gprop = "web", time = "all")[[1]]
google.trends = gtrends(c("Shopper"), gprop = "web", time = "all")[[1]]
google.trends = dcast(google.trends, date ~ keyword + geo, value.var = "hits")
rownames(google.trends) = google.trends$date

ggplot(data = google.trends, aes(x = google.trends$date, y = google.trends$Shopper_world))+
  geom_line(color = "#00AFBB", size = 1.5)

google.trends = gtrends(c("Shopper"), geo = c("BR"), time = "all")[[1]]

br_trends = ggplot(data = google.trends, aes(x = google.trends$date, y = google.trends$hits))+
  geom_line(color = "#FC4E07", size = 1)

plotly(br_trends)

library(gtrendsR)
geo.codes = sort(unique(countries[substr(countries$sub_code, 1, 2) == "IT", ]$sub_code))
