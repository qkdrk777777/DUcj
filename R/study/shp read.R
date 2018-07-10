
package(maptools)
#by stingr package
package(stringr)

wd<-'C:/Users/changje/Desktop/shp'
setwd(wd)
file<-list.files()
filenames<-paste0(wd,'/',file)
setwd(filenames[1])
list<-list.files()
list[str_detect(list,".shp")]
readShapePoly()
a<-readShapePoly("TL_SCCO_CTPRVN.shp")
head(a)
plot(a)
