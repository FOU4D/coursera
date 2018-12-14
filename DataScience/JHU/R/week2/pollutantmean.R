pollutantmean <- function(directory, pollutant, id = 1:332) {
	# set the directory location.
    setlist1 <- list.files((directory), pattern = "*.csv$", full.names = TRUE)
    # data frame for pollution data
    poldata <- data.frame()
    # going through the data
    for (i in id) {
        poldata <- rbind(poldata, read.csv(setlist1[i], header = TRUE))
    }
    # calculate the means
    mean(poldata[, pollutant], na.rm = TRUE)
}