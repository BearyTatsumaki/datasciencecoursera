pollutantmean <- function(directory, pollutant, id = 1:332)
{
  means_vector = c()
  for(x in id)
  {
    #formatC adds the excess 0's in front of the id value
    file <- paste(getwd(), "/", directory, "/", formatC(x, 2,flag = 0), ".csv", sep = "")
    file <- read.csv(file)
    data <- file[pollutant]
    means_vector <- c(means_vector, data[!is.na(data)])
  }
  mean(means_vector)
}
