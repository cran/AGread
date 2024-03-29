% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/Read_IMU_Magnetometer_Directions.R
\name{classify_magnetometer}
\alias{classify_magnetometer}
\title{Convert magnetometer signal to cardinal direction}
\usage{
classify_magnetometer(
  x = "Magnetometer X",
  y = "Magnetometer Y",
  z = "Magnetometer Z",
  orientation = c("vertical", "horizontal")
)
}
\arguments{
\item{x}{x-axis magnetometer data}

\item{y}{y-axis magnetometer data}

\item{z}{z-axis magnetometer data}

\item{orientation}{the conversion scheme to use, from c("vertical",
"horizontal")}
}
\value{
A vector of cardinal directions assigned from the set
    {N, NNE, NE, ENE, E, ESE, SE, SSE, S,
     SSW, SW, WSW, W, WNW, NW, NNW}, where N, E, S, and W are
     north, east, south, and west, respectively.
}
\description{
Convert magnetometer signal to cardinal direction
}
\examples{
data(imu_to_collapse)

X <- mean(imu_to_collapse$Magnetometer.X)
Y <- mean(imu_to_collapse$Magnetometer.Y)
Z <- mean(imu_to_collapse$Magnetometer.Z)

classify_magnetometer(X, Y, Z)

}
\seealso{
\url{http://s3.amazonaws.com/actigraphcorp.com/wp-content/uploads/2017/11/26205750/ActiGraph_IMU_White_Paper.pdf}
}
