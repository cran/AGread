# Generated by using Rcpp::compileAttributes() -> do not edit by hand
# Generator token: 10BE3573-1514-4C36-9D1C-5A225CD40393

#' @rdname get_VM
#' @param x NumericVector. X-axis values
#' @param y NumericVector. Y-axis values
#' @param z NumericVector. Z-axis values
#' @keywords internal
get_VM_C <- function(x, y, z) {
    .Call('_AGread_get_VM_C', PACKAGE = 'AGread', x, y, z)
}

#' Find the next record separator
#'
#' @param log RawVector. The contents of log.bin
#' @param index int. The starting index from which to search for a record
#'   separator
#' @keywords internal
next_separator <- function(log, index) {
    .Call('_AGread_next_separator', PACKAGE = 'AGread', log, index)
}

#' Collect information about the packets stored in log.bin
#'
#' @param x RawVector. The contents of log.bin
#' @param verbose bool. Print updates to console?
#' @keywords internal
get_headersC <- function(x, verbose) {
    .Call('_AGread_get_headersC', PACKAGE = 'AGread', x, verbose)
}

#' @rdname impute_primary
#' @param vector_size int. The size of the final vector
#' @param accel_input NumericVector. The accelerometer values to reference for
#'   latching
#' @param samp_rate int. The sampling rate
#' @keywords internal
latch_accel <- function(vector_size, accel_input, samp_rate) {
    .Call('_AGread_latch_accel', PACKAGE = 'AGread', vector_size, accel_input, samp_rate)
}

#' @rdname impute_primary
#' @param missing_times vector of missing timestamps for which to identify a
#'   latch index
#' @param reference_times vector of reference timestamps for use in determining
#'   the latch index
#' @keywords internal
get_latch_index <- function(missing_times, reference_times) {
    .Call('_AGread_get_latch_index', PACKAGE = 'AGread', missing_times, reference_times)
}

#' @rdname impute_primary
#' @param indices IntegerVector containing latch indices
#' @param RAW DataFrame containing raw acceleration data
#' @keywords internal
get_latch_values <- function(indices, RAW) {
    .Call('_AGread_get_latch_values', PACKAGE = 'AGread', indices, RAW)
}

#' @rdname impute_primary
#' @param timestamps vector of timestamps on which to perform latching
#' @param accel_x vector of x-axis accelerations on which to perform latching
#' @param accel_y vector of y-axis accelerations on which to perform latching
#' @param accel_z vector of z-axis accelerations on which to perform latching
#' @param return_empty bool. Return an empty data frame?
#' @keywords internal
get_latch_entries <- function(samp_rate, timestamps, accel_x, accel_y, accel_z, return_empty = FALSE) {
    .Call('_AGread_get_latch_entries', PACKAGE = 'AGread', samp_rate, timestamps, accel_x, accel_y, accel_z, return_empty)
}

#' @rdname impute_primary
#' @keywords internal
latch_replicate <- function(start_time, stop_time, x_val, y_val, z_val) {
    .Call('_AGread_latch_replicate', PACKAGE = 'AGread', start_time, stop_time, x_val, y_val, z_val)
}

#' Determine the expected timestamps for primary accelerometer output
#' @param start The file start time
#' @param end The file end time
#' @param samp_rate int. The sampling rate
#' @keywords internal
get_times <- function(start, end, samp_rate) {
    .Call('_AGread_get_times', PACKAGE = 'AGread', start, end, samp_rate)
}

#' Flexibly (big/little endian, signed/unsigned) convert two raw bytes to short
#'
#' @param x the bytes (RawVector) from which to extract the short
#' @param i1 integer. The index of the first byte
#' @param i2 integer. The index of the second byte
#' @param is_signed boolean. Return a signed value?
#'
#' @keywords internal
get_short <- function(x, i1, i2, is_signed) {
    .Call('_AGread_get_short', PACKAGE = 'AGread', x, i1, i2, is_signed)
}

#' Perform midpoint rounding the ActiGraph way
#'
#' This function is inefficient but necessary to ensure alignment between
#' \code{\link{read_gt3x}} and \code{\link{read_AG_raw}}
#'
#' @param input double. The number to round
#' @param digits int. The number of digits to round to
#'
#' @keywords internal
mid_round <- function(input, digits) {
    .Call('_AGread_mid_round', PACKAGE = 'AGread', input, digits)
}

#' Print progress updates while parsing packets in C++
#'
#' @param n percentage progress
#' @param label the packet type, as character
#'
#' @keywords internal
print_progC <- function(n, label) {
    invisible(.Call('_AGread_print_progC', PACKAGE = 'AGread', n, label))
}

