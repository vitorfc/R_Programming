corr <- function(directory, threshold = 0) {
  ## 'directory' is a character vector of length 1 indicating
  ## the location of the CSV files
  
  ## 'threshold' is a numeric vector of length 1 indicating the
  ## number of completely observed observations (on all
  ## variables) required to compute the correlation between
  ## nitrate and sulfate; the default is 0
  
  ## Return a numeric vector of correlations
  
  if(grep("specdata", directory) == 1) {
    directory <- ("./specdata/")
  }
  v_cpt_tab <- complete("specdata", 1:332)
  nobs <- v_cpt_tab$nobs

  ids <- v_cpt_tab$id[nobs > threshold]

  id_len <- length(ids)
  arr_vect <- rep(0, id_len)
  v_arqs <- as.character( list.files(directory) )
  v_path <- paste(directory, v_arqs, sep="")
  j <- 1
  for(i in ids) {
    v_arq_corrt <- read.csv(v_path[i], header=T, sep=",")
    arr_vect[j] <- cor(v_arq_corrt$sulfate, v_arq_corrt$nitrate, use="complete.obs")
    j <- j + 1
  }
  result <- arr_vect
  return(result)   
}
