prepareAnova<-function(){
  #Ecommerce
  wattsupcommerce<-read.csv("wr_ecommerce_load.TXT", sep="", header=T, row.names=NULL, stringsAsFactors=FALSE)
  
  wattsupcommerce <- data.frame(wattsupcommerce[2])
  wattsupcommerce["Testtype"]<- NA
  wattsupcommerce$Testtype[1:121]<-"Ecommerce" 
  
  #Mail 
  wattsupmail<-read.csv("wr_mail_load.TXT", sep="", header=T, row.names=NULL, stringsAsFactors=FALSE)
  
  wattsupmail <- data.frame(wattsupmail[2])
  wattsupmail["Testtype"]<- NA
  wattsupmail$Testtype[1:119]<-"Mail" 
  
  #Olio 
  wattsupolio<-read.csv("wr_olio_load.TXT", sep="", header=T, row.names=NULL, stringsAsFactors=FALSE)
 
  wattsupolio <- data.frame(wattsupolio[2])
  wattsupolio["Testtype"]<- NA
  wattsupolio$Testtype[1:106]<-"Olio"
  

  
  alldata<- rbind(wattsupolio,wattsupmail,wattsupcommerce)
  kruskal.test(alldata$Testtype ~alldata$Watts, data =alldata)
  
}