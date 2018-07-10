#' Read 'shp files' from 'folder' in 'working directory' and save.
#'
#' @param wd is working directory
#' @return print 'shp file' as 'list'
#' @examples
#' wd<-'C:/Users/changje/Desktop/shp'
#' b<-shp_all(wd)
#' plot(b[[1]])
#' package(ggmap)
#' kor<-fortify(b[[1]])
#' ggplot(data=kor,aes(x=long,y=lat,group=group, colour = id))+geom_polygon(fill = "#FFFFFF")
#' @export
shp_all<-function(wd,a=list())
{package(maptools)
package(stringr)
setwd(wd)
file<-list.files()
if(sum(str_detect(file,'.shp'))==0)
{filenames<-paste0(wd,'/',file)
for(i in 1:length(filenames)){
setwd(filenames[i])
list<-list.files()
a[[i]]<-readShapePoly(list[str_detect(list,".shp")][i])}
}else{list<-list.files(pattern = '.shp')
  for(i in 1:length(list))
a[[i]]<-readShapePoly(list[str_detect(list,".shp")][i])}
b<-a}


