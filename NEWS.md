# AGread 1.3.2

  `collapse_packet_set` has been moved to internal, consistent
  with the original intent
  
  
# AGread 1.3.1

  Package documentation has been updated in response to requests from CRAN.


# AGread 1.3.0

  Dependency on the `binaryLogic` package has been circumvented, as the latter
  package was archived in April 2022.
  
  Additionally, reintegration has been restructured with both of the
  previously-implemented methods now available in a single `reintegrate`
  function

## Changes

  * Removed dependency on `binaryLogic`
  * Updated the interface for reintegration
  * Added header skip recognition in csv-reading-related functions
  * Enhanced the external parser including alignment checks with internal
    cache of test files.


# AGread 1.2.0

  * Added reintegrate2
  * Added a `parser = "external"` option for `read_gt3x`, which serves
    as a wrapper and formatter around `read.gt3x::read.gt3x`

## Changes

  * Fixed bugs related to overload and argument classes
  
  
  
# AGread 1.1.0

## Changes

  * Revised interpolation schemes where necessary to ensure
    matching output between `read_gt3x` and exported csv files
  * Resolved type mismatch in declaration/definition for
    IMU sensor parsing
  * Incorporated idle sleep mode assessment
  * Updated unit test cache
  * Utilized pre-allocation to speed up code (#15, @muschellij2)
  * Accounted for trailing zeroes in packets
  * Fixed column name detection in `read_AG_counts`



# AGread 1.0.0

## Summary

  Version 1.0.0 features speedup via Rcpp in the `read_gt3x`
  function. There is also increased reliance on S3 OOP
  in the background code. The output is now successfully
  tested for alignment with \*RAW.csv and \*-IMU.csv
  output, having accounted for several issues noted below.
      
## Changes

  * Revised the flow of `parse_log_bin` to handle packet sets
    via S3
  * Accounted for USB connections in `gt3x` files
  * Corrected the interpolation of over- or under-sampled
    IMU packets
  * Incorporated Rcpp to speed up `read_gt3x`
  * Deprecated `get_duration` in favor of the equivalent
    function in PAutilities
  * Revised unit tests to ensure equivalence between various
    reading methods (csv output vs gt3x output etc.)
  * Updated example data



# AGread 0.2.2

## Summary

  Resubmission of version 0.2.0
    
## Changes

  * The license has been changed from GPL-3 to MIT, to accommodate the
    usage conditions of material derived from
    <https://github.com/actigraph/GT3X-File-Format>.



# AGread 0.2.1

## Summary

  Resubmission of version 0.2.0
    
## Changes

  * LICENSE was updated in the submission of version 0.2.0, but the changes were
    not documented. In this resubmission, DESCRIPTION has been updated accordingly.
    Specifically, copyright ownership has been clarified, related to the use of
    open source material from
    <https://github.com/actigraph/GT3X-File-Format>, and contributors have been
    listed from the same site. The license field of
    DESCRIPTION has been changed to `file LICENSE` to prevent misrepresentation
    of the package copyright.
    
  * Dependency `reshape2` was removed to resolve a NOTE in CRAN checks for
    r-devel-linux-x86_64-fedora-clang, r-devel-linux-x86_64-fedora-gcc, and
    r-patched-solaris-x86.
    
  * Documentation was updated.
    
  
    
# AGread 0.2.0

## Summary

  In this update, the key new feature is support for reading binary
  .gt3x files. Other bugs have been solved related to time variables,
  and particularly calculations in epoch lengths other than 1-s. The
  major changes are noted below.
    
## Changes

  * Added support for reading binary .gt3x files
  * Added reintegration function
  * Expanded support for files with inclinometer columns, to allow un-coded or
      dummy-coded data
  * Added chunking as an option for reading RAW.csv files that are too large
      and cause memory issues
  * Added option to apply autocalibration with GGIR
  * Added option to return raw (un-collapsed) data (#3, @srlamunion)
  * Updated time stamp calculations and time zone specifications where needed
  * Set up automated testing for continued development



# AGread 0.1.2

## Summary

  Resubmission of original version
  
## Changes

  * Added a summary of what ActiGraph monitors measure
    in DESCRIPTION
  * Unwrapped examples from \dontrun{} where feasible
  * Improved the documentation of classify_magnetometer()
  * Exported AG_meta()



# AGread 0.1.1

## Summary

  Resubmission of original version
  
## Changes

  * Added Vincent van Hees as contributor
  * Added URL and BugReports fields to DESCRIPTION



# AGread 0.1.0

## Summary

  * Initial package version
