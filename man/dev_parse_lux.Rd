% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/RcppExports.R
\name{dev_parse_lux}
\alias{dev_parse_lux}
\title{Parse a set of LUX packets}
\usage{
dev_parse_lux(packets, packet_no, zero_packet)
}
\arguments{
\item{packets}{list of packets}

\item{packet_no}{IntegerVector indicating which index of \code{packets} to
use for each second of expected output. Values of -1 indicate a latch to
the previous index}

\item{zero_packet}{list containing a properly-formatted packet pre-filled
with values of zero (used for USB connection events and possibly file starts)}
}
\description{
Parse a set of LUX packets
}
\keyword{internal}
