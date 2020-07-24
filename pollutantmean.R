pollutantmean <- function(directory, pollutant, id = 1:332)
{
  means_vector = c()
  for(x in id)
  {
    if(x < 10)
    {
      file <- paste(getwd(), "/00", x, ".csv", sep = "")
    }
    else if(x < 100)
    {
      file <- paste(getwd(), "/0", x, ".csv", sep = "")
    }
    else
    {
      file <- paste(getwd(), "/", x, ".csv", sep = "")
    }
    file <- read.csv(file)
    data <- file[pollutant]
    means_vector <- c(means_vector, data[!is.na(data)])
  }
  mean(means_vector)
}