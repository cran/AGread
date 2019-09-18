#include <Rcpp.h>
#include "helpers.h"
#include "primary_payload.h"
using namespace Rcpp;

//' Parse all primary accelerometer packets in a file
//'
//' @param primary_records DataFrame with information about each packet
//' @param log RawVector containing all payload bytes
//' @param samp_rate the sampling rate
//' @param scale_factor the accelerometer scale factor
//' @param verbose logical. Print updates to console?
//' @keywords internal
// [[Rcpp::export]]
List parse_primary_accelerometerC(
    DataFrame primary_records, RawVector log,
    int scale_factor, int samp_rate, bool verbose
) {

  int n_records = primary_records.nrow();
  IntegerVector indices = primary_records["index"];
  IntegerVector sizes = primary_records["payload_size"];
  CharacterVector timestamps = primary_records["timestamp"];

  List result(0); //initialize

  for (int i = 0; i < n_records; ++i) {

    //Set up printing
    if (verbose) {
      double prop(i);
      prop = prop / n_records;
      int perc = floor(prop * 100);
      Rcout << "\r";
      print_progC(perc, "ACTIVITY2");
    }

    //Establish log position
    int start_index = indices[i] - 1; //clone somehow?
    int end_index = start_index + 8 + sizes[i]; //clone somehow?
    checksumC(log, start_index, end_index);
    IntegerVector record_indices = seq(start_index, end_index);
    IntegerVector payload_indices = seq(start_index + 8, end_index - 1);
    RawVector payload = log[payload_indices];
    if (payload_indices.size() != sizes[i]) {
      stop("Payload size does not match expectation.");
    }

    //Process the packet
    bool is_last_packet = i == (n_records - 1);
    DataFrame new_result = payload_parse_activity2_26C(
      payload, samp_rate, scale_factor, is_last_packet
    );

    CharacterVector new_timestamp(0);
    for (int j = 0; j < new_result.nrows(); ++j) {
      new_timestamp.push_back(timestamps[i]);
    }
    new_result.push_front(new_timestamp, "Timestamp");
    result.push_back(new_result);

  }

  if (verbose) {
    Rcout << "\r";
    print_progC(100, "ACTIVITY2");
  }

  return result;

}
