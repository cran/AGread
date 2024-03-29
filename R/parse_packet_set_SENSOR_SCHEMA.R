#' @rdname parse_packet_set
#' @export
parse_packet_set.SENSOR_SCHEMA <- function(
  set, log, tz = "UTC", verbose = FALSE,
  payload = NULL, ...
) {

  BYTES_PER_COLUMN <- 23

  if (is.null(payload)) {
    payload <- setup_payload(set, log)
  }

  schema <- schema_meta(payload)

  stopifnot(
    (schema$columns * BYTES_PER_COLUMN) + 6 ==
      length(payload)
  )

  for (i in seq(schema$columns) - 1) {

    startingOffset <- 7 + (BYTES_PER_COLUMN * i)

    columnFlags <- payload[startingOffset]

    bigEndian <- bin_int(
      logical_bits(columnFlags[1]) &
        logical_bits(as.raw(1))
    ) != 0
    signed <- bin_int(
      logical_bits(columnFlags[1]) &
        logical_bits(as.raw(2))
    ) != 0

    columnOffset <- payload[startingOffset + 1]
    columnSize <- payload[startingOffset + 2]
    value <- payload[startingOffset + 3:6]

    columnScaleFactor <- mid_round(
      get_float_value(value), 6
    )

    columnLabel <- rawToChar(payload[startingOffset + 7:22])
    columnLabel <- gsub("^ *", "", gsub(" *$", "", columnLabel))
    columnLabel <- gsub(" ", "_", columnLabel)
    columnLabel <- ifelse(columnLabel == "", "Discard", columnLabel)

    new_column <- data.frame(
      is_big_endian = bigEndian,
      is_signed = signed,
      offset = readBin(
        columnOffset, "integer", 1, 1, FALSE, "little"
      ),
      offset_bytes = readBin(
        columnOffset, "integer", 1, 1, FALSE, "little"
      ) / 8,
      size = readBin(
        columnSize, "integer", 1, 1, FALSE, "little"
      ),
      n_bytes = readBin(
        columnSize, "integer", 1, 1, FALSE, "little"
      ) / 8,
      scale_factor = columnScaleFactor,
      label = columnLabel,
      stringsAsFactors = FALSE,
      row.names = NULL
    )

    schema$sensorColumns <- rbind(schema$sensorColumns, new_column)

  }

  if (schema$samples == 0) {
    schema$samples <- 100
  }

  if (verbose) packet_print("cleanup", "SENSOR_SCHEMA")

  structure(schema, class = "SENSOR_SCHEMA")

}

#' Parse metadata from a SENSOR_SCHEMA packet
#'
#' @param payload raw. the packet payload
#'
#' @keywords internal
#'
schema_meta <- function(payload) {

  id <- payload[1:2]
  id <- readBin(
    id, "integer", 2, 2, TRUE, "little"
  )

  columns <- payload[3:4]
  columns <- readBin(
    columns, "integer", 2, 2, TRUE, "little"
  )

  samples <- payload[5:6]
  samples <- readBin(
    samples, "integer", 2, 2, TRUE, "little"
  )

  return(
    list(
      id = id, columns = columns,
      samples = samples, sensorColumns = data.frame()
    )
  )
}
