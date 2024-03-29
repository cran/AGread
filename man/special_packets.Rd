% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/RcppExports.R
\name{blank_packet}
\alias{blank_packet}
\alias{latch_packet}
\title{Handle empty and latched packets}
\usage{
blank_packet(sample_rate, names)

latch_packet(last_packet, sample_rate)
}
\arguments{
\item{sample_rate}{int. the sampling rate}

\item{names}{CharacterVector. Names for the packet elements}

\item{last_packet}{the previous packet}
}
\description{
Handle empty and latched packets
}
\keyword{internal}
