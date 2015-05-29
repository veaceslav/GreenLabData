KruskalOverhead<-function(){
  
  HostVmoff <-read.csv2("hostvm_cpu_power_off.csv")
  HostVmoff <- data.frame(HostVmoff[1])
  HostVmoff["Testtype"]<- NA
  HostVmoff$Testtype[1:120]<-"off"
  
  HostEcomIdl<-read.csv("hostvm_cpu_power_ecommerce_idle.csv")
  HostEcomIdl <- data.frame(HostEcomIdl[3])
  HostEcomIdl["Testtype"]<- NA
  HostEcomIdl$Testtype[1:120]<-"Ecommerce"
  
  overhead <- rbind(HostVmoff,HostEcomIdl)
  kruskal.test(overhead$Testtype ~overhead$POWER, data =overhead)
  
  #+++++++++++++++++++++++++++++++++++Olio+++++++++++++++++++++++++++++++++++++
  HostOlioIdl<-read.csv("hostvm_cpu_power_olio_idle.csv")
  HostOlioIdl <- data.frame(HostOlioIdl[3])
  HostOlioIdl["Testtype"]<- NA
  HostOlioIdl$Testtype[1:120]<-"Olio"
  
  overhead <- rbind(HostVmoff,HostOlioIdl)
  kruskal.test(overhead$Testtype ~overhead$POWER, data =overhead)
  #+++++++++++++++++++++++++++++++++++++MAIL++++++++++++++++++++++++++++++++++++
  
  HostMailIdl<-read.csv("hostvm_cpu_power_mail_idle.csv")
  HostMailIdl <- data.frame(HostMailIdl[3])
  HostMailIdl["Testtype"]<- NA
  HostMailIdl$Testtype[1:120]<-"Mail"
  
  overhead <- rbind(HostVmoff,HostMailIdl)
  kruskal.test(overhead$Testtype ~overhead$POWER, data =overhead)
  
  

}