corr <- function(directory, threshold = 0) { 
    setlist1 <- list.files((directory), pattern = "*.csv$", full.names = TRUE)
    poldata <- vector(mode = "numeric", length = 0)
    
    for (i in 1:length(setlist1)) {
        moni_i <- read.csv(setlist1[i])
        csum <- sum((!is.na(moni_i$sulfate)) & (!is.na(moni_i$nitrate)))
        if (csum > threshold) {
            tmp <- moni_i[which(!is.na(moni_i$sulfate)), ]
            submoni_i <- tmp[which(!is.na(tmp$nitrate)), ]
            poldata <- c(poldata, cor(submoni_i$sulfate, submoni_i$nitrate))
        }
    }
    
    poldata
}