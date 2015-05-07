# [==============================================================================
# [== DATE..: 2015-03-27
# [== AUTHOR: VITOR FLISCH CAVALANTI
# [== GOAL..: EXTRACT INFORMATION OF THE COMENTARIOS DATABASE (SERVER POSEIDON)
# [==         TO THE FILE COMENT_FILTERED.CSV
# [==============================================================================

# load library
library(RODBC)

# create connection channel
channel <- odbcConnect("COMENTARIOS", uid="usr_bisrel", pwd="bisrel111");

# execute query
p <- sqlQuery(channel, "SELECT * FROM Coment_Relat");

# close connection channel to save memory
close(channel);

# remove channel of the memory
rm(channel)

# execute filter to get only the >=2015 regs
p.filtered<-p[p$DT_H_INC>as.POSIXct(strptime("2015-01-01 00:00:00", "%Y-%m-%d %H:%M:%S")),]

# remove p of the memory
rm(p)

# set the directory
strDir<-"D:/R/work/"

# set the file name according to the sysdate
strFile<-paste(strDir,"Comentarios-",as.Date(Sys.time()),".csv",sep="")


# write csv file
write.csv(p.filtered,file=strFile)


# remove p.filtered
rm(p.filtered)
