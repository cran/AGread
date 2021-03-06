% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/parse_log_bin_utils.R
\name{select_records}
\alias{select_records}
\title{Exclude record headers of types that are not listed in the \code{include}
argument of \code{\link{read_gt3x}}}
\usage{
select_records(record_headers, include)
}
\arguments{
\item{record_headers}{the record headers}

\item{include}{the packet types to include in output of
\code{\link{read_gt3x}}}
}
\description{
Exclude record headers of types that are not listed in the \code{include}
argument of \code{\link{read_gt3x}}
}
\keyword{internal}
