#!/usr/bin/env Rscript
# R script to install requirements for exercises -------------------------------

pkgs <- c("devtools", "remotes",
          "BiocManager", "dplyr","renv"
)

## install Bioconductor --------------------------------------------------------
if (!require("BiocManager", quietly = TRUE)) {
  install.packages("BiocManager")
}

## install and check package loading -------------------------------------------
for (pkg in basename(pkgs)) {
  BiocManager::install(pkg, ask = FALSE, update = FALSE)
  
  if (!library(pkg, character.only = TRUE, logical.return = TRUE)) {
    write(
      paste0(
        "Installation of package ",
        pkg,
        " exited with non-zero exit status"
      ),
      stdout()
    )
    quit(status = 1, save = "no")
  }
}
# Seurat from source
install.packages("Seurat", repos = "https://cran.rstudio.com", type = "source")

# STACAS for integration:
remotes::install_github("carmonalab/STACAS", type = "source")
