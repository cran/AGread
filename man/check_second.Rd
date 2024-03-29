% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/Read_IMU_Utils.R
\name{check_second}
\alias{check_second}
\title{Check if the IMU data start on an exact second}
\usage{
check_second(AG)
}
\arguments{
\item{AG}{a dataframe of IMU data}
}
\value{
A (possibly shortened) version of the input data frame, which starts
  on the first sample of the first full second of data
}
\description{
Check if the IMU data start on an exact second
}
\examples{
data(imu_to_check)
sec_check <- check_second(imu_to_check)
head(sec_check)

}
