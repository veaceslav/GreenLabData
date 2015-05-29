OverheadUD2<-function(){
  
  #Poweroff
  
  UD2offmem<-read.csv2("ud2_poweroff.csv")
  UD2offmem <- data.frame(UD2offmem[16])
  UD2offmem["Testtype"]<- NA
  UD2offmem$Testtype[1:108]<-"Off"
  
  UD2offcpu<-read.csv2("ud2_poweroff.csv")
  UD2offcpu <- data.frame(UD2offcpu[17])
  UD2offcpu["Testtype"]<- NA
  UD2offcpu$Testtype[1:108]<-"Off"
  
  UD2offhdd5<-read.csv2("ud2_poweroff.csv")
  UD2offhdd5 <- data.frame(UD2offhdd5[18])
  UD2offhdd5["Testtype"]<- NA
  UD2offhdd5$Testtype[1:108]<-"Off"
  
  UD2offhdd12<-read.csv2("ud2_poweroff.csv")
  UD2offhdd12 <- data.frame(UD2offhdd12[19])
  UD2offhdd12["Testtype"]<- NA
  UD2offhdd12$Testtype[1:108]<-"Off"
  
  #Ecommerce
  
  Ecommmem<-read.csv2("ud2_ecommerce_idle.csv")
  Ecommmem <- data.frame(Ecommmem[16])
  Ecommmem["Testtype"]<- NA
  Ecommmem$Testtype[1:112]<-"Ecommerce"
  
  Ecommcpu<-read.csv2("ud2_ecommerce_idle.csv")
  Ecommcpu <- data.frame( Ecommcpu[17])
  Ecommcpu["Testtype"]<- NA
  Ecommcpu$Testtype[1:112]<-"Ecommerce"
  
  Ecommhdd5<-read.csv2("ud2_ecommerce_idle.csv")
  Ecommhdd5 <- data.frame(Ecommhdd5[18])
  Ecommhdd5["Testtype"]<- NA
  Ecommhdd5$Testtype[1:112]<-"Ecommerce"
  
  Ecommhdd12<-read.csv2("ud2_ecommerce_idle.csv")
  Ecommhdd12 <- data.frame(Ecommhdd12[19])
  Ecommhdd12["Testtype"]<- NA
  Ecommhdd12$Testtype[1:112]<-"Ecommerce"
  
  #Olio
  
  Oliomem<-read.csv2("ud2_olio_idle_1.csv")
  Oliomem <- data.frame(Oliomem[16])
  Oliomem["Testtype"]<- NA
  Oliomem$Testtype[1:111]<-"Olio"
  
  Oliocpu<-read.csv2("ud2_olio_idle_1.csv")
  Oliocpu <- data.frame(  Oliocpu[17])
  Oliocpu["Testtype"]<- NA
  Oliocpu$Testtype[1:111]<-"Olio"
  
  Oliohdd5<-read.csv2("ud2_olio_idle_1.csv")
  Oliohdd5 <- data.frame(Oliohdd5[18])
  Oliohdd5["Testtype"]<- NA
  Oliohdd5$Testtype[1:111]<-"Olio"
  
  Oliohdd12<-read.csv2("ud2_olio_idle_1.csv")
  Oliohdd12 <- data.frame( Oliohdd12[19])
  Oliohdd12["Testtype"]<- NA
  Oliohdd12$Testtype[1:111]<-"Olio"
  
  #Mail
  
  Mailmem<-read.csv2("ud2_exchange_idle_1.csv")
  Mailmem <- data.frame( Mailmem[16])
  Mailmem["Testtype"]<- NA
  Mailmem$Testtype[1:110]<-"Mail"
  
  Mailcpu<-read.csv2("ud2_exchange_idle_1.csv")
  Mailcpu <- data.frame(  Mailcpu[17])
  Mailcpu["Testtype"]<- NA
  Mailcpu$Testtype[1:110]<-"Mail"
  
  Mailhdd5<-read.csv2("ud2_exchange_idle_1.csv")
  Mailhdd5 <- data.frame(Mailhdd5[18])
  Mailhdd5["Testtype"]<- NA
  Mailhdd5$Testtype[1:110]<-"Mail"
  
  Mailhdd12<-read.csv2("ud2_exchange_idle_1.csv")
  Mailhdd12 <- data.frame( Mailhdd12[19])
  Mailhdd12["Testtype"]<- NA
  Mailhdd12$Testtype[1:110]<-"Mail"
  
  
  EcommOffMem=rbind(UD2offmem,Ecommmem)
  kruskal.test(EcommOffMem$Testtype~EcommOffMem$Power_Mem,data =EcommOffMem)
  OlioOffMem=rbind(UD2offmem,Oliomem)
  kruskal.test(OlioOffMem$Testtype~OlioOffMem$Power_Mem,data =OlioOffMem)
  MailOffMem=rbind(UD2offmem,Mailmem)
  kruskal.test(MailOffMem$Testtype~MailOffMem$Power_Mem,data =MailOffMem)
  
  EcommOffMem=rbind(UD2offmem,Ecommmem)
  kruskal.test(EcommOffMem$Testtype~EcommOffMem$Power_Mem,data =EcommOffMem)
  OlioOffMem=rbind(UD2offmem,Oliomem)
  kruskal.test(OlioOffMem$Testtype~OlioOffMem$Power_Mem,data =OlioOffMem)
  MailOffMem=rbind(UD2offmem,Mailmem)
  kruskal.test(MailOffMem$Testtype~MailOffMem$Power_Mem,data =MailOffMem)
  
  EcommOffcpu=rbind(UD2offcpu,Ecommcpu)
  kruskal.test(EcommOffcpu$Testtype~EcommOffcpu$Power_CPU,data =EcommOffcpu)
  OlioOffcpu=rbind(UD2offcpu,Oliocpu)
  kruskal.test(OlioOffcpu$Testtype~OlioOffcpu$Power_CPU,data =OlioOffcpu)
  MailOffcpu=rbind(UD2offcpu,Mailcpu)
  kruskal.test(MailOffcpu$Testtype~MailOffcpu$Power_CPU,data =MailOffcpu)
  
  EcommOffhdd5=rbind(UD2offhdd5,Ecommhdd5)
  kruskal.test(EcommOffhdd5$Testtype~EcommOffhdd5$Power_HDD5,data =EcommOffhdd5)
  OlioOffhdd5=rbind(UD2offhdd5,Oliohdd5)
  kruskal.test(OlioOffhdd5$Testtype~OlioOffhdd5$Power_HDD5,data =OlioOffhdd5)
  MailOffhdd5=rbind(UD2offhdd5,Mailhdd5)
  kruskal.test(MailOffhdd5$Testtype~MailOffhdd5$Power_HDD5,data =MailOffhdd5)

  EcommOffhdd12=rbind(UD2offhdd12,Ecommhdd12)
  kruskal.test(EcommOffhdd12$Testtype~EcommOffhdd12$Power_HDD12,data =EcommOffhdd12)
  OlioOffhdd12=rbind(UD2offhdd12,Oliohdd12)
  kruskal.test(OlioOffhdd12$Testtype~OlioOffhdd12$Power_HDD12,data =OlioOffhdd12)
  MailOffhdd12=rbind(UD2offhdd12,Mailhdd12)
  kruskal.test(MailOffhdd12$Testtype~MailOffhdd12$Power_HDD12,data =MailOffhdd12)
  }