#' Resample a sensor data stream
#'
#' This function was originally developed to correct sensor packets when sampled
#' more or fewer times than expected over the time interval. However, this
#' function may have more far-reaching applications.
#'
#' @aliases Resample Interpolate
#' @rdname sensor_resample
#'
#' @param original_samples numeric. the original data stream
#' @param target_frequency numeric. the target sampling frequency
#' @param method character. Resampling method to apply. Currently accepts only
#'   \code{interpolate}.
#'
#' @details Currently, resampling is supported via linear interpolation and a
#'   distance-based approach. Two linear methods are supported, i.e., an R based
#'   version (\code{method="interpolate_R"}) and a C++ based version
#'   (\code{method="interpolate_C"}). The latter is used by default. The
#'   distance-based approach is used for resampling/interpolating SENSOR_DATA
#'   packets (i.e., IMU data).
#'
#' @return An appropriately up/down-sampled data stream (numeric vector)
#' @export
#'
#' @examples
#' set.seed(14)
#' target_frequency <- 100
#'
#' ## Downsample linear
#'    original_samples <- sample(
#'      seq(1.3,2.4,0.12), 101, replace = TRUE
#'    )
#'    down_linear <- sensor_resample(
#'      original_samples, target_frequency
#'    )
#'    head(down_linear)
#'
#' ## Upsample linear
#'    original_samples <- original_samples[1:99]
#'    up_linear <- sensor_resample(
#'      original_samples, target_frequency
#'    )
#'    head(up_linear)
#'
#' ## Upsample IMU
#'    up_IMU <- sensor_resample(
#'      original_samples, target_frequency, "IMU"
#'    )
#'    head(up_IMU)
sensor_resample <- function(
  original_samples, target_frequency,
  method = c("linear_C", "linear_R", "IMU")
) {

  if (length(original_samples) == target_frequency) {
    return(original_samples)
  }

  method <- match.arg(method)

  switch(
    method,
    "linear_R" = interpolate_R(
      original_samples, target_frequency
    ),
    "linear_C" = interpolate_C(
      original_samples, target_frequency
    ),
    "IMU" = interpolate_IMU(
      original_samples, target_frequency
    )
  )

}

#' @rdname sensor_resample
#' @aliases Resample Interpolate
#' @keywords internal
interpolate_R <- function(
  original_samples, target_frequency
) {

  intervals <- seq(0, 1, along.with = original_samples)

  ## Interpolation information
    prop_min <- intervals[-length(intervals)]
    ref_interval <- cut(
      prop_min, intervals,
      right = FALSE, include.lowest = TRUE
    )
    start <- original_samples[-length(original_samples)]
    rise  <- diff(original_samples)
    run   <- diff(intervals)

  ## New Data
    proportion <- seq(
      0, target_frequency - 1
    )/target_frequency

    index <- cut(
      proportion, intervals,
      right = FALSE, include.lowest = TRUE
    )

    stopifnot(identical(
      levels(index), levels(ref_interval)
    ))

    index <- as.numeric(index)

    window_fraction <- (
      proportion - prop_min[index]
    ) / run[index]

    stopifnot(
      all(window_fraction <= 1),
      all(window_fraction >= 0)
    )

    start[index] + (rise[index] * window_fraction)

}
