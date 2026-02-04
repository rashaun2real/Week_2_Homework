# Set CRAN mirror and disable scientific notation
options(repos = c(CRAN = "https://cloud.r-project.org"))
options(scipen = 999)

# Install remotes (required for GitHub installs)
if (!requireNamespace("remotes", quietly = TRUE)) {
  install.packages("remotes")
}

# Install mlba from GitHub (correct subdirectory)
if (!requireNamespace("mlba", quietly = TRUE)) {
  remotes::install_github("gedeck/mlba", subdir = "mlba", upgrade = "never")
}

# Load mlba
library(mlba)

# List of remaining required packages
pkgs <- c(
  "tidyverse",
  "Hmisc",
  "psych",
  "pastecs",
  "caret",
  "fastDummies",
  "e1071"
)

# Install any missing packages
missing <- setdiff(pkgs, rownames(installed.packages()))
if (length(missing) > 0) {
  install.packages(missing)
}

# Load all packages
invisible(lapply(pkgs, library, character.only = TRUE))

