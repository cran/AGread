% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/0b_Package_Doc.R
\name{AGread}
\alias{AGread}
\title{AGread: Read Data Files from ActiGraph Monitors}
\description{
This provides support for reading ActiGraph files of various modes into 'R'.
Functions are provided to read and minimally pre-process the following:
binary data (\code{.gt3x} format), activity count data (\code{.agd} and
\code{.csv} formats), and raw data from primary accelerometer and inertial
measurement unit files (\code{RAW.csv} and \code{IMU.csv} formats,
respectively). More information about \code{.gt3x} file formats can be found
\href{https://github.com/actigraph/GT3X-File-Format}{here}.
}
\section{Core functions}{

\code{\link{read_AG_counts}}

\code{\link{read_AG_raw}}

\code{\link{read_AG_IMU}}

\code{\link{read_gt3x}}
}

\examples{
\donttest{
AG_counts <- read_AG_counts(
  system.file(
  "extdata",
  "example1sec.csv",
  package = "AGread"
  ),
  header = TRUE
)
AG_RAW <- read_AG_raw(
  system.file(
  "extdata",
  "exampleRAW.csv",
  package = "AGread"
  )
)
AG_IMU <- read_AG_IMU(
  system.file(
  "extdata",
  "example-IMU.csv",
  package = "AGread"
  )
)
file_3x <- system.file(
  "extdata", "example.gt3x", package = "AGread"
)
AG_3x <- read_gt3x(file_3x)

head(AG_counts)
head(AG_RAW)
head(AG_IMU)
head(lapply(AG_3x, head))
}

}
