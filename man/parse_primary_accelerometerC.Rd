% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/RcppExports.R
\name{parse_primary_accelerometerC}
\alias{parse_primary_accelerometerC}
\title{Parse all primary accelerometer packets in a file}
\usage{
parse_primary_accelerometerC(primary_records, log, scale_factor, samp_rate,
  verbose)
}
\arguments{
\item{primary_records}{DataFrame with information about each packet}

\item{log}{RawVector containing all payload bytes}

\item{scale_factor}{the accelerometer scale factor}

\item{samp_rate}{the sampling rate}

\item{verbose}{logical. Print updates to console?}
}
\description{
Parse all primary accelerometer packets in a file
}
\keyword{internal}
