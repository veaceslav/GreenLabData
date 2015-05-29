prepareKruskal<-function(){
  #Ecommerce
  wattsupcommerce<-read.csv("hostvm_cpu_power_ecommerce.csv")
  
  wattsupcommerce <- data.frame(wattsupcommerce[3])
  wattsupcommerce["Testtype"]<- NA
  wattsupcommerce$Testtype[1:120]<-"Ecommerce" 
  
  #Mail 
  wattsupmail<-read.csv("hostvm_cpu_power_mail.csv")
  
  wattsupmail <- data.frame(wattsupmail[3])
  wattsupmail["Testtype"]<- NA
  wattsupmail$Testtype[1:120]<-"Mail" 
  
  #Olio 
  wattsupolio<-read.csv("hostvm_cpu_power_olio.csv")
  
  wattsupolio <- data.frame(wattsupolio[3])
  wattsupolio["Testtype"]<- NA
  wattsupolio$Testtype[1:120]<-"Olio"
  
  
  
  alldata<- rbind(wattsupolio,wattsupmail,wattsupcommerce)
  kruskal.test(alldata$Testtype ~alldata$POWER, data =alldata)
  
}