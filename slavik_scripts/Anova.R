dataSetup<-function(){
  wattsupcommerce<-read.csv("wr_ecommerce_load.TXT", sep="", header=T, row.names=NULL, stringsAsFactors=FALSE)
  
  #convert the timestamp in suitable format
  Timestamp<-as.POSIXct(as.numeric(wattsupcommerce[,1])*24*3600, origin="1899-12-30 00:00:00.000", tz="UTC")
  
  #subset the energy data, add the timestamp as first column
  wattsupcommerce <- data.frame(Timestamp, wattsupcommerce[2])
  
  #a bit messy: we have to specify that the files have the same year
  a <- as.POSIXlt(Timestamp)$year[1]
  b <- perfData$Timestamp
  b$year <- a
  perfData$Timestamp <- b
  
  #again, a bit messy: we have to convert to strings and reconvert into POSIXlt to enable merging
  wattsupData$Timestamp <- strftime(wattsupData$Timestamp, "%Y-%m-%d %H:%M:%S", tz="UTC")
  wattsupData$Timestamp <- strptime(wattsupData$Timestamp, "%Y-%m-%d %H:%M:%S", tz="UTC")
  
  #finally, we can merge the data
  practiceData<-merge(wattsupData, perfData, all=FALSE, sort=FALSE)
  
  #and return it
  return(practiceData)
}
