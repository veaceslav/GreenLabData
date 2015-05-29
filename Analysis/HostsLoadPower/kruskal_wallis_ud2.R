prepareKruskal<-function(){
  #Ecommerce
  wattsupcommerce<-read.csv2("ud2_ecommerce_load.csv")
  
  wattsupcommerce <- data.frame(wattsupcommerce[16])
  wattsupcommerce["Testtype"]<- NA
  wattsupcommerce$Testtype[1:111]<-"Ecommerce" 
  
  #Mail 
  wattsupmail<-read.csv2("ud2_exchange_load_2.csv")
  
  wattsupmail <- data.frame(wattsupmail[16])
  wattsupmail["Testtype"]<- NA
  wattsupmail$Testtype[1:103]<-"Mail" 
  
  #Olio 
  wattsupolio<-read.csv2("ud2_olio_load_1.csv")
 
  wattsupolio <- data.frame(wattsupolio[16])
  wattsupolio["Testtype"]<- NA
  wattsupolio$Testtype[1:111]<-"Olio"
  
  
  
  alldata<- rbind(wattsupolio,wattsupmail,wattsupcommerce)
  kruskal.test(alldata$Testtype ~alldata$Power_Mem, data =alldata)
  
  
  #this is for CPU
  
  #Ecommerce
  wattsupcommerce<-read.csv2("ud2_ecommerce_load.csv")
  
  wattsupcommerce <- data.frame(wattsupcommerce[17])
  wattsupcommerce["Testtype"]<- NA
  wattsupcommerce$Testtype[1:111]<-"Ecommerce" 
  
  #Mail 
  wattsupmail<-read.csv2("ud2_exchange_load_2.csv")
  
  wattsupmail <- data.frame(wattsupmail[17])
  wattsupmail["Testtype"]<- NA
  wattsupmail$Testtype[1:103]<-"Mail" 
  
  #Olio 
  wattsupolio<-read.csv2("ud2_olio_load_1.csv")
  
  wattsupolio <- data.frame(wattsupolio[17])
  wattsupolio["Testtype"]<- NA
  wattsupolio$Testtype[1:111]<-"Olio"
  
  
  
  alldata<- rbind(wattsupolio,wattsupmail,wattsupcommerce)
  kruskal.test(alldata$Testtype ~alldata$Power_CPU, data =alldata)
  
  #this is for HDD 5V++++++++++++++++++++++++++++++++++++++++++++++++++++
  
  
  #Ecommerce
  wattsupcommerce<-read.csv2("ud2_ecommerce_load.csv")
  
  wattsupcommerce <- data.frame(wattsupcommerce[18])
  wattsupcommerce["Testtype"]<- NA
  wattsupcommerce$Testtype[1:111]<-"Ecommerce" 
  
  #Mail 
  wattsupmail<-read.csv2("ud2_exchange_load_2.csv")
  
  wattsupmail <- data.frame(wattsupmail[18])
  wattsupmail["Testtype"]<- NA
  wattsupmail$Testtype[1:103]<-"Mail" 
  
  #Olio 
  wattsupolio<-read.csv2("ud2_olio_load_1.csv")
  
  wattsupolio <- data.frame(wattsupolio[18])
  wattsupolio["Testtype"]<- NA
  wattsupolio$Testtype[1:111]<-"Olio"
  
  
  
  alldata<- rbind(wattsupolio,wattsupmail,wattsupcommerce)
  kruskal.test(alldata$Testtype ~alldata$Power_HDD5, data =alldata)
  
  
  #this is for HDD 12V+++++++++++++++++++++++++++++++++++++++++++++++++++
  #Ecommerce
  wattsupcommerce<-read.csv2("ud2_ecommerce_load.csv")
  
  wattsupcommerce <- data.frame(wattsupcommerce[19])
  wattsupcommerce["Testtype"]<- NA
  wattsupcommerce$Testtype[1:111]<-"Ecommerce" 
  
  #Mail 
  wattsupmail<-read.csv2("ud2_exchange_load_2.csv")
  
  wattsupmail <- data.frame(wattsupmail[19])
  wattsupmail["Testtype"]<- NA
  wattsupmail$Testtype[1:103]<-"Mail" 
  
  #Olio 
  wattsupolio<-read.csv2("ud2_olio_load_1.csv")
  
  wattsupolio <- data.frame(wattsupolio[19])
  wattsupolio["Testtype"]<- NA
  wattsupolio$Testtype[1:111]<-"Olio"
  
  
  
  alldata<- rbind(wattsupolio,wattsupmail,wattsupcommerce)
  kruskal.test(alldata$Testtype ~alldata$Power_HDD12, data =alldata)
}