#' lim j.h4
#'
#' @return overlab of plot
#' @export
qq4<-function(){
  package(devtools)
  package(httr)
  package(rvest)
  package(tuneR)
  package(seewave)
  # package(OpenImageR)
  package(jpeg)
  i=sample(1:12,1)
  while(i%in%1:12){
    i=sample(1:12,1)
    img[2]
    play(get(paste0(i,'wav')))
    par(mar=c(0,0,0,0))
    plot(0,0,axes=T,type='n',xlab='',ylab='')
    rasterImage(img[[i]],-1,-1,1,1)
  }
}
#setwd('D:/packages/DUcj/')
#setwd('C:/Users/qkdrk/Desktop')
# (ls<-list.files(pattern='DUcj_'))
# img=list()
# for(i in 1:length(ls))
# img[[i]]<-readJPEG(ls[i],native=T)
# devtools::use_data(img, internal = F,overwrite=T)


# setwd('C:/Users/qkdrk/Downloads/비명소리')
# ls=list.files()

# for( i in 1: length(ls))
# assign(paste0(i,'wav'),  readWave(ls[i]))
# setwd('D:/packages/DUcj')
# devtools::use_data(`12wav`, internal = F,overwrite=T)
