OverheadWR<-function(){
  #Poweroff
  wattsupoff<-read.csv("wr_poweroff.TXT", sep="", header=T, row.names=NULL, stringsAsFactors=FALSE)
  
  wattsupoff <- data.frame(wattsupoff[2])
  wattsupoff["Testtype"]<- NA
  wattsupoff$Testtype[1:119]<-"Off"
  
  
  #Ecommerce
  wattsupcommerce<-read.csv("wr_ecommerce_idle.TXT", sep="", header=T, row.names=NULL, stringsAsFactors=FALSE)
  
  wattsupcommerce <- data.frame(wattsupcommerce[2])
  wattsupcommerce["Testtype"]<- NA
  wattsupcommerce$Testtype[1:119]<-"Ecommerce"
  overhead <- rbind(wattsupoff,wattsupcommerce)
  kruskal.test(overhead$Testtype ~overhead$Watts, data =overhead)
  
  #Olio
  wattsupolio<-read.csv("wr_olio_idle.TXT", sep="", header=T, row.names=NULL, stringsAsFactors=FALSE)
  
  wattsupolio <- data.frame(wattsupolio[2])
  wattsupolio["Testtype"]<- NA
  wattsupolio$Testtype[1:118]<-"Olio"
  overheads <- rbind(wattsupoff,wattsupolio)
  kruskal.test(overheads$Testtype ~overheads$Watts, data =overheads)
  
  #Mail
  
  wattsupmail<-read.csv("wr_mail_idle.TXT", sep="", header=T, row.names=NULL, stringsAsFactors=FALSE)
  
  wattsupmail <- data.frame(wattsupmail[2])
  wattsupmail["Testtype"]<- NA
  wattsupmail$Testtype[1:118]<-"Mail"
  overheadss <- rbind(wattsupoff,wattsupmail)
  kruskal.test(overheadss$Testtype ~overheadss$Watts, data =overheadss)
  
  
  
  
}