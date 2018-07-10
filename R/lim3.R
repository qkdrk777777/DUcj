#' lim j.h3
#'
#' @return overlab of plot
#' @export
qq3<-function(){


  library(DUcj)
  package(devtools)
  package(httr)
  package(rvest)
  package(tuneR)
  package(seewave)
  package(jpeg)
    i=sample(1:12,1)
  while(i%in%1:12){
    i=sample(1:12,1)
        play(get(paste0(i,'wav')))

  }

}

#
# library(plotrix)
#
# library(plyr)
# library(DUcj)
#
# library(jpeg)
# qq2()
# setwd('C:/Users/qkdrk/Desktop')
# fimage<-read("DUcj_2.jpg")
# image(fimage[,,3])
# image(fimage)

# setwd('C:/Users/qkdrk/Downloads/비명소리')
# ls=list.files()

# for( i in 1: length(ls))
# assign(paste0(i,'wav'),  readWave(ls[i]))
# setwd('D:/packages/DUcj')
# devtools::use_data(`12wav`, internal = F,overwrite=T)
