complete <- function(directory, id = 1:332) {
    setlist1 <- list.files((directory), pattern = "*.csv$", full.names = TRUE)
    poldata <- data.frame()
    for (i in id) {
        temps1 <- read.csv(setlist1[i])
        nobst <- sum(complete.cases(temps1))
        temps2 <- data.frame(i, nobst)
        poldata <- rbind(poldata, temps2)
    }
    colnames(poldata) <- c("id", "nobs")
    poldata
}

