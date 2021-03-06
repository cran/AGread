% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/Read_IMU_Utils.R
\name{imu_collapse}
\alias{imu_collapse}
\title{Collapse raw IMU data to a specified epoch}
\usage{
imu_collapse(AG, block_size, verbose = FALSE)
}
\arguments{
\item{AG}{dataframe containing raw IMU data}

\item{block_size}{number of samples per epoch}

\item{verbose}{A logical scalar: Print processing updates?}
}
\value{
dataframe of IMU data averaged over the specified epoch length
}
\description{
Collapse raw IMU data to a specified epoch
}
\examples{
data(imu_to_collapse)
collapsed <- imu_collapse(imu_to_collapse, 100)
head(collapsed)

}
