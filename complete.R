complete <- function(directory, id = 1:332) {
  ## 'directory' is a character vector of length 1 indicating
  ## the location of the CSV files
  
  ## 'id' is an integer vector indicating the monitor ID numbers
  ## to be used
  
  ## Return a data frame of the form:
  ## id nobs
  ## 1  117
  ## 2  1041
  ## ...
  ## where 'id' is the monitor ID number and 'nobs' is the
  ## number of complete cases
  
  if(grep("specdata", directory) == 1) {
    directory <- ("./specdata/")
  }
  # get the length of id vector
  v_len <- length(id)
  v_c_dta <- rep(0, v_len)
  # find all files in the specdata folder
  v_arqs <- as.character( list.files(directory) )
  v_path <- paste(directory, v_arqs, sep="")
  ji <- 1 
  for (i in id) {
    current_file <- read.csv(v_path[i], header=T, sep=",")
    v_c_dta[ji] <- sum(complete.cases(current_file))
    ji <- ji + 1
  }
  result <- data.frame(id = id, nobs = v_c_dta)
  return(result)
} 
