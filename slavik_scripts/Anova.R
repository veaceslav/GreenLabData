prepareAnova<-function(){
  #Ecommerce
  wattsupcommerce<-read.csv("wr_ecommerce_load.TXT", sep="", header=T, row.names=NULL, stringsAsFactors=FALSE)
  Timestamp<-as.POSIXct(as.numeric(wattsupcommerce[,1])*24*3600, origin="1899-12-30 00:00:00.000", tz="UTC")
  wattsupcommerce <- data.frame(wattsupcommerce[2])
  wattsupcommerce["Testtype"]<- NA
  wattsupcommerce$Testtype[1:121]<-"Ecommerce" 
  
  #Mail 
  wattsupmail<-read.csv("wr_mail_load.TXT", sep="", header=T, row.names=NULL, stringsAsFactors=FALSE)
  Timestamp<-as.POSIXct(as.numeric(wattsupmail[,1])*24*3600, origin="1899-12-30 00:00:00.000", tz="UTC")
  wattsupmail <- data.frame(wattsupmail[2])
  wattsupmail["Testtype"]<- NA
  wattsupmail$Testtype[1:119]<-"Mail" 
  
  #Olio 
  wattsupolio<-read.csv("wr_olio_load.TXT", sep="", header=T, row.names=NULL, stringsAsFactors=FALSE)
  Timestamp<-as.POSIXct(as.numeric(wattsupolio[,1])*24*3600, origin="1899-12-30 00:00:00.000", tz="UTC")
  wattsupolio <- data.frame(wattsupolio[2])
  wattsupolio["Testtype"]<- NA
  wattsupolio$Testtype[1:106]<-"Olio"
  
  write.csv(alldata, "wattsup_alldata.csv")
  
  alldata<- rbind(wattsupolio,wattsupmail,wattsupcommerce)
  testVa <- aov(alldata$Watts ~ alldata$Testtype, data = alldata)
  tuck<- TukeyHSD(testVa)
  
}
