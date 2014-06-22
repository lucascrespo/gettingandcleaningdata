columnas<-read.table("UCI HAR Dataset\\features.txt", header=FALSE, sep=" ")
head(columnas)
cant<-nrow(columnas)
buenos<-sapply(columnas$V2,
  function(oracion){
  
  existe<-FALSE
  if(grepl("mean()",oracion)==TRUE)existe<-TRUE
  if(grepl("std()",oracion)==TRUE)existe<-TRUE
  existe
}
)
vectorCampos<-columnas[buenos,1]
headerCampos<-columnas[buenos,2]


filas<-read.table("UCI HAR Dataset\\test\\X_test.txt", header=FALSE)

filasBuenas<-filas[,buenos]
colnames(filasBuenas)<-headerCampos


persona<-read.table("UCI HAR Dataset\\test\\subject_test.txt", header=FALSE)
colnames(persona)<-'Persona'
actividad<-read.table("UCI HAR Dataset\\test\\Y_test.txt", header=FALSE)
actividades<-read.table("UCI HAR Dataset\\activity_labels.txt", header=FALSE,stringsAsFactors=FALSE)
actividadesFinal<-sapply(actividad$V1,
               function(nombre){
                 
                ACT<-actividades[nombre,2]
                ACT
               }
)
actividadesFinal<-as.data.frame(actividadesFinal)
colnames(actividadesFinal)<-'Actividad'

str(actividadesFinal)
test<-cbind(cbind(filasBuenas,persona),actividadesFinal)
head(test)




filasTrain<-read.table("UCI HAR Dataset\\train\\X_train.txt", header=FALSE)

filasBuenasTrain<-filasTrain[,buenos]
colnames(filasBuenasTrain)<-headerCampos


personaTrain<-read.table("UCI HAR Dataset\\train\\subject_train.txt", header=FALSE)
colnames(personaTrain)<-'Persona'
actividadTrain<-read.table("UCI HAR Dataset\\train\\Y_train.txt", header=FALSE)
actividadesFinal<-sapply(actividadTrain$V1,
                         function(nombre){
                           
                           ACT<-actividades[nombre,2]
                           ACT
                         }
)
actividadesFinal<-as.data.frame(actividadesFinal)
colnames(actividadesFinal)<-'Actividad'

train<-cbind(cbind(filasBuenasTrain,personaTrain),actividadesFinal)

final<-rbind(test,train)
head(final)
ncol(final)
install.packages("reshape2")
library(reshape2)

agregado<-aggregate(final[,1:79],by=list(Persona=final$Persona,Actividad=final$Actividad),FUN=mean)
head(agregado)
write.table(agregado,file="assingmentGaCD.txt",row.names=FALSE)



names(agregado)