#' Calculate checksum for a packet in C++
#'
#' @param log RawVector representing the contents of log.bin
#' @param start_index the packet start index
#' @param end_index the packet end index
#'
#' @keywords internal
checksumC <- function(log, start_index, end_index) {
    invisible(.Call('_AGread_checksumC', PACKAGE = 'AGread', log, start_index, end_index))
}

#' @rdname impute_primary
#' @param gaps DataFrame with gap information
#' @keywords internal
impute_C <- function(gaps, object) {
    .Call('_AGread_impute_C', PACKAGE = 'AGread', gaps, object)
}

#' Parse all IMU packets in a file
#'
#' @param imu_records DataFrame with information about each packet
#' @param log RawVector containing all payload bytes
#' @param info The \code{sensorColumns} information of a \code{SENSOR_SCHEMA}
#'   object
#' @param id integer. The \code{id} information of a \code{SENSOR_SCHEMA}
#'   object
#' @param samp_rate integer. The IMU sampling rate.
#' @param verbose logical. Print updates to console?
#' @keywords internal
parse_IMU_C <- function(imu_records, log, info, id, samp_rate, verbose) {
    .Call('_AGread_parse_IMU_C', PACKAGE = 'AGread', imu_records, log, info, id, samp_rate, verbose)
}

#' Interpolation-specific sequencer
#'
#' @param samples NumericVector. A data stream.
#' @keywords internal
zero2one <- function(samples) {
    .Call('_AGread_zero2one', PACKAGE = 'AGread', samples)
}

#' Match a resampled interval proportion to its corresponding
#' originally-sampled interval in C++.
#'
#' @param proportion double. The interval proportion to match.
#' @param reference_frame DataFrame containing a \code{prop_min} column to
#'   serve as originally-sampled interval proportions
#'
#' @keywords internal
interval_match <- function(proportion, references) {
    .Call('_AGread_interval_match', PACKAGE = 'AGread', proportion, references)
}

#' @rdname sensor_resample
#' @aliases Resample Interpolate
#' @keywords internal
interpolate_C <- function(original_samples, target_frequency) {
    .Call('_AGread_interpolate_C', PACKAGE = 'AGread', original_samples, target_frequency)
}

#' @rdname sensor_resample
#' @aliases Resample Interpolate
#' @keywords internal
interpolate_IMU <- function(original_samples, target_frequency) {
    .Call('_AGread_interpolate_IMU', PACKAGE = 'AGread', original_samples, target_frequency)
}

#' Check sensor payload ID prior to parsing the packet
#'
#' @param x the raw payload
#' @param id integer. The \code{SENSOR_SCHEMA} id
#'
#' @keywords internal
check_id <- function(x, id) {
    invisible(.Call('_AGread_check_id', PACKAGE = 'AGread', x, id))
}

#' Convert parsed packet data from list to data frame
#'
#' @param input parsed packet data (as list)
#'
#' @keywords internal
imu_df <- function(input) {
    .Call('_AGread_imu_df', PACKAGE = 'AGread', input)
}

#' Parse SENSOR_DATA packet in c++
#'
#' @param payload raw vector of payload bytes
#' @param info \code{sensorColumns} information from a \code{SENSOR_SCHEMA}
#'   object
#' @param id integer. The \code{id} information from a \code{SENSOR_SCHEMA}
#'   object
#' @param samp_rate integer. The IMU sampling rate.
#' @param timestamp Datetime. The packet timestamp
#'
#' @keywords internal
payload_parse_sensor_data_25C <- function(payload, info, id, samp_rate, timestamp) {
    .Call('_AGread_payload_parse_sensor_data_25C', PACKAGE = 'AGread', payload, info, id, samp_rate, timestamp)
}

#' Parse a packet of primary accelerometer data in C++
#'
#' @param payload RawVector containing the payload bytes
#' @param is_last_packet logical. Is this the last packet in the file?
#' @param samp_rate integer reflecting the sampling rate
#' @param scale_factor integer reflecting the scale factor
#' @param timestamp Datetime. The packet timestamp
#'
#' @keywords internal
payload_parse_activity2_26C <- function(payload, samp_rate, scale_factor, is_last_packet, timestamp) {
    .Call('_AGread_payload_parse_activity2_26C', PACKAGE = 'AGread', payload, samp_rate, scale_factor, is_last_packet, timestamp)
}

#' Parse all primary accelerometer packets in a file
#'
#' @param primary_records DataFrame with information about each packet
#' @param log RawVector containing all payload bytes
#' @param samp_rate the sampling rate
#' @param scale_factor the accelerometer scale factor
#' @param verbose logical. Print updates to console?
#' @keywords internal
parse_primary_accelerometerC <- function(primary_records, log, scale_factor, samp_rate, verbose) {
    .Call('_AGread_parse_primary_accelerometerC', PACKAGE = 'AGread', primary_records, log, scale_factor, samp_rate, verbose)
}

