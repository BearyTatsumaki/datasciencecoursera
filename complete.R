complete <- function(directory, id = 1:332)
{
        data <- c()
        idframe <- c()
        #for loop takes x in an array, not just a value
       for(x in id)
       {
        #formatC adds the excess 0's in front of the id value
        file <- paste(getwd(), "/", directory, "/", formatC(x, 2,flag = 0), ".csv", sep = "")
        
        #reading a file and creating a large data table
        lst <- lapply(file, data.table::fread)
        dt <- rbindlist(lst)
        
        #taking only complete cases without na
        dt <- dt[complete.cases(dt)]
        
        #storing the id s and the calues in arrays to be added later
        #to the data frame
        idframe <- c(idframe, x)
        data <- c(data, nrow(dt))
       }
        
    #adding the id and values into a dataframe and returning it    
    dframe <- data.frame(id = idframe, nobs = data)
    dframe
}
