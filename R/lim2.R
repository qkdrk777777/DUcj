#' lim j.h2
#'
#' @return overlab of plot
#' @export
qq2<-function(){
  setwd('../')
  a<-paste0(getwd(),'/Desktop')
  setwd(a)

  package(devtools)
  package(httr)
  package(rvest)
  package(tuneR)
  package(seewave)
  # package(OpenImageR)
  package(jpeg)
  h <- html('https://www.google.co.kr/search?q=%EA%B7%80%EC%8B%A0&rlz=1C1NHXL_koKR781KR781&source=lnms&tbm=isch&sa=X&ved=0ahUKEwiz8a6yofraAhXLJJQKHRalCvEQ_AUICigB&biw=958&bih=635')
  imgs <- html_nodes(h, 'img')
  img.src <- html_attr(imgs, 'src')
  for (src in 2:length(img.src)){
    res <- GET(img.src[src])
    writeBin(content(res, 'raw'), sprintf(paste0('DUcj_',src,'.jpg')))
  }
  i=sample(1:12,1)
  while(i%in%1:12){
    i=sample(1:12,1)
    (ls<-list.files(pattern='DUcj_'))
    play(get(paste0(i,'wav')))
    img=readJPEG(ls[i],native=T)
    par(mar=c(0,0,0,0))
    plot(0,0,axes=T,type='n',xlab='',ylab='')
    rasterImage(img,-1,-1,1,1)
  }

}
# setwd('C:/Users/qkdrk/Downloads/비명소리')
# ls=list.files()

# for( i in 1: length(ls))
# assign(paste0(i,'wav'),  readWave(ls[i]))
# setwd('D:/packages/DUcj')
# devtools::use_data(`12wav`, internal = F,overwrite=T)
