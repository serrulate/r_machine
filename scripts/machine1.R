dependencies <- c(
  'tidyverse',
  'caret',
  'party'
)

for (pkg in dependencies){
  (library(pkg, character.only = TRUE))
}



path = box::file()
main_dir = dirname(path)
Rdata_dir = paste0(main_dir, "/data/rdata")
Pdata_dir =paste0(main_dir, "/data/pdata")
plot_dir = paste0(main_dir, "/plots")
markdown = paste0(main_dir, "/markdowns")


setwd(Rdata_dir)
dat <- read.csv("heart_disease_uci.csv")

names(dat)[[1]] <- "age"
dat$target <- recode(dat$target, `0` = 1L, `1` = 0L)


sapply(dat, function(x) table(is.na(x)))

table(duplicated(dat))
dat <- dat[!duplicated(dat),]
