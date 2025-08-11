#!/usr/bin/env Rscript
## Install the required packages
packages <- c(
   "praise"
)

cat("R version ",
    R.version$major, ".", R.version$minor, "\n",
    sep = "")

Rversion = paste(R.version$major,
                 sub("\\..*", "", R.version$minor),
                 sep = ".")
libLoc <- if(Sys.getenv("INSIDE_DOCKER") == "") {
             file.path("~", "R", "x86_64-pc-linux-gnu-library", Rversion)
          } else {
             "/usr/local/lib/R/site-library/"
          }
cat("Installing into", libLoc, "\n")
if(!dir.exists(libLoc)) {
   dir.create(libLoc, recursive = TRUE)
}

for(package in packages) {
   if(!require(package, character.only = TRUE,
               quietly = TRUE)) {
      cat("Package '", package, "' missing -> install it\n",
          sep = "",
          file = stderr())
      install.packages(package, libLoc,
                       Ncpus = parallel::detectCores(),
                       verbose = TRUE,
                       quiet = FALSE)
   }
}
