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
* Added option to return raw (uncollapsed) data (#3, @srlamunion)
* Updated time stamp calculations and time zone specifications where needed
* Set up automated testing for continued development


# AGread 0.1.2
## Summary
    This is a resubmission of the original version
## Changes
* Added a summary of what ActiGraph monitors measure
    in DESCRIPTION
* Unwrapped examples from \dontrun{} where feasible
* Improved the documentation of classify_magnetometer()
* Exported AG_meta()

# AGread 0.1.1
## Summary
    This is a resubmission of the original version
## Changes
* Added Vincent van Hees as contributor
* Added URL and BugReports fields to DESCRIPTION

# AGread 0.1.0
## Summary
* This is the initial version of `AGread`.



