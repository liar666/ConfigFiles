.First <- function() {
    # Reload last typed commands
    if (!any(commandArgs()=='--no-readline') && interactive()){
        require(utils)
        try(loadhistory(Sys.getenv("R_HISTFILE")))
    }
    #library(graphics)
    options(quiet=TRUE)
    # Prevent the printing of "+" when R waits for new input => allows copy/paste
    # from R to $EDITOR
    options(continue=" ")
    # Set the default repository to be Lyon1
    options(repos=c("http://cran.univ-lyon1.fr", "http://cran.irsn.fr"))
    # More error be more verbose
    options(showWarnCalls=T, showErrorCalls=T)

    .libPaths("~/.R/amd64-portbld-freebsd10.1-library/3.2.2")

#    library(plyr)
#        library(RJDBC)   # For DB connection
#        library("Rgtk2") # For graphics
#        library(gtools)  # For permutations
#        library(RWeka)   # For MachineLearning
#        library(rJava)   # For connection with Java
#        library(tsne)    # For data visualization
}

# Does not ask for saving
# Override q() to not save by default.
# Same as saying q("no")
q <- function (save="no", ...) {
  quit(save=save, ...)
}

# Set width and add date+color to the prompt
updatePrompt <- function(...)
{
    # Add Time + Colors
    options(menu.graphics=FALSE,
            prompt=paste("\001\033[1m\033[38;5;220m\002", format(Sys.time(),"%H:%M:%S"), "R > \001\033[0m\002")) ;
#           prompt=paste("\001\033[01;32m\002", format(Sys.time(),"%H:%M:%S"), "R > \001\033[00m\002")) ;

#    # Get current # of columns in the term
#    howWide <- system("stty -a | head -n 1 | awk '{print $7}' | sed 's/;//'", intern=T) ;
#    options(width=as.integer(howWide)) ;

    return(invisible(TRUE)) ;
}
updatePrompt() ;
invisible(addTaskCallback(updatePrompt)) ;

# Some useful aliases
cd <- setwd
pwd <- getwd
lss <- dir

# Use Xpdf as the pdf viewer
options("pdfviewer"="xpdf")
# Use Firefox as the html viewer
options("htmlviewer"="firefox -new-tab")
# Use Firefox as the browser
options("browser"="firefox -new-tab")

# Set proxy for all web requests
#Sys.setenv(http_proxy="http://cache.polytechnique.fr:8080/")
#Sys.setenv(https_proxy="http://cache.polytechnique.fr:8080/")
#Sys.setenv(ftp_proxy="http://cache.polytechnique.fr:8080/")
#Sys.setenv(no_proxy="localhost,127.0.0.1,*.example.com")

# Does not work!
.Last <- function() {
        if (!any(commandArgs()=='--no-readline') && interactive()){
                require(utils)
                try(savehistory(Sys.getenv("R_HISTFILE")))
        }
}
