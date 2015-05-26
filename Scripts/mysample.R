getsamples<-function(data)
{
  nm <- do.call(rbind, strsplit(data$X.1, "\\."))[,1]
  nm <- unique(nm)
  means <- data.frame()
  col_names <- ""
  for(i in 1:length(nm))
  {    
    data_1 <- data[grep(paste("^",nm[i],sep=''), data$X.1),]
    if(length(col_names)==0) col_names<-names(data_1[,1-16])
    mfd <- data_1[,1-16]
    col_means <- colMeans(mfd)
    means<- rbind(means, col_means)     
  }
  names(means) <- col_names
  means<- cbind(means,nm)
  return(means)
}