pollutantmean <- function(directory, pollutant = "sulfate", id = 1:332) {
  ## 'directory' is a character vector of length 1 indicating
  ## the location of the CSV files
  
  ## 'pollutant' is a character vector of length 1 indicating
  ## the name of the pollutant for which we will calculate the
  ## mean; either "sulfate" or "nitrate".
  
  ## 'id' is an integer vector indicating the monitor ID numbers
  ## to be used
  
  ## Return the mean of the pollutant across all monitors list
  ## in the 'id' vector (ignoring NA values)
  

  if(grep("specdata", directory) == 1) {
    directory <- ("./specdata/")
  }

  vector_med <- c()

  v_files <- as.character( list.files(directory) )
  f_path <- paste(directory, v_files, sep="")
  for(i in id) {
    current_file <- read.csv(f_path[i], header=T, sep=",")
    head(current_file)
    pollutant
    v_na_rem <- current_file[!is.na(current_file[, pollutant]), pollutant]
    vector_med <- c(vector_med, v_na_rem)
  }
  result <- mean(vector_med)
  return(round(result, 3)) 
}
