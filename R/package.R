#' install & library both summit
#'
#' @param package install & load
#' @return library
#' @export
package<-function(package,character.only=F,quietly=F,lib.loc=NULL,warn.conflicts=T)
{if(!character.only)
{package<-as.character(substitute(package))}
  loaded<-paste0('package:',package)%in%search()
  if(!loaded){
    if(!quietly){packageStartupMessage(gettextf("Loading required package: %s",package),domain=NA)}
    value<-tryCatch(library(package,lib.loc=lib.loc,character.only=T,logical.return=T,warn.conflicts=warn.conflicts,
                            quietly=quietly),error=function(e)e)
    if(inherits(value,'error')){

      if(!quietly){msg<-conditionMessage(value)
      cat("Failed with error: ",sQuote(msg),"\n",file=stderr(),sep="")
      .Internal(printDeferredWarnins())
      }
      return(invisible(FALSE))
    }
    if (!value) {
      install.packages(package)
      value<-tryCatch(library(package,lib.loc=lib.loc,character.only=T,logical.return=T,warn.conflicts=warn.conflicts,
                              quietly=quietly),error=function(e)e)
      return(invisible(FALSE))}
  }
  else value <- TRUE
  invisible(value)
}

#edit(utils:::install.packages)
