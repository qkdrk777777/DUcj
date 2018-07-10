#' lim fuck
#'
#' @return overlab of plot
#' @export
lo<-function(){
  # setwd('../')
  # a<-paste0(getwd(),'/Desktop')
  # setwd(a)

  package(devtools)
  package(httr)
  package(rvest)
  package(tuneR)
  package(seewave)
  # package(OpenImageR)
  package(jpeg)
  h <- read_html('https://www.google.co.kr/search?rlz=1C1NHXL_koKR781KR781&tbm=isch&sa=1&ei=w6UKW_DCL8aM8wXktqLwAg&q=%ED%95%98%ED%8A%B8&oq=%ED%95%98%ED%8A%B8&gs_l=img.3..0l10.191988.193037.0.193205.4.4.0.0.0.0.123.443.1j3.4.0....0...1c.1j4.64.img..1.3.344....0.oToCETpBPg4')
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
    Sys.sleep(2)
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
