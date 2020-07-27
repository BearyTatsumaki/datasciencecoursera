corr <- function(directory, threshold = 0)
{
  id =  1:length(list.files(directory, pattern = 'csv'))
    arr <- c()
  for(x in id)
  {
    #formatC adds the excess 0's in front of the id value
    file <- paste(getwd(), "/", directory, "/", formatC(x, 2,flag = 0), ".csv", sep = "")
    
    #reading a file and creating a large data table
    lst <- lapply(file, data.table::fread)
    dt <- rbindlist(lst)
    
    #taking only complete cases without na
    dt <- dt[complete.cases(dt)]
    
    if(nrow(dt) > threshold)
    {
      arr <- c(arr, cor(dt$sulfate, dt$nitrate))
    }
    
  }
  arr
}
