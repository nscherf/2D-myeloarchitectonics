library(movMF)
library(plyr)
datadir="~/Dropbox/work/MPI-CBS/orientation-analysis-2D/results/orientation-samples/"
fileNames=list.files(datadir,full.names = TRUE)

fitMixvM <- function(name){
  orientations <- read.csv(name, header = FALSE)
  x<-as.matrix(orientations[,1:2])
  res <- movMF(x, 2)
  labels <- predict(res)
  orientations$label = labels
  write.csv(orientations, file=name, row.names = FALSE, col.names = FALSE)
}

typeof(fileNames)

fileNames[2]

read.csv(fileNames[5], header = FALSE)

fitMixvM(fileNames[5])

tryapply(fileNames, fitMixvM)

write.csv(predict(res),file="~/Desktop/test5.csv",row.names = FALSE)

fitMixvM(fileNames[5])

orientations <- read.csv(fileNames[1], header = FALSE)
labels <- predict(res)
orientations$label = labels

x<-as.matrix(orientations[,1:2])
res <- movMF(x, 2)
coef(res)

# test from documentation
mu <- rbind(c(-0.251, -0.968),
            c(0.399, 0.917))
kappa <- c(4,4)
theta <- kappa * mu
theta
alpha <- c(0.48, 0.52)
set.seed(123)
x <- rmovMF(50, theta, alpha)
x
y2 <- movMF(x, 2, nruns = 10)
y2
table(True = attr(x, "z"), Fitted = predict(y2))
